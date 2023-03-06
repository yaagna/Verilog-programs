module sr_latch(r, s, clk, reset, q);

input r, s, clk, reset;
output reg q;

always @(posedge clk)
  if(reset == 1)
    q <= 0;
  else
    case ({s,r})
      2'b00: q <= q;
      2'b01: q <= 0;
      2'b10: q <= 1;
      2'b11: q <= 1'bZ;
    endcase
endmodule
