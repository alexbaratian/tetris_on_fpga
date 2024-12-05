module  color_mapper ( 
    input  logic [9:0]          DrawX, DrawY,
    input  logic [12:0][23:0]   grid,
    input logic [11:0][14:0]     score_grid,
    output logic [3:0]          Red, Green, Blue 
);
    
    logic [9:0] grid_x;
    logic [9:0] grid_y;
    logic [9:0] grid_x_score;
    logic [9:0] grid_y_score;    
    logic [1:0] is_grid;            // to determine if the pixel is part of the main grid
    logic [1:0] is_score_grid;      // to determine if the pixel is part of the score grid
    logic borders_main;
    logic borders_score;

    always_comb begin
        grid_x = DrawX / 24;        // main grid cell is 24 pixels wide
        grid_y = DrawY / 24;        // main grid cell is 24 pixels tall
        
        grid_x_score = DrawX / 12;  // score grid cell is 12 pixels wide
        grid_y_score = DrawY / 12;  // score grid cell is 12 pixels tall
        
        borders_main = (DrawX % 24 > 22 || DrawX % 24 < 1 
        || DrawY % 24 > 22 || DrawY % 24 < 1) ? 1'b1 : 1'b0;    // main grid borders
        
        borders_score = (DrawX % 12 > 10 || DrawX % 12 < 1 
        || DrawY % 12 > 10 || DrawY % 12 < 1) ? 1'b1 : 1'b0;    // score grid borders
        
        // check bounds for main grid
        is_grid = (grid_x >= 200/24 && grid_x < (10 + 200/24) && grid_y < 20)
         ? grid[grid_x - (200/24)][grid_y + 4] : 2'b10;

        // check bounds for score grid
        is_score_grid = (grid_x_score >= 2*(11 + 200/24) && grid_x_score < 2*(17 + 200/24) && 
        grid_y_score >= 3 && grid_y_score < 18)
         ? score_grid[grid_x_score - 2*(11 + 200/24)][grid_y_score - 3] : 2'b10;
         
         
        // assign color based on foreground or background
        if (is_grid == 2'b01) begin
            if (borders_main == 1'b1) begin
                // Border - white
                Red = 4'hf;     // white
                Green = 4'hf;   // white
                Blue = 4'hf;    // white            
            end else begin
                // Foreground color - orange
                Red = 4'hf;     // orange
                Green = 4'h7;   // orange
                Blue = 4'h0;    // orange
            end
        end 
        
        else if (is_grid == 2'b00) begin
            if (borders_main == 1'b1) begin
                // Border - white
                Red = 4'hf;     // white
                Green = 4'hf;   // white
                Blue = 4'hf;    // white            
            end else begin
                // Background color - blue
                Red = 4'd1;     // blue
                Green = 4'd3;   // blue
                Blue = 4'h5;    // blue  
            end
        end
        
        else if (is_score_grid == 2'b01 && grid_y_score < 8) begin // printing the score
            if (borders_score == 1'b1) begin
                // Border - black                    
                Red = 4'h0;     // black
                Green = 4'h0;   // black
                Blue = 4'h0;    // black   
            end else begin    
                // Score foreground - white
                Red = 4'hf;     // white
                Green = 4'hf;   // white
                Blue = 4'hf;    // white               
            end
        end

        else if (is_score_grid == 2'b01 && grid_y_score >= 8) begin // printing the UIUC logo
            if (borders_score == 1'b1) begin
                // Border - orange                    
                Red = 4'hf;     // orange
                Green = 4'h7;   // orange
                Blue = 4'h0;    // orange  
            end else begin    
                // UIUC logo - orange
                Red = 4'hf;     // orange
                Green = 4'h7;   // orange
                Blue = 4'h0;    // orange
            end
        end
        
        else if (is_score_grid == 2'b00) begin
            if (borders_score == 1'b1) begin
                // Border - black                    
                Red = 4'h0;     // black
                Green = 4'h0;   // black
                Blue = 4'h0;    // black       
            end else begin
                // Score background - black 
                Red = 4'h0;     // black
                Green = 4'h0;   // black
                Blue = 4'h0;    // black 
            end          
        end        
        
        else begin
            Red = 4'd0;         // black
            Green = 4'd0;       // black
            Blue = 4'h0;        // black          
        end
    end
    
endmodule
