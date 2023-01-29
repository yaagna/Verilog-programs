//Test bench for halfsubtactor
`include "half_sub.v"
`timescale 1ns/1ns

module testbench;
    reg a, b;
    wire inverse_a, diff, borrow;

    half_sub sub1(a, b, diff, borrow);
    
    initial
    begin
        $dumpfile("half_sub.vcd");
        $dumpvars(0, testbench);
        a = 0; b = 0;
        #1
        a = 0; b = 1;
        #1
        a = 1; b = 0;
        #1
        a = 1; b = 1;
    end
endmodule

//iverilog -o half_sub_testbench.vvp half_sub_testbench.v
//vvp half_sub_testbench.vvp