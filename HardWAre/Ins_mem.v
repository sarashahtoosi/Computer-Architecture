module Instruction_memory(
                        input clk,
                        input zero,
                        input branch,
                        input [24:0] ext,
                        output reg [24:0] ins
                        );
                        
                        reg branch_taken;
                        reg [124:0] arr [24:0];
                        assign inpc = 0;
                        reg [24:0] outpc;
                        
                        always @ (*)
                        begin
                              branch_taken = zero && branch;
                              if ( !branch_taken )
                              begin
                                    outpc=inpc;
                                    outpc=outpc+1;
                                    ins=arr[outpc];
                              end
                              else
                              begin
                                    outpc=inpc;
                                    outpc=outpc+4+(ext*4);
                                    ins=arr[outpc];
                              end
                        end
endmodule
