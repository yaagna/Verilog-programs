// Verilog code for the 4-bit adder

module alu32(clk, a, b, sel, out);

    input clk;
    input [31:0] a, b;
    input [3:0] sel;
    output reg [31:0] out;

    always @(posedge clk)
        begin
            if (sel == 4'b0000)
                begin 
                    out <= a & b;
                end
            
            else if (sel == 4'b0001)
                begin
                    out <= a | b;
                end
            
            else if (sel == 4'b0010)
                begin
                    out <= ~asss;
                end
            
            else if (sel == 4'b0011)
                begin
                    out <= a ^ b;
                end

        end

endmodule