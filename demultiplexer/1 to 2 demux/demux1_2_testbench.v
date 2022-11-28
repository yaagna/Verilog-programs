// Test bench for 1 to 2 demultiplexer
`include "demux1_2.v"

module testbench;
    reg i, s;
    wire [1:0] y;

    demux1_2 demux(.i(i), .s(s), .y(y));

    initial
    begin
        s = 0;
        i = 0;
    end
    always #2 s = s + 1'b1;                 //every 2 seconds, toggle select pin
endmodule

//iverilog -o demux1_2_testbench.vvp demux1_2_testbench.v
//vvp demux1_2_testbench.vvp
