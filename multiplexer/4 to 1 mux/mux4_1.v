// Verilog 4 to 1 Multiplexer program using behavioural model

module mux4_1(i0, i1, i2, i3, s0, s1, y);
    input wire i0, i1, i2, i3, s0, s1;
    output reg y;

    always @(i0 or i1 or i2 or i3 or s0 or s1)
    begin
        case(s0|s1)
            2'b00: y <= i0;
            2'b01: y <= i1;
            2'b10: y <= i2;
            2'b11: y <= i3;
        endcase
    end

endmodule