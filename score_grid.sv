`timescale 1ns / 1ps

module score_grid(
    input  logic                Reset, 
    input  logic                frame_clk,
    input  logic [9:0]          score,
    output logic [11:0][14:0]   score_grid
);
    parameter int FREQ_DIV = 8;     // adjusting to control step frequency to correspond to the "down" movement
    logic [31:0] counter;           // counter for frequency division
    logic slow_clk;                 // slower clock signal for the step

    logic [3:0][4:0] curr_digit_1;
    logic [3:0] digit_1_idx;
    assign digit_1_idx = score % 10;
        
    digits digits_1 (               // get data for the digit representing ones
        .digit_idx(digit_1_idx),
        .curr_digit(curr_digit_1)
    );
    
    logic [3:0][4:0] curr_digit_10;
    logic [3:0] digit_10_idx;
    assign digit_10_idx = (score / 10) % 10;
        
    digits digits_10 (              // get data for the digit representing tens
        .digit_idx(digit_10_idx),
        .curr_digit(curr_digit_10)
    );
        
    logic [3:0][4:0] curr_digit_100;
    logic [3:0] digit_100_idx;
    assign digit_100_idx = (score / 100) % 10;
        
    digits digits_100 (             // get data for the digit representing hundreds
        .digit_idx(digit_100_idx),
        .curr_digit(curr_digit_100)
    );

    // frequency division logic
    always_ff @(posedge frame_clk or posedge Reset) begin
        if (Reset) begin
            counter <= 0;
            slow_clk <= 0;
        end else if (counter >= FREQ_DIV) begin
            counter <= 0;
            slow_clk <= ~slow_clk;
        end else begin
            counter <= counter + 1;
        end
    end

    
    always_ff @(posedge Reset or posedge frame_clk)
    begin: Move_Block
        if (Reset)
        begin
            for (int x = 0; x < 12; x++) begin
                for (int y = 0; y < 5; y++) begin
                    score_grid[x][y] <= 1'b0;       // set all cells to 0
                end
            end
        end
        else if (counter >= FREQ_DIV) begin
            for (int x = 0; x < 12; x++) begin
                for (int y = 0; y < 5; y++) begin
                    score_grid[x][y] <= 1'b0;       // set all cells to 0
                end
            end
            
            for (int x = 0; x < 4; x++) begin       // print "ones"
                for (int y = 0; y < 5; y++) begin
                    if (curr_digit_1[x][y] == 1'b1) begin
                        score_grid[x + 8][y] <= 1'b1;
                    end
                end
            end
            for (int x = 0; x < 4; x++) begin       // print "tens"
                for (int y = 0; y < 5; y++) begin
                    if (curr_digit_10[x][y] == 1'b1) begin
                        score_grid[x + 4][y] <= 1'b1;
                    end
                end
            end
            for (int x = 0; x < 4; x++) begin       // print "hundreds"
                for (int y = 0; y < 5; y++) begin
                    if (curr_digit_100[x][y] == 1'b1) begin
                        score_grid[x][y] <= 1'b1;
                    end
                end
            end
        end
    end
    
    always_comb begin // drawing the UIUC logo
        for (int x = 3; x <= 7; x++) begin
            score_grid[x][8] = 1'b1;
            score_grid[x][9] = 1'b1;
            score_grid[x][13] = 1'b1;
            score_grid[x][14] = 1'b1;
        end
        for (int x = 4; x <= 6; x++) begin
            score_grid[x][10] = 1'b1;
            score_grid[x][11] = 1'b1;
            score_grid[x][12] = 1'b1;
        end
        for (int x = 0; x <= 11; x++) begin
            score_grid[x][5] = 1'b0;
            score_grid[x][6] = 1'b0;
            score_grid[x][7] = 1'b0;
        end
        for (int y = 8; y <= 14; y++) begin
            score_grid[0][y] = 1'b0;
            score_grid[1][y] = 1'b0;
            score_grid[2][y] = 1'b0;
            score_grid[8][y] = 1'b0;
            score_grid[9][y] = 1'b0;
            score_grid[10][y] = 1'b0;
        end
        score_grid[3][10] = 1'b0;
        score_grid[3][11] = 1'b0;
        score_grid[3][12] = 1'b0;
        score_grid[7][10] = 1'b0;
        score_grid[7][11] = 1'b0;
        score_grid[7][12] = 1'b0;
    end
    
endmodule
