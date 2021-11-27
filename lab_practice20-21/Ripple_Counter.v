`include "DFF.v"
module Ripple_Counter(clk,rst,Q);
input rst,clk;
output [3:0] Q;
DFF d1(~Q[0],Q[0],clk,rst);
DFF d2(~Q[1],Q[1],~Q[0],rst);
DFF d3(~Q[2],Q[2],~Q[1],rst);
DFF d4(~Q[3],Q[3],~Q[2],rst);
endmodule;