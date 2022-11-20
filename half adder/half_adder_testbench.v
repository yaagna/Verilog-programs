//Test bench for halfadder
`include "half_adder.v"

module testbench;
    reg a, b;
    wire sum, carry;

    half_adder add1(a, b, sum, carry);

    initial 
        begin
            $dumpfile("half_adder.vcd");
            $dumpvars(0, testbench);
            a = 0; b = 0;
            #1 
            a = 0; b = 1;
            #1
            a = 1; b = 0;
            #1
            a = 1; b = 1;
            #1
            a = 1; b = 1;
        end
endmodule

//iverilog -o half_adder_testbench.vvp half_adder_testbench.v
//vvp half_adder_testbench.vvp