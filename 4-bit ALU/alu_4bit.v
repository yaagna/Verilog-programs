// Verilog code for 4-bit ALU

module alu (input clk, input [3:0] a, input [3:0] b, input [1:0] sel, output [3:0] out, output overflow);
    reg [3:0] out;
    reg overflow;
    always @(posedge clk)
        case (sel)
            2'b00: out <= a + b;
            2'b01: out <= a - b;
            2'b10: out <= a * b;
            2'b11: out <= a / b;
        endcase
    always @(posedge clk)
        if (out > 4'b1111)
            overflow = 1;
        else
            overflow = 0;
endmodule
