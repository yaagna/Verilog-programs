// Test bench for 1 to 4 demultiplexer
`include "demux1_4.v"

module testbench;
    wire [3:0] y;
    reg i;
    reg [1:0] s;

    demux1_4 demux(i, s, y);

    
endmodule