//Testbench for JK latch
`include "jk_latch.v"
`timescale 1ns/1ns

module testbench;
    reg j;
    reg k;
    reg clk;
    reg reset;

    initial clk = 0;
    always #5 clk = ~clk;

    jk_latch jk0 (.j(j), .k(k), .clk(clk), .reset(reset), .q(q));

    initial begin
        reset <= 1;
        #10 reset = 0;
    end

    initial 
    begin
        $dumpfile("jk_latch.vcd");
        $dumpvars(0, testbench);

        j <= 1;
        k <= 0;

        #20 j <= 0;
            k <= 0;
        #20 j <= 0;
            k <= 1;
        #20 j <= 1;
            k <= 1;

        #40 $finish;
    end
endmodule

//iverilog -o jk_latch_testbench jk_latch_testbench.v
//vvp jk_latch_testbench