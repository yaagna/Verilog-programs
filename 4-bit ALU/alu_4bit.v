// Verilog code for 4-bit ALU

module alu (input clk,
    input reset,
    input [3:0] a, 
    input [3:0] b, 
    input [1:0] sel,
    output [3:0] out,
    output overflow);

    reg [3:0] result;
    wire [4:0] temp;

    assign out = result;
    assign temp = {1'b0,a} + {1'b0,b};
    assign overflow = temp[4];

    always @(posedge clk)
        begin
            if (reset == 1'b0)
                case (sel)
                   2'b00: result <= a + b;
                   2'b01: result <= a - b;
                   2'b10: result <= a * b;
                   2'b11: result <= a / b;
                endcase 
            else
                result <= 4'b0000;
 
        end

endmodule

