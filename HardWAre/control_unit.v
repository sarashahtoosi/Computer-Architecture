module control_unit (
                  input [4:0] part1_in,
                  input [4:0] part2_in, output reg [4:0] part2_out,
                  input [4:0] part3_in, output reg [4:0] part3_out,
                  input [4:0] part4_in, output reg [4:0] part4_out,
                  input [4:0] part5_in, output reg [4:0] part5_out,
                  
                  output R_type, output bgt, output lw, output sw,
                  output beq,    output bne, output jr, output branch, 
                  output jump,
                  
                  output reg [15:0] j_address,
                  output reg [15:0] branch_address,
                  output reg [4:0] op_code,
                  output reg [4:0] ALU_op
                  );
                  
                  always @(*)
                  begin
                        part2_out = part2_in;
                        part3_out = part3_in;
                        part4_out = part4_in;   
                        part5_out = part5_in;
                        op_code = part1_in;
                        j_address = {1'b0, part3_in, part4_in, part5_in};
                        branch_address = {6'b000000, part4_in, part5_in};
                  end

                  op_code_explane oce(part1_in, R_type, bgt, slt, lw, sw, beq, bne, jr, ALU_op);
                  
                  
                  

                  

endmodule