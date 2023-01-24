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
    

endmodule
