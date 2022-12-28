module arithmetic
#(parameter N = 4, M = 4)

(
    input wire clk;
    input wire [N-1:0] a, b;
    input wire [M-2:0] instruction;
    output reg [N-1:0] ariu_out;
);

always @(posedge clk) begin

    case (instruction)
        3'b000: ariu_out = a + b;
        3'b001: ariu_out = a - b;
        //3'b010: ariu_out = a * b; for multiplication
        //3'b011: ariu_out = a / b;  for division
        3'b100: ariu_out = a << 1;
        3'b101: ariu_out = a >> 1;
        3'b110: ariu_out = {a[N-2:0], a[N-1]};
        3'b111: ariu_out = {a[0], a[N-1:1]};
        default: ariu_out = a;
    endcase
end

endmodule