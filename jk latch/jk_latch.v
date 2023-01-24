module jk_latch(j, k, clk, reset, q);

    input j, k, clk, reset;
    output reg q;

    always @(posedge clk)
      if(reset == 1)
        q <= 0;
      else
        case ({j,k})
          2'b00: q <= q;
          2'b01: q <= 0;
          2'b10: q <= 1;
          2'b11: q <= ~q;
        endcase
endmodule