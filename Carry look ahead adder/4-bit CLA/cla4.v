// Verilog program of 4 bit carry look ahead adder

module cla4(a, b, cin, cout, y);
    input [3:0] a, b;
    input cin;
    output cout;
    output [3:0] y;

    wire [3:0] g, p;                // generate and propagate signals
    wire [4:0] c;                   // intermediate carry signals between stages

    assign y[0] = a[0] ^ b[0] ^ cin;
    
endmodule