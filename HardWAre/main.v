module main (input clk);
        wire part1_in = ins[24:20]; 
        wire part2_in = ins[19:15],  part2_out ;
        wire part3_in = ins[14:10],  part3_out ;
        wire part4_in = ins[9:5],  part4_out ;
        wire part5_in = ins[4:0],  part5_out ;
        wire R_type, is_bgt, lw, sw, is_beq, is_bne, is_jr, branch, is_jump ;
        reg [15:0] j_address;
        reg [15:0] branch_address;
        reg [4:0] op_code;
        reg [4:0] ALU_op;


        control_unit cu( part1_in, part2_in, part2_out, part3_in, part3_out, part4_in, part4_out, part5_in, part5_out, R_type, is_bgt, lw, sw, is_beq, is_bne, is_jr, branch, is_jump, j_address, branch_address, op_code, ALU_op );

        wire B_address, jr_address, jump, jr, bgt, bne, beq ;
        reg [31:0] in_instruction ;
        reg [31:0] out_instruction ;

        PC program_counter ( clk, jump, jr, is_jr, beq, is_beq, bne, is_bne, bgt, is_bgt, j_address, jr_address, B_address, in_instruction, out_instruction );

        wire [31:0] Data1 ;
        wire [31:0] Data2 ;
        wire [4:0] outputt;
        wire [4:0] input1;
        wire [4:0] input2;
        wire [31:0] input_to_ALU1;
        wire [31:0] input_to_ALU2;

        input_output IO( part5_out, part4_out, part3_out, part2_out, branch, R_type, Data1, Data2, outputt, input1, input2, input_to_ALU1, input_to_ALU2 );

        wire [2:0] select;

        alu_control ac( op_code, ALU_op, select );

        wire [31:0] output1;

        alu alu( input_to_ALU1, input_to_ALU2, select, output1, bgt, beq, bne )

endmodule