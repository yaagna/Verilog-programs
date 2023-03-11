// Verilog code for the 32-bit adder

`timescale 1ns/1ns

module alu32(clk, a, b, sel, out, overflow);

    input clk;
    input [31:0] a, b;
    input [3:0] sel;
    output reg [31:0] out;
    output reg overflow;

    reg [32:0] sum;

    always @(posedge clk)
        begin
            if (sel == 4'b0000) // Logical AND of inputs a and b
                begin 
                    out <= a & b;
                    overflow <= 0;
                end
            
            else if (sel == 4'b0001) // Locical OR of inputs a and b
                begin
                    out <= a | b;
                    overflow <= 0;
                end
            
            else if (sel == 4'b0010) // Logical XOR of inputs a and b
                begin
                    out <= a ^ b;
                    overflow <= 0;
                end
            
            else if (sel == 4'b0011) // Sum of inputs a and b
                begin
                    sum <= a + b;
                    out <= sum[31:0];
                    overflow <= sum[32];
                end
            
            else if (sel == 4'b0100) // Difference of inputs a and b
                begin
                    sum <= a + (~b) + 1;
                    out <= sum[31:0];
                    overflow <= sum[32];
                end
                
            
        
        end

endmodule

