module logical
#(parameter N = 4, M = 4)

(
    input wire clk;
    input wire [N-1:0] a, b;
    input wire [M-2:0] instruction;
    output reg [N-1:0] log_out;
);

always @(posedge clk) begin

    case (instruction)
        3'b000: log_out = a & b;
        3'b001: log_out = a | b;
        3'b010: log_out = a ^ b;
        3'b011: log_out = ~(a | b);
        3'b100: log_out = ~(a & b);
        3'b101: log_out = ~(a ^ b);
        3'b110: log_out = (a>b) ? 4'b1111 : 4'b0000;
        3'b111: log_out = (a==b) ? 4'b1111 : 4'b0000;
        default: log_out = a;
    endcase
end

endmodule