// Verilog code for the 4-bit adder

module alu32(clk, a, b, sel, out);

    input clk;
    input [31:0] a, b;
    input [1:0] sel;
    output reg [31:0] out;

    always @(posedge clk)
        begin
            if (sel == 2'b00)
                begin 
                    out <= a + b;
                end

        end

endmodule