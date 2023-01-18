//Test bench for sr latch
`include "sr_latch.v"

module testbench;
  reg clk, rst_n;
  reg s, r;
  wire q, q_bar;
  
  sr_flipflop dff(clk, rst_n, s, r, q, q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; rst_n = 0;
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);
    #3 rst_n = 1;
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);
    
    drive(2'b00);
    drive(2'b01);
    drive(2'b10);
    drive(2'b11);
    #5;
    $finish;
  end
  
  task drive(bit [1:0] ip);
    @(posedge clk);
    {s,r} = ip;
    #1 $display("s=%b, r=%b --> q=%b, q_bar=%b",s, r, q, q_bar);
  endtask
  
  initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(1);
  end
endmodule

//iverilog -o sr_latch_testbench.vvp sr_latch_testbench.v
//vvp sr_latch_testbench.vvp