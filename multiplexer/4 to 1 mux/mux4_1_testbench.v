//Testbench for 4 to 1 multiplexer
`include "mux4_1.v"

module testbench
    wire y;
    reg i0, i1, i2, i3, s0, s1;

    mux4_1 name(.y(y), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1));
    initial
    begin
        $dumpfile("mux4_1.vcd");
        $dumpvars(0, testbench);
        i0 = 1'b0;
        i1 = 1'b0;
        i2 = 1'b0;
        i3 = 1'b0;
        s0 = 1'b0;
        s1 = 1'b0;
        #100 $finish;
    end

    always #40 i0 = ~i0;
    always #20 i1 = ~i1;
    always #10 i2 = ~i2;
    always #5 i3 = ~i3;
    always #2 s0 = ~s0;
    always #1 s1 = ~s1;
    always @(i0 or i1 or i2 or i3 or s0 or s1)
    $monitor("At time = %t, Output = %d", $time, y);
endmodule

//iverilog -o mux4_1_testbench.vvp mux4_1_testbench.v
//vvp mux4_1_testbench.vvp