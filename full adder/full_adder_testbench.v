//Test bench for halfadder
`include "full_adder.v"

module testbench;
    reg a, b, cin;
    wire sum, cout;
    
    full_adder add1(a, b, cin, sum, cout);
    
    initial 
    begin
      $dumpfile("full_adder.vcd");
      $dumpvars(0, testbench);
      a = 1'b0; b = 1'b0; cin = 1'b0; 
      #2;
      a = 1'b0; b = 1'b1; cin = 1'b0;
      #2;
      a = 1'b1; b = 1'b0; cin = 1'b0;
      #2;
      a = 1'b1; b = 1'b1; cin = 1'b0;
      #2;
      a = 1'b0; b = 1'b0; cin = 1'b1;
      #2;
      a = 1'b0; b = 1'b1; cin = 1'b1;
      #2;
      a = 1'b1; b = 1'b0; cin = 1'b1;
      #2;
      a = 1'b1; b = 1'b1; cin = 1'b1;
    end
endmodule

//iverilog -o full_adder_testbench.vvp full_adder_testbench.v
//vvp full_adder_testbench.vvp
