module full_sub(a, b, diff, bin, bout);
    input a, b, bin;
    output diff, bout;
    wire w, x, y;
    half_sub h1(w, x, a, b);
    half_sub h2(diff, y, w, bin);
    or(bout, x, y);
endmodule


module half_sub(Diff, Borrow, A, B);
    input A, B;
    output Diff, Borrow;
    wire inverse_A;
    xor x1(Diff, A, B);
    not n1(inverse_A,A);
    and a1(Borrow, inverse_A, B);
endmodule