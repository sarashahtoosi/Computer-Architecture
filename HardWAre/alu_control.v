module alu_control(
                  input [4:0] op_code,
                  input [4:0] alu_code,
                  output reg [2:0] select
                  );

                  always @(*)
                  begin
                        if (alu_code[0] & !alu_code[1] & !alu_code[2] & !alu_code[3] & !alu_code[4])
                              select = {op_code[2], op_code[1], op_code[0]};

                        else if (!alu_code[0] & alu_code[1] & !alu_code[2] & !alu_code[3] & !alu_code[4])
                              select = 0;

                        else if (!alu_code[0] & !alu_code[1] & alu_code[2] & !alu_code[3] & !alu_code[4])
                              select = 4;

                        else if (!alu_code[0] & !alu_code[1] & !alu_code[2] & alu_code[3] & !alu_code[4])
                              select = 7;

                        else if (!alu_code[0] & !alu_code[1] & !alu_code[2] & !alu_code[3] & alu_code[4])
                              select = 4;
                  end 

endmodule