`timescale 1ns / 1ps

module figures(
        input logic [4:0] figure,
        output logic [3:0][3:0] curr_figure
);

always_comb begin
    case (figure)  // `figure` indicates the shape and rotation

        default: begin
            curr_figure[0][0] = 1'b1;
            curr_figure[0][1] = 1'b1;
            curr_figure[0][2] = 1'b1;
            curr_figure[0][3] = 1'b1;
          
            curr_figure[1][0] = 1'b1;
            curr_figure[1][1] = 1'b1;
            curr_figure[1][2] = 1'b1;
            curr_figure[1][3] = 1'b1;          

            curr_figure[2][0] = 1'b1;
            curr_figure[2][1] = 1'b1;
            curr_figure[2][2] = 1'b1;
            curr_figure[2][3] = 1'b1;
          
            curr_figure[3][0] = 1'b1;
            curr_figure[3][1] = 1'b1;
            curr_figure[3][2] = 1'b1;
            curr_figure[3][3] = 1'b1;        
        end

        ////////////////////////////////////////////////////////////////////////////////// T Tetromino
        
        5'd0: begin            
            curr_figure[0][0] = 1'b0;
            curr_figure[0][1] = 1'b0;
            curr_figure[0][2] = 1'b0;
            curr_figure[0][3] = 1'b1;
          
            curr_figure[1][0] = 1'b0;
            curr_figure[1][1] = 1'b0;
            curr_figure[1][2] = 1'b1;
            curr_figure[1][3] = 1'b1;          

            curr_figure[2][0] = 1'b0;
            curr_figure[2][1] = 1'b0;
            curr_figure[2][2] = 1'b0;
            curr_figure[2][3] = 1'b1;
          
            curr_figure[3][0] = 1'b0;
            curr_figure[3][1] = 1'b0;
            curr_figure[3][2] = 1'b0;
            curr_figure[3][3] = 1'b0;
        end        
                                   
        5'd1: begin            
            curr_figure[0][0] = 1'b0;
            curr_figure[0][1] = 1'b1;
            curr_figure[0][2] = 1'b1;
            curr_figure[0][3] = 1'b1;
          
            curr_figure[1][0] = 1'b0;
            curr_figure[1][1] = 1'b0;
            curr_figure[1][2] = 1'b1;
            curr_figure[1][3] = 1'b0;          

            curr_figure[2][0] = 1'b0;
            curr_figure[2][1] = 1'b0;
            curr_figure[2][2] = 1'b0;
            curr_figure[2][3] = 1'b0;
          
            curr_figure[3][0] = 1'b0;
            curr_figure[3][1] = 1'b0;
            curr_figure[3][2] = 1'b0;
            curr_figure[3][3] = 1'b0;
        end
        
        5'd2: begin            
            curr_figure[0][0] = 1'b0;
            curr_figure[0][1] = 1'b0;
            curr_figure[0][2] = 1'b1;
            curr_figure[0][3] = 1'b0;
          
            curr_figure[1][0] = 1'b0;
            curr_figure[1][1] = 1'b0;
            curr_figure[1][2] = 1'b1;
            curr_figure[1][3] = 1'b1;          

            curr_figure[2][0] = 1'b0;
            curr_figure[2][1] = 1'b0;
            curr_figure[2][2] = 1'b1;
            curr_figure[2][3] = 1'b0;
          
            curr_figure[3][0] = 1'b0;
            curr_figure[3][1] = 1'b0;
            curr_figure[3][2] = 1'b0;
            curr_figure[3][3] = 1'b0;
        end
        
        5'd3: begin            
            curr_figure[0][0] = 1'b0;
            curr_figure[0][1] = 1'b0;
            curr_figure[0][2] = 1'b1;
            curr_figure[0][3] = 1'b0;
          
            curr_figure[1][0] = 1'b0;
            curr_figure[1][1] = 1'b1;
            curr_figure[1][2] = 1'b1;
            curr_figure[1][3] = 1'b1;          

            curr_figure[2][0] = 1'b0;
            curr_figure[2][1] = 1'b0;
            curr_figure[2][2] = 1'b0;
            curr_figure[2][3] = 1'b0;
          
            curr_figure[3][0] = 1'b0;
            curr_figure[3][1] = 1'b0;
            curr_figure[3][2] = 1'b0;
            curr_figure[3][3] = 1'b0;
        end 

        ////////////////////////////////////////////////////////////////////////////////// Square Tetromino

        5'd4: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd5: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd6: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd7: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        ////////////////////////////////////////////////////////////////////////////////// I Tetromino

        5'd8: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b1; 
        end

        5'd9: begin 
          curr_figure[0][0] = 1'b1;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd10: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b1;
        end

        5'd11: begin 
          curr_figure[0][0] = 1'b1;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;  
        end

        ////////////////////////////////////////////////////////////////////////////////// S Tetromino

       5'd12: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b1;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd13: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b0;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd14: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b1;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;
        end

        5'd15: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b0;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;  
        end

        ////////////////////////////////////////////////////////////////////////////////// L Tetromino

       5'd16: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd17: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b1;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd18: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b0;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b1;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;
        end

        5'd19: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b1;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;  
        end

        ////////////////////////////////////////////////////////////////////////////////// Inverted L Tetromino

       5'd20: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b0;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b1;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd21: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd22: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b1;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b1;
          curr_figure[1][2] = 1'b0;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;
        end

        5'd23: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b0;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b1;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;  
        end

        ////////////////////////////////////////////////////////////////////////////////// Z Tetromino

       5'd24: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b0;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd25: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b1;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0; 
        end

        5'd26: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b0;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b0;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b1;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b1;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;
        end

        5'd27: begin 
          curr_figure[0][0] = 1'b0;
          curr_figure[0][1] = 1'b0;
          curr_figure[0][2] = 1'b1;
          curr_figure[0][3] = 1'b1;
          
          curr_figure[1][0] = 1'b0;
          curr_figure[1][1] = 1'b1;
          curr_figure[1][2] = 1'b1;
          curr_figure[1][3] = 1'b0;          

          curr_figure[2][0] = 1'b0;
          curr_figure[2][1] = 1'b0;
          curr_figure[2][2] = 1'b0;
          curr_figure[2][3] = 1'b0;
          
          curr_figure[3][0] = 1'b0;
          curr_figure[3][1] = 1'b0;
          curr_figure[3][2] = 1'b0;
          curr_figure[3][3] = 1'b0;  
        end

    endcase
end
endmodule