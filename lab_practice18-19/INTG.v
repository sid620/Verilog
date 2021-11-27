`timescale 1ms/1ns
`include "ControlLogic.v"
// `include "TFF.v"
`include "COUNTER_4BIT.v"


module INTG(clk,s,x,g,Q,set);
input clk,s,x,set;
output g;
output [3:0] Q;
wire t0,t1,t2;
ControlLogic cl(Q[0] & Q[1] & Q[2] & Q[3],s,x,t0,t1,t2,clk,set);
COUNTER_4BIT cb((t1 & x) | (t2 & x & (~(Q[0] & Q[1] & Q[2] & Q[3]))),clk,Q,t0 & s);
d_ff d(g,t2 & Q[0] & Q[1] & Q[2] & Q[3],clk,1'b0);
endmodule

module tb;
reg clk,s,x,set;
wire g;
wire [3:0] Q;
initial clk=0;
always #0.5 clk=~clk;
INTG intg(clk,s,x,g,Q,set);
initial $monitor($time," g=%b Q=%b",g,Q);
initial begin
    #0 x=1'b0; s=1'b0; set=1'b1;
    #5 x=1'b1;s=1'b1;set=1'b0;
    # 50 $finish;
end
endmodule;

