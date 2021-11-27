`include "TFF.v"
module COUNTER_4BIT(en,clock,Q,clr);
input en,clock,clr;
output [3:0] Q;
wire clk;
assign clk=clock & en;
TFF t0(1'b1,Q[0],clk,clr);
TFF t1(Q[0],Q[1],clk,clr);
TFF t2(Q[0] & Q[1],Q[2],clk,clr);
TFF t3(Q[2] & Q[1] & Q[0],Q[3],clk,clr);
endmodule;

