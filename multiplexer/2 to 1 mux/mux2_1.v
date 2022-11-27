module mux2_1(i0, i1, s, y);
    input wire i0, i1, s;
    output reg y;

    always @(i0 or i1 or s)
    begin
        if(s)
            y = i1;
        else
            y = i0;
    end    

endmodule