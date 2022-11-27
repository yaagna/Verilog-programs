//Testbench for 2 to 1 multiplexer
`include "mux2_1.v"

module testbench;
    wire out;
    reg i0, i1, s;
    mux2_1 name(.y(out), .i0(i0), .i1(i1), .s(s));

    initial 
    begin
        i0 = 1'b0;
        i1 = 1'b0;
        s = 1'b0;
        #100 $finish;    
    end
    
    always #40 i0 = ~i0;
    always #20 i1 = ~i1;
    always #10 s = ~s;
    always @(i0 or i1 or s)
    $monitor("At time = %t, Output = %d", $time, out);
endmodule

//iverilog -o mux2_1_testbench.vvp mux2_1_testbench.v
//vvp mux2_1_testbench.vvp