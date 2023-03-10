// Verilog code for the 4-bit adder
`timescale 1ns/1ns

module alu32(clk, a, b, sel, out);

    input clk;
    input [31:0] a, b;
    input [3:0] sel;
    output reg [31:0] out;

    wire [31:0] g, p, c;

    assign g = a & b;
    assign p = a ^ b;
    assign c[0] = add_sub ? ~b[0] : 1'b0; // initialize carry for substraction

    

    always @(posedge clk)
        begin
            if (sel == 4'b0000) // Logical AND of inputs a and b
                begin 
                    out <= a & b;
                end
            
            else if (sel == 4'b0001) // Locical OR of inputs a and b
                begin
                    out <= a | b;
                end
            
            else if (sel == 4'b0010) // Logical XOR of inputs a and b
                begin
                    out <= a ^ b;
                end
            
            else if (sel == 4'b0011) // Sum of inputs a and b
                begin
                    
                end


        end

endmodule