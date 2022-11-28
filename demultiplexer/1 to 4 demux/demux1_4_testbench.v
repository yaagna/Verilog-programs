// Test bench for 1 to 4 demultiplexer
`include "demux1_4.v"

module testbench;
    wire [3:0] y;
    reg i;
    reg [1:0] s;

    demux1_4 demux(i, s, y);

    initial
    begin
        $dumpfile("demux1_4.vcd");
        $dumpvars(0, testbench);

        i = 1;
        s = 2'b00;
        #1 s = 2'b01;
        #1 s = 2'b10;
        #1 s = 2'b11;
    end    
endmodule

//iverilog -o demux1_4_testbench.vvp demux1_4_testbench.v
//vvp demux1_4_testbench.vvp
