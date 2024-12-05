`timescale 1ns / 1ps

module digits(
        input logic [3:0] digit_idx,
        output logic [3:0][4:0] curr_digit
);

always_comb begin
    case (digit_idx)  // `digit_idx` indicates the digit being drawn

        default: begin
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b1;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b1;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b1;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b1;
            curr_digit[3][1] = 1'b1;
            curr_digit[3][2] = 1'b1;
            curr_digit[3][3] = 1'b1;   
            curr_digit[3][4] = 1'b1;
        end
        
        5'd0: begin            
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b1;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b0;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end        
                                   
        5'd1: begin            
            curr_digit[0][0] = 1'b0;
            curr_digit[0][1] = 1'b0;
            curr_digit[0][2] = 1'b0;
            curr_digit[0][3] = 1'b0;
            curr_digit[0][4] = 1'b0;            
          
            curr_digit[1][0] = 1'b0;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b0;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b0;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end
        
        5'd2: begin            
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b0;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b1;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b0;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end
        
        5'd3: begin            
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b0;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b0;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end 

        5'd4: begin 
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b0;
            curr_digit[0][4] = 1'b0;            
          
            curr_digit[1][0] = 1'b0;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b0;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end

        5'd5: begin 
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b0;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b0;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end

        5'd6: begin 
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b1;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b0;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end

        5'd7: begin 
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b0;
            curr_digit[0][2] = 1'b0;
            curr_digit[0][3] = 1'b0;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b1;          
            curr_digit[1][4] = 1'b0;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b0;
            curr_digit[2][3] = 1'b0;
            curr_digit[2][4] = 1'b0;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end

        5'd8: begin 
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b1;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end

        5'd9: begin 
            curr_digit[0][0] = 1'b1;
            curr_digit[0][1] = 1'b1;
            curr_digit[0][2] = 1'b1;
            curr_digit[0][3] = 1'b0;
            curr_digit[0][4] = 1'b1;            
          
            curr_digit[1][0] = 1'b1;
            curr_digit[1][1] = 1'b0;
            curr_digit[1][2] = 1'b1;
            curr_digit[1][3] = 1'b0;          
            curr_digit[1][4] = 1'b1;   

            curr_digit[2][0] = 1'b1;
            curr_digit[2][1] = 1'b1;
            curr_digit[2][2] = 1'b1;
            curr_digit[2][3] = 1'b1;
            curr_digit[2][4] = 1'b1;   
          
            curr_digit[3][0] = 1'b0;
            curr_digit[3][1] = 1'b0;
            curr_digit[3][2] = 1'b0;
            curr_digit[3][3] = 1'b0;   
            curr_digit[3][4] = 1'b0;
        end

    endcase
end
endmodule