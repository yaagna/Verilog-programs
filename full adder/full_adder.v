// Verilog full adder program using gate model

module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    wire w, x, y;
    half_adder h1(w, x, a, b);
    half_adder h2(sum, y, w, cin);
    or(cout, x, y);
endmodule

module half_adder(S, C, A, B);
    input A, B;
    output S, C;
    xor(S, A, B);
    and(C, A, B);
endmodule