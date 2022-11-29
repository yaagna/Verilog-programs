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

        #50 a = 0; b = 0; cin = 0;
        #50 a = 3; b = 2; cin = 1;
        #50 a = 7; b = 10; cin = 0;
        #50 a = 15; b = 15; cin = 1;
    end

endmodule