// 4 bit ALU using Verilog HDL

module alu;
#(parameter N = 4, M = 4)
(
    input clk;
    input [N-1:0] a, b;
    input [M-1:0] instruction;
    output reg [N-1:0] alu_out;
);

endmodule