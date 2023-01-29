//Test bench for full subtractor
`include "full_sub.v"
`timescale 1ns/1ns

module testbench;
    reg a, b, bin;
    wire diff, bout;
    
    full_sub sub1(a, b, diff, bin, bout);
    
    initial 
    begin
      $dumpfile("full_sub.vcd");
      $dumpvars(0, testbench);
      a = 1'b0; b = 1'b0; bin = 1'b0; 
      #2;
      a = 1'b0; b = 1'b1; bin = 1'b0;
      #2;
      a = 1'b1; b = 1'b0; bin = 1'b0;
      #2;
      a = 1'b1; b = 1'b1; bin = 1'b0;
      #2;
      a = 1'b0; b = 1'b0; bin = 1'b1;
      #2;
      a = 1'b0; b = 1'b1; bin = 1'b1;
      #2;
      a = 1'b1; b = 1'b0; bin = 1'b1;
      #2;
      a = 1'b1; b = 1'b1; bin = 1'b1;
    end
endmodule

//iverilog -o full_sub_testbench.vvp full_sub_testbench.v
//vvp full_sub_testbench.vvp
