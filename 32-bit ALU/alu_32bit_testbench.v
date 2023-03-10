// Testbench for 32-bit ALU

`include "alu_32bit.v"

module testbench;
    reg clk;
    reg [31:0] a, b;
    reg [3:0] sel;
    wire [31:0] out;

    alu32 uut (clk, a, b, sel, out);

    initial clk = 0;
    always #1 clk = ~clk;
      
    initial
        begin

        $dumpfile("alu_32bit.vcd");
        $dumpvars(0, testbench);

        a = {32{1'b0}};
        b = {32{1'b1}};
        sel = 4'b0000;

        #10;
        a = 32'h1;
        b = 32'h1;
        sel = 4'b0000;

        #10;
        a = {32{1'b0}};
        b = {32{1'b1}};
        sel = 4'b0001;

        #10;
        a = {16{2'b01}};
        b = {16{2'b01}};
        sel = 4'b0001;

        #10;
        a = {16{2'b01}};
        b = {16{2'b10}};
        sel = 4'b0001;

        #10;
        a = {16{2'b01}};
        b = {16{2'b10}};
        sel = 4'b0010;

        #10;
        a = {16{2'b00}};
        b = {16{2'b11}};
        sel = 4'b0010;

        #10;
        a = {16{2'b00}};
        b = {16{2'b00}};
        sel = 4'b0011;

        #10;
        a = {16{2'b01}};
        b = {16{2'b10}};
        sel = 4'b0011;

        #10;
        a = {16{2'b11}};
        b = 8'h1;
        sel = 4'b0011;

        #10$finish;

        end

endmodule

//iverilog -o alu_32bit_testbench alu_32bit_testbench.v
//vvp alu_32bit_testbench