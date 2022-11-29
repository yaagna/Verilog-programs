// Test bench for 4 bit carry look ahead adder
`include "cla4.v"

module testbench;
    wire [3:0] y;
    wire cout;
    reg [3:0] a, b;
    reg cin;

    cla4 cla(a, b, cin, cout, y);

    initial
    begin
        $dumpfile("cla4.vcd");
        $dumpvars(0, testbench);
        $display("RSLT\ta\tb\tcin\t\tcout\ty");

        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #50 a = 4'b0100; b = 4'b0011; cin = 1'b1;
        #50 a = 4'b1100; b = 4'b0011; cin = 1'b0;
        #50 a = 4'b1111; b = 4'b1111; cin = 1'b1;
        #50;
    end

endmodule

// iverilog -o cla4_testbench.vvp cla4_testbench.v
// vvp cla4_testbench.vvp
