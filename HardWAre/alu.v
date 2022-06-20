
module alu(
            input [31:0] input1,
            input [31:0] input2,
            input [2:0] select,
            output reg [31:0] output1,
            output reg bgt,
            output reg beq,
            output reg bne
      );

      always @(*)
      begin
            if (select == 0)
                  output1 = 0;
            else if (select == 1)
                  output1 = input1 & input2;
            else if (select == 2)
                  output1 = input1 | input2;
            else if (select == 3)
                  output1 = input1 ^ input2;
            else if (select == 4)
                  output1 = input1 + input2;
            else if (select == 5)
                  output1 = input1 - input2;
            else if (select == 6)  
                  output1 = input1 * input2;
            else if (select == 7)
                  output1 = input1 / input2;
            
            if (input1 > input2)
                   bgt = 0;
            else 
                   bgt = 1'b0;
            
            if (input1 == input2)
            begin
                   beq = 1'b1;
                   bne = 1'b0;
            end
            
            else 
            begin 
                   bne = 1'b1;
                   beq = 1'b0;
            end
      end

      
endmodule