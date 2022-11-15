`include "full_adder.v"

module testbench;
    reg a, b, cin;
    wire sum, cout;

    //Initiate Unit Under Test(UUT)
    full uut(
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b),
        .cin(cin)
    );

    initial 
    begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, testbench);
        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
    end
    always #2 a = a+1'b1;
    always #3 b = b+1'b1;
    always #4 cin = cin+1'b1;
    initial $monitor($time,"sum=%b, cout=%b",sum,cout);
    initial #50, $finish;
endmodule