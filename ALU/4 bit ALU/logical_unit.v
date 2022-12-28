module logical
#(parameter N = 4, M = 4)

(
    input wire clk;
    input wire [N-1:0] a, b;
    input wire [M-2:0] instruction;
    output wire [N-1:0] log_out;
);

endmodule