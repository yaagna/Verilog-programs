//Test bench for sr latch
`include "sr_latch.v"

module testbench;

        reg clk;
        reg [1:0] sr;
        wire q, qb;

        sr_latch sub1(.sr(sr), .clk(clk), .q(q), .qb(qb));

endmodule