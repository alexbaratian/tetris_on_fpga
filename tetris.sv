module  tetris 
( 
    input  logic              Reset, 
    input  logic              frame_clk,
    input  logic [7:0]        keycode,

    output logic [12:0][23:0] grid,
    output logic [9:0]        score
);
    parameter int FREQ_DIV = 40;        // adjusting to control step frequency
    
    logic [31:0] counter;               // counter for frequency division
    logic slow_clk;                     // slower clock signal for the step  
    
    logic [3:0][3:0] curr_figure;       // the current figure being drawn
    logic [4:0] figure;                 // the index of the figure being drawn

    logic [4:0] curr_figure_x_coord;    // top left x coordinate of 4x4 window
    logic [4:0] curr_figure_y_coord;    // top left y coordinate of 4x4 window
    
    logic can_fall;
    logic can_right;
    logic can_left;
    logic move;                         // part of the logic to enable only 1 action per button press
    logic can_rotate;
    
    logic [3:0] right_figure_x;
    logic right_column_empty;
    
    logic row_filled;
    logic [31:0] random_number;
    logic [15:0] down_counter;    
    logic game_in_progress;
    logic lost;

    figures figures_curr (              // get the data for the current figure
        .figure(figure),
        .curr_figure(curr_figure)
    );

    logic [3:0][3:0] next_figure_rotation;
    logic [4:0] next_figure_rotation_idx;
    assign next_figure_rotation_idx = (figure % 4 == 3) ? figure - 3 : figure + 1;
    
    figures figures_next_rotation (     // get the data for the next possible rotation
        .figure(next_figure_rotation_idx),
        .curr_figure(next_figure_rotation)
    );            
          
    // frequency division logic
    always_ff @(posedge frame_clk or posedge Reset) begin
        if (Reset) begin
            counter <= 0;
            slow_clk <= 0;
            random_number <= 0;
        end else if (counter >= FREQ_DIV) begin
            counter <= 0;
            slow_clk <= ~slow_clk;
            random_number <= random_number + 1;
        end else begin
            counter <= counter + 1;
            random_number <= random_number + 1;
        end
    end
   
   
    always_ff @(posedge Reset or posedge frame_clk)
    begin: Move_Block
        if (Reset) // full reset (game hasn't started, draw the starting screen)
        begin
            // draw space symbol start
            for (int x = 0; x < 10; x++) begin
                for (int y = 0; y < 24; y++) begin
                    grid[x][y] <= 1'b1;     // set all cells to 1
                end
            end
            grid[3][12]  <= 1'b0;                                                      grid[6][12]  <= 1'b0; 
            grid[3][13]  <= 1'b0;    grid[4][13]  <= 1'b0;    grid[5][13]  <= 1'b0;    grid[6][13]  <= 1'b0;           
            // draw space symbol end
            can_fall <= 0;
            score <= 0;
            game_in_progress <= 0;
            lost <= 0;
        end
        else if (keycode == 8'h2c && (game_in_progress == 1'b0 || lost == 1'b1)) begin // trigger start/restart
            for (int x = 0; x < 10; x++) begin
                for (int y = 0; y < 24; y++) begin
                    grid[x][y] <= 1'b0;     // set all cells to 0
                end
            end
            figure <= (random_number % 7) * 4;
            curr_figure_x_coord <= 3;
            curr_figure_y_coord <= 0;
            can_fall <= 1;
            score <= 0;
            game_in_progress <= 1;
            lost <= 0;      
        end    
        else if (game_in_progress == 1'b0)  // game hasn't started, draw the starting screen
        begin
            // draw space symbol start
            for (int x = 0; x < 10; x++) begin
                for (int y = 0; y < 24; y++) begin
                    grid[x][y] <= 1'b1;     // set all cells to 1
                end
            end
            grid[3][12]  <= 1'b0;                                                      grid[6][12]  <= 1'b0; 
            grid[3][13]  <= 1'b0;    grid[4][13]  <= 1'b0;    grid[5][13]  <= 1'b0;    grid[6][13]  <= 1'b0;           
            // draw space symbol end
            can_fall <= 0;
            score <= 0;
            game_in_progress <= 0;
            lost <= 0;
        end        

        else if (can_fall && lost == 1'b0)      // fall
        begin
            if (keycode == 0) begin
                move = 1;
                down_counter = 0;
            end

            if (counter >= FREQ_DIV) begin
                for (int block_x = 0; block_x < 4; block_x++) begin
                    for (int block_y = 0; block_y < 4; block_y++) begin
                        if (curr_figure[block_x][block_y] == 1'b1) begin
                            grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b0;
                        end
                    end
                end       
                curr_figure_y_coord = curr_figure_y_coord + 1;
                for (int block_x = 0; block_x < 4; block_x++) begin // print the figure
                    for (int block_y = 0; block_y < 4; block_y++) begin
                        if (curr_figure[block_x][block_y] == 1'b1) begin
                            grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b1;
                        end
                    end
                end
                /////////////////////// can_fall logic start (for the next clock cycle)
                if (curr_figure_y_coord < (24 - 4)) begin // if haven't reached bottom border of the grid
                    can_fall <= 1'b1;
                    for (int block_x = 0; block_x < 4; block_x++) begin
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (block_y == 3) begin // checking the bottom row of the figure
                                if (curr_figure[block_x][block_y] == 1'b1
                                && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1) begin
                                    can_fall <= 1'b0;
                                end                            
                            end else begin
                                if (curr_figure[block_x][block_y] == 1'b1
                                && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1
                                && curr_figure[block_x][block_y + 1] == 1'b0) begin
                                    can_fall <= 1'b0;
                                end
                            end
                        end
                    end           
                end else begin
                    can_fall <= 1'b0;
                end
                /////////////////////// can_fall logic end
            end                 
            
            else if (keycode == 8'h4 && move == 1'b1) // A (move left)
            begin
                /////////////////////// can_left logic
                move = 0;
                if (curr_figure_x_coord > 0) begin // if haven't reached left border
                    can_left = 1'b1;
                    for (int block_x = 0; block_x < 4; block_x++) begin // clear the figure
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b0;
                            end
                        end
                    end       
                    curr_figure_x_coord = curr_figure_x_coord - 1;
                    for (int block_x = 0; block_x < 4; block_x++) begin // check for overlap
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1 
                            && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] == 1'b1) begin
                                can_left = 1'b0;
                            end
                        end
                    end
                    
                    if (can_left == 1'b0) begin
                        curr_figure_x_coord = curr_figure_x_coord + 1;           
                    end

                    for (int block_x = 0; block_x < 4; block_x++) begin // print the figure
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b1;
                            end
                        end
                    end
                    /////////////////////// can_fall logic start (for the next clock cycle)
                    if (curr_figure_y_coord < (24 - 4)) begin // if haven't reached bottom border of the grid
                        can_fall <= 1'b1;
                        for (int block_x = 0; block_x < 4; block_x++) begin
                            for (int block_y = 0; block_y < 4; block_y++) begin
                                if (block_y == 3) begin // checking the bottom row of the figure
                                    if (curr_figure[block_x][block_y] == 1'b1
                                    && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1) begin
                                        can_fall <= 1'b0;
                                    end                            
                                end else begin
                                    if (curr_figure[block_x][block_y] == 1'b1
                                    && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1
                                    && curr_figure[block_x][block_y + 1] == 1'b0) begin
                                        can_fall <= 1'b0;
                                    end
                                end
                            end
                        end           
                    end else begin
                        can_fall <= 1'b0;
                    end
                    /////////////////////// can_fall logic end                                        
                end else begin
                    can_left = 1'b0;
                end                    
            end       

            else if (keycode == 8'h7 && move == 1'b1) // D (move right)
            begin
                /////////////////////// can_right logic
                move = 0;
                can_right = 1'b0;
                
                // when curr_figure_x_coord > 5
                right_column_empty = 1'b1;
                if (curr_figure_x_coord == 5'd6) begin
                    right_figure_x = 4'd3;
                end
                else if (curr_figure_x_coord == 5'd7) begin
                    right_figure_x = 4'd2;
                end
                else if (curr_figure_x_coord == 5'd8) begin
                    right_figure_x = 4'd1;
                end
                else if (curr_figure_x_coord == 5'd9) begin
                    right_figure_x = 4'd0;
                end
                for (int block_y = 0; block_y < 4; block_y++) begin
                    if (curr_figure[right_figure_x][block_y] == 1'b1) begin
                        right_column_empty = 1'b0;
                    end
                end
                //
                
                if (curr_figure_x_coord < 6 || right_column_empty == 1'b1) begin // if haven't reached right border
                    can_right = 1'b1;
                    for (int block_x = 0; block_x < 4; block_x++) begin // clear the figure
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b0;
                            end
                        end
                    end
                    curr_figure_x_coord = curr_figure_x_coord + 1;
                    for (int block_x = 0; block_x < 4; block_x++) begin
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1 
                            && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] == 1'b1) begin
                                can_right = 1'b0;
                            end
                        end
                    end
                    
                    if (can_right == 1'b0) begin
                        curr_figure_x_coord = curr_figure_x_coord - 1;           
                    end

                    for (int block_x = 0; block_x < 4; block_x++) begin // print the figure
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b1;
                            end
                        end
                    end                                      
                    /////////////////////// can_fall logic start (for the next clock cycle)
                    if (curr_figure_y_coord < (24 - 4)) begin // if haven't reached bottom border of the grid
                        can_fall <= 1'b1;
                        for (int block_x = 0; block_x < 4; block_x++) begin
                            for (int block_y = 0; block_y < 4; block_y++) begin
                                if (block_y == 3) begin // checking the bottom row of the figure
                                    if (curr_figure[block_x][block_y] == 1'b1
                                    && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1) begin
                                        can_fall <= 1'b0;
                                    end                            
                                end else begin
                                    if (curr_figure[block_x][block_y] == 1'b1
                                    && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1
                                    && curr_figure[block_x][block_y + 1] == 1'b0) begin
                                        can_fall <= 1'b0;
                                    end
                                end
                            end
                        end           
                    end else begin
                        can_fall <= 1'b0;
                    end
                    /////////////////////// can_fall logic end                                      
                end
            end                   

            else if (keycode == 8'h16 && move == 1'b1) // S (down-acceleration)
            begin
                if (down_counter % 5 == 0) begin // making the down movement not too fast
                    score = score + 1; // award 1 point for each accelerated down movement
                    for (int block_x = 0; block_x < 4; block_x++) begin
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b0;
                            end
                        end
                    end       
                    curr_figure_y_coord = curr_figure_y_coord + 1;
                    for (int block_x = 0; block_x < 4; block_x++) begin // print the figure
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b1;
                            end
                        end
                    end                    
                end
                down_counter = down_counter + 1;
                /////////////////////// can_fall logic start (for the next clock cycle)
                if (curr_figure_y_coord < (24 - 4)) begin // if haven't reached bottom border of the grid
                    can_fall <= 1'b1;
                    for (int block_x = 0; block_x < 4; block_x++) begin
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (block_y == 3) begin // checking the bottom row of the figure
                                if (curr_figure[block_x][block_y] == 1'b1
                                && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1) begin
                                    can_fall <= 1'b0;
                                end                            
                            end else begin
                                if (curr_figure[block_x][block_y] == 1'b1
                                && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y + 1] == 1'b1
                                && curr_figure[block_x][block_y + 1] == 1'b0) begin
                                    can_fall <= 1'b0;
                                end
                            end
                        end
                    end           
                end else begin
                    can_fall <= 1'b0;
                end
                /////////////////////// can_fall logic end                                                         
            end                                   

            else if (keycode == 8'h1A &&  move == 1'b1) // W (rotate)
            begin
                /////////////////////// can_rotate logic
                move = 0;
                if ((curr_figure_x_coord <= 6) 
                || (curr_figure_x_coord <= 7 && curr_figure[0][0] == 1'b0)) begin   // if haven't reached right border
                    can_rotate = 1'b1;
                    for (int block_x = 0; block_x < 4; block_x++) begin             // clear the figure
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (curr_figure[block_x][block_y] == 1'b1) begin
                                grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b0;
                            end
                        end
                    end                    
                                        
                    for (int block_x = 0; block_x < 4; block_x++) begin
                        for (int block_y = 0; block_y < 4; block_y++) begin
                            if (next_figure_rotation[block_x][block_y] == 1'b1 
                            && grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] == 1'b1) begin
                                can_rotate = 1'b0;
                            end
                        end
                    end
                    
                    if (can_rotate == 1'b0) begin   // print the same figure without rotating
                        for (int block_x = 0; block_x < 4; block_x++) begin
                            for (int block_y = 0; block_y < 4; block_y++) begin
                                if (curr_figure[block_x][block_y] == 1'b1) begin
                                    grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b1;
                                end
                            end
                        end                        
                    end else begin                  // print the rotated figure
                        for (int block_x = 0; block_x < 4; block_x++) begin
                            for (int block_y = 0; block_y < 4; block_y++) begin
                                if (next_figure_rotation[block_x][block_y] == 1'b1) begin
                                    grid[curr_figure_x_coord + block_x][curr_figure_y_coord + block_y] = 1'b1;
                                end
                            end
                        end                     
                        figure = (figure % 4 == 3) ? figure - 3 : figure + 1;
                    end
                end else begin
                    can_rotate = 1'b0;
                end
            end
          
		end else if (game_in_progress == 1'b1) begin
		    if (curr_figure_y_coord == 0
		     || curr_figure_y_coord == 1) begin // lost, end game (print "OVER", wait for restart)
		        lost <= 1'b1;
                for (int x = 0; x < 10; x++) begin
                    for (int y = 0; y < 24; y++) begin
                        grid[x][y] <= 1'b1; // set all cells to 1
                    end
                end
                // O
                grid[1][6]  <= 1'b0;    grid[2][6]  <= 1'b0;    grid[3][6]  <= 1'b0;
                grid[1][7]  <= 1'b0;                            grid[3][7]  <= 1'b0;
                grid[1][8]  <= 1'b0;                            grid[3][8]  <= 1'b0;
                grid[1][9]  <= 1'b0;                            grid[3][9]  <= 1'b0;
                grid[1][10] <= 1'b0;    grid[2][10] <= 1'b0;    grid[3][10] <= 1'b0;
            
                // V
                grid[6][9]  <= 1'b0;                            grid[8][9]  <= 1'b0;
                grid[6][10] <= 1'b0;                            grid[8][10] <= 1'b0;
                grid[6][11] <= 1'b0;                            grid[8][11] <= 1'b0;
                grid[6][12] <= 1'b0;                            grid[8][12] <= 1'b0;
                                        grid[7][13] <= 1'b0;
            
                // E
                grid[1][14] <= 1'b0;    grid[2][14] <= 1'b0;    grid[3][14]  <= 1'b0;
                grid[1][15] <= 1'b0;
                grid[1][16] <= 1'b0;    grid[2][16] <= 1'b0;    grid[3][16]  <= 1'b0;
                grid[1][17] <= 1'b0;
                grid[1][18] <= 1'b0;    grid[2][18] <= 1'b0;    grid[3][18] <= 1'b0;
            
                // R
                grid[6][17] <= 1'b0;    grid[7][17] <= 1'b0;    grid[8][17]  <= 1'b0;
                grid[6][18] <= 1'b0;                            grid[8][18]  <= 1'b0;
                grid[6][19] <= 1'b0;    grid[7][19] <= 1'b0;    grid[8][19]  <= 1'b0;
                grid[6][20] <= 1'b0;    grid[7][20] <= 1'b0;
                grid[6][21] <= 1'b0;                            grid[8][21] <= 1'b0;               
                
		    end else begin        // reached bottom, create a new random figure
                curr_figure_x_coord = 3;
                curr_figure_y_coord = 0;
                figure <= (random_number % 7) * 4;
                can_fall <= 1'b1;
                /////////////////////// row clearing logic start - check if any rows are fully filled
                for (int y = 0; y < 24; y++) begin
                    row_filled = 1'b1;
                    for (int x = 0; x < 10; x++) begin                      // check if the row is fully filled
                        if (grid[x][y] == 1'b0) begin
                            row_filled = 1'b0;                              // not fully filled
                        end
                    end
                
                    if (row_filled) begin
                        score = score + 10;                                 // award 10 points for each cleared row
                        for (int x = 0; x < 10; x++) begin                  // clear the filled row
                            grid[x][y] = 1'b0;
                        end
                        
                        for (int y_temp = 23; y_temp > 0; y_temp--) begin   // shift down all rows above y
                            if (y_temp <= y) begin
                                for (int x = 0; x < 10; x++) begin
                                    grid[x][y_temp] = grid[x][y_temp - 1];  // copy the row above to the current row
                                end
                            end
                        end
                
                        for (int x = 0; x < 10; x++) begin                  // clear the top row
                            grid[x][0] = 1'b0;
                        end
                    end
                end                
                /////////////////////// row clearing logic end                                
            end
        end
    end
endmodule