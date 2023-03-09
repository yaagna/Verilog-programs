// Testbench for 32-bit ALU

`include "alu_32bit.v"

module testbench;
    reg clk;
    reg [31:0] a, b;
    reg [1:0] sel;
    wire [31:0] out;

    alu32 uut (clk, a, b, sel, out);

    initial clk = 0;
    always #1 clk = ~clk;
      
    initial
        begin

        $dumpfile("alu_32bit.vcd");
        $dumpvars(0, testbench);

        a = {32{1'b0}};
        b = {32{1'b0}};
        sel = 2'b00;

        #10;
        a = 32'h1;
        b = 32'h1;
        sel = 2'b00;

        #10$finish;

        end

endmodule

//iverilog -o alu_32bit_testbench alu_32bit_testbench.v
//vvp alu_32bit_testbench