// Testbench for 4-bit ALU

`include "alu_4bit.v"

module testbench;
    reg clk;
    reg reset;
    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] out;
    wire overflow;

    alu uut (clk, reset, a, b, sel, out, overflow);

    initial clk = 0;
    always #1 clk = ~clk;
      
    initial begin

        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, testbench);

        reset = 1'b0;
        a = 4'b0000;
        b = 4'b0000;
        sel = 2'b00;

        #10;
        a = 4'b0001;
        b = 4'b0001;
        sel = 2'b00;

        #10;
        a = 4'b1111;
        b = 4'b1111;
        sel = 2'b00;

        #2;
        reset = 1'b1;

        #2;
        reset = 1'b0;
        a = 4'b0000;
        b = 4'b0000;
        sel = 2'b01;

        #10;
        a = 4'b0001;
        b = 4'b0001;
        sel = 2'b01;

        #10;
        a = 4'b0001;
        b = 4'b0011;
        sel = 2'b01;


        #10$finish;

    end

endmodule

//iverilog -o alu_4bit_testbench.vvp alu_4bit_testbench.v
//vvp alu_4bit_testbench.vvp