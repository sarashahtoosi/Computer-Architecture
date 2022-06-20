module OP_Code_Explain ( 
                        input  [4:0] part1 ,
                        output reg R_type,
                        output reg bgt,
                        output reg slt,
                        output reg lw,
                        output reg sw,
                        output reg beq,
                        output reg bne,
                        output reg jr,
                        output reg j,
                        output reg [4:0] ALU_Op
                        );

                        wire add_, addi_, sub_, subi_, mult_, multi_, div_, divi_, and_, andiـ, or_, ori_, xor_, bgt_, slt_, lw_, sw_, beq_, bne_, jr_, j_ ;
                        wire add__ , sub__ , mult__ , div__ , and__ , or__ ,l_W_ , beq_bne_ ;
                        wire math ; 
                        
                        always @(*)
                        begin
                        if (!part1[4] & !part1[3] & part1[2] & !part1[1] & !part1[0])
                                assign add_ = 1 ;  

                        else if (!part1[4] & part1[3] & part1[2] & !part1[1] & !part1[0])
                                assign addi_ = 1 ;
                        
                        else if (!part1[4] & !part1[3] & part1[2] & !part1[1] & part1[0])
                                assign sub_ = 1 ;
                        
                        else if (!part1[4] & part1[3] & part1[2] & !part1[1] & part1[0])
                                assign subi_ = 1 ;
                        
                        else if (!part1[4] & !part1[3] & part1[2] & part1[1] & !part1[0])
                                assign mult_ =  1 ;
                        
                        else if (!part1[4] & part1[3] & part1[2] & part1[1] & !part1[0])
                                assign multi_ = 1 ;
                        
                        else if (!part1[4] & !part1[3] & part1[2] & part1[1] & part1[0])
                                assign div_ = 1 ;
                        
                        else if (!part1[4] & part1[3] & part1[2] & part1[1] & part1[0])
                                assign divi_ = 1 ;
                        
                        else if (!part1[4] & !part1[3] & !part1[2] & !part1[1] & part1[0])
                                assign and_ = 1 ; 
                        
                        else if (!part1[4] & part1[3] & !part1[2] & !part1[1] & part1[0])
                                assign andi_ = 1 ;
                        
                        else if (!part1[4] & !part1[3] & !part1[2] & part1[1] & !part1[0])
                                assign or_ = 1 ;
                        
                        else if (!part1[4] & part1[3] & !part1[2] & part1[1] & !part1[0])
                                assign ori_ = 1 ;
                        
                        else if (!part1[4] & !part1[3] & !part1[2] & part1[1] & part1[0])
                                assign xor_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & !part1[2] & !part1[1] & !part1[0])
                                assign bgt_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & !part1[2] & !part1[1] & part1[0])
                                assign slt_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & !part1[2] & part1[1] & !part1[0])
                                assign lw_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & !part1[2] & part1[1] & part1[0])
                                assign sw_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & part1[2] & !part1[1] & !part1[0])
                                assign beq_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & part1[2] & !part1[1] & part1[0])
                                assign bne_ = 1 ;
                        
                        else if (part1[4] & !part1[3] & part1[2] & part1[1] & !part1[0])
                                assign jr_ = 1 ;
                    
                        else if (part1[4] & !part1[3] & part1[2] & part1[1] & part1[0])
                                assign j_ = 1 ;
                        
                        R_type = (add_ | sub_ |  mult_ | div_ | and_ | or_ |  xor_);
                        
                        assign add__ = (add_ | addi_);
                        assign sub__ = (sub_ | subi_);
                        assign mult__ = (mult_ | multi_);
                        assign div__ = (div_  | divi_);
                        assign and__ = (and_ | andi_);
                        assign or__ = (or_ | ori_);
                        assign l_W_ = (lw_ | sw_);
                        assign beq_bne_ = (beq_ | bne_);

                        bgt = bgt_ ;
                        j = j_ ;
                        jr = jr_ ;
                        bne = bne_ ;
                        beq = beq_ ;
                        sw = sw_ ; 
                        lw = lw_ ; 
                        slt = slt_ ;
                        bgt = bgt_ ;

                        assign math = (add__ | sub__ | mult__ | div__ | and__ | or__ | xor_ ) ;

                        ALU_Op[0] = math ;
                        ALU_Op[1] = slt_ ;
                        ALU_Op[2] = l_W_ ;
                        ALU_Op[3] = beq_bne_ ;
                        ALU_Op[4] = jr_ ;
                        end
                        
endmodule