// Test bench for 1 to 2 demultiplexer
`include "demux1_2.v"

module testbench;
    reg i, s;
    wire [1:0] y;

    demux1_2 demux(.i(i), .s(s), .y(y));

    initial
    begin
        
    end
endmodule

//iverilog -o demux1_2_testbench.vvp demux1_2_testbench.v
//vvp demux1_2_testbench.vvp
