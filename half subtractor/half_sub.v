// Verilog half subtractor program using gate model

module half_sub(a, b, diff, borrow);
    input a, b;
    output diff, borrow;
    wire inverse_a;
    xor x1(diff, a, b);
    not n1(inverse_a,a);
    and a1(borrow, inverse_a, b);
endmodule