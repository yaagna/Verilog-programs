// Verilog 2 to 1 Multiplexer program using behavioural model

module (i0, i1, s, y);
    input wire i0, i1, s;
    output y;

    always @(i0 or i1 or s)
    begin
        if (s)
            y = i1;
        else
            y = i0;
    end    

endmodule