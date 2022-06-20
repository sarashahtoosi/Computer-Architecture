module input_output( input [4:0] p5, 
    input [4:0] p4, 
    input [4:0] p3, 
    input [4:0] p2,
    input Branch,
    input R_type, 
    input [31:0] Data1,
    input [31:0] Data2,
    output reg [4:0] outputt,
    output reg [4:0] input1,
    output reg [4:0] input2,
    output reg [31:0] input_to_ALU1,
    output reg [31:0] input_to_ALU2
);
always @(*)
begin
    if(Branch | R_type)
        input_to_ALU2 = Data2;
    else 
        input_to_ALU2 = {22'b000000000000000000000, p4, p5};

    input_to_ALU1 = Data1;

    if(R_type)
        input2 = p4;
    else
        input2 =p2;
    
    input1 = p3;
    outputt = p2;
end 

endmodule