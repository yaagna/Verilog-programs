///////////////////////////////////////////////////
// Verilog code of 16 bit carry look ahead adder
///////////////////////////////////////////////////

`timescale 1ns/1ps

module cla16bit(a, b, cin, clk, sum, cout);

    input [15:0] a, b;
    input cin, clk;
    output [15:0] sum;
    output cout;
    wire c1, c2, c3;

    cla4bit cla1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .clk(clk) .sum(sum[3:0]), .cout(c1));
    cla4bit cla2(.a(a[7:4]), .b(b[7:4]), .cin(c1), .clk(clk) .sum(sum[7:4]), .cout(c2));
    cla4bit cla3(.a(a[11:8]), .b(b[11:8]), .cin(c2), .clk(clk) .sum(sum[11:8]), .cout(c3));
    cla4bit cla4(.a(a[15:12]), .b(b[15:12]), .cin(c3), .clk(clk) .sum(sum[15:12]), .cout(cout));

endmodule

///////////////////////////////////////////////////
// Verilog code of 4 bit carry look ahead adder
///////////////////////////////////////////////////

`timescale 1ns/1ps

module cla4bit(a, b, cin, clk, sum, out);

    input [3:0] a, b;
    input cin, clk;
    output [3:0] sum;
    output out;
    wire [3:0] p, g, c;

    always @(posedge clk ) begin
        p <= a^b;                  // propogate signal
        g <= a&b;                  // generate signal

        c[0] <= cin;               // carry in
        c[1] <= g[0] | (p[0] & c[0]);
        c[2] <= g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
        c[3] <= g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
        cout <= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
        sum <= p^c;                // sum
    end

endmodule

