// Verilog program of 4 bit carry look ahead adder
`timescale 1ns/1ns

module cla4(a, b, cin, cout, y);
    input [3:0] a, b;
    input cin;
    output cout;
    output [3:0] y;

    //wire [3:0] g, p;                // generate and propagate signals
    wire [4:0] c;                   // intermediate carry signals between stages

    assign c[0] = cin;
    assign y[0] = a[0] ^ b[0] ^ cin;

    assign c[1] = ((a[0] & b[0]) | ((a[0] | b[0]) & c[0]));
    assign y[1] = a[1] ^ b[1] ^ c[1];

    assign c[2] = ((a[1] & b[1]) | ((a[1] | b[1]) & ((a[0] & b[0]) | ((a[0] | b[0]) & c[0]))));
    assign y[2] = a[2] ^ b[2] ^ c[2];

    assign c[3] = ((a[2] & b[2]) | ((a[2] | b[2]) & ((a[1] & b[1]) | ((a[1] | b[1]) & ((a[0] & b[0]) | ((a[0] | b[0]) & c[0]))))));
    assign y[3] = a[3] ^ b[3] ^ c[3];

    assign c[4] = ((a[3] & b[3]) | ((a[3] | b[3]) & ((a[2] & b[2]) | ((a[2] | b[2]) & ((a[1] & b[1]) | ((a[1] | b[1]) & ((a[0] & b[0]) | ((a[0] | b[0]) & c[0]))))))));
    assign cout = c[4];
endmodule
