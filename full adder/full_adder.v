module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    wire m,p
    xor(s,a,b,cin);
    xor(m,a,b);
    and(p,a,b);
    and(v,m,cin);
    or(cout,p,v);
endmodule