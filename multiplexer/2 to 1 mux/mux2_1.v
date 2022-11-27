<<<<<<< HEAD
module mux2_1(i0, i1, s, y);
=======
// Verilog 2 to 1 Multiplexer program using behavioural model

module (i0, i1, s, y);
>>>>>>> e0d79a28f45042b79c72f933d82103f3c713347e
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