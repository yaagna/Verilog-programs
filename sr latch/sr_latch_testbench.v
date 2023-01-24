//Testbench for SR latch
`include "sr_latch.v"

module testbench;

    reg s;
    reg r;
    reg clk;
    reg reset;

    initial clk = 0;
    always #5 clk = ~clk;

    sr_latch sr0 (.s(s), .r(r), .clk(clk), .reset(reset), .q(q));
    
    initial begin
        reset <= 1;
        #10 reset = 0;
    end

    initial begin
        s <= 1;
        r <= 0;

        #20 s <= 0;
            r <= 0;
        #20 s <= 0;
            r <= 1;
        #20 s <= 1;
            r <= 1;
    end

endmodule
