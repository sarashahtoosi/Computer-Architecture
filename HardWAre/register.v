module Register(
            input             clock;
            input             r_enable;
            input      [15:0] data_in;
            output reg [15:0] data_out;
            );

            always @(posedge clock)
            begin
            if(r_enable)
                  data_out <= data_in;
            end

endmodule

module RegisterTestbench;

            reg         clock = 0;
            reg         enable = 1;
            reg  [15:0] value_in;
            wire [15:0] value_out;

            always #1 clock = !clock;

            initial $dumpfile("registertestbench.vcd");
            initial $dumpvars(0, RegisterTestbench);

            Register r(clock, enable, value_in, value_out);

endmodule
