`include "RSFF.v"
module DFF(d,q,clk,rst);
input clk,d,rst;
output q;
RSFF ff(clk,d,~d,q,rst);
endmodule