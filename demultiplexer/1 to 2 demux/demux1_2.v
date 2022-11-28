// Verilog 1 to 2 Demultiplexer program

module demux1_2(i, s, y);
    input i, s;
    output reg [1:0] y;

    always @ (*)
    begin
        if (s == 1'b0)
            begin
                y[0] = i;
                y[1] = 1'b0;
            end
        else
            begin
                y[0] = 1'b0;
                y[1] = i;
            end
    end
endmodule