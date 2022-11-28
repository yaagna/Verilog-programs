// Verilog 1 to 4 Demultiplexer program using behavioural model

module demux1_4(i, [1:0] s, [3:0] y);
    input i;
    input [1:0] s;
    output reg [3:0] y;

    assign @(y, s)
    begin
        case (s)
            2'b00: begin y[0] = i; y[3:1] = 0; end
            2'b01: begin y[1] = i; y[0] = 0; end
            2'b10: begin y[2] = i; y[1:0] = 0; end
            2'b11: begin y[3] = i; y[2:0] = 0; end
        endcase
    end
endmodule