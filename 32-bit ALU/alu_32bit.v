// Verilog code for the 4-bit adder
`timescale 1ns/1ns

module alu32(clk, a, b, sel, out);

    input clk;
    input [31:0] a, b;
    input [3:0] sel;
    output reg [31:0] out;
    output reg overflow;

    reg [31:0] g, p, c; //

    always @* 
        begin
            g <= a & b; //
            p <= a ^ b; //
            c[0] = add_sub ? ~b[0] : 1'b0; // initialize carry for substraction

        generate //
            
            genvar i; //
    
            for (i = 0; i <31; i = i + 1 ) // 
                begin //
                    assign c[i+1] = g[i] | (p[i] & c[i]); //
                end //
        endgenerate // 

        end

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
                    out <= a + b + c;
                end
            
            else if (sel == 4'b0100) // Difference of inputs a and b
                begin
                    out <= a + (~b) + c + 1;
                end

            

            // detect overflow
            if (sel == 4'b0011) // Sum of inputs a and b
                begin
                    if (a[31] == b[31] && a[31] != out[31])
                        begin
                            overflow <= 1;
                        end
                    else
                        begin
                            overflow <= 0;
                        end
                end
            
            else if (sel == 4'b0100) // Difference of inputs a and b
                begin
                    if (a[31] != b[31] && a[31] != out[31])
                        begin
                            overflow <= 1;
                        end
                    else
                        begin
                            overflow <= 0;
                        end
                end

            else                      // Logical AND, OR and XOR
                begin
                    overflow <= 0;
                end

        end

endmodule

