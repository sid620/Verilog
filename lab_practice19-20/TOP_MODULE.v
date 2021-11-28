`timescale 1ms/1ns  
`include "MUX_ARRAY.v"
`include "DECODER.v"
`include "MUX_8x1.v"
`include "MEMORY.v"
`include "COUNTER_3BIT.v"
// `include "MUX_2x1.v"
module TOP_MODULE(clk,clr,en,s2,s1,s0,outp,Q);
input clk,clr,en,s2,s1,s0;
output outp;
output [2:0] Q;
wire [7:0] B,G,E;
MEMORY m({s2,s1,s0},G);
COUNTER_3BIT c(clk,clr,Q);
DECODER d(Q[2],Q[1],Q[0],B,en);
MUX_ARRAY ma(B,G,E);
MUX_8x1 m1(Q,E,outp);
endmodule

module tb;
reg clk,clr,en;
reg [2:0] s;
wire outp;
wire [2:0] Q;
initial clk=0;
always #0.5 clk=~clk;
always #8 s=s+1;
TOP_MODULE tm(clk,clr,en,s[2],s[1],s[0],outp,Q);
initial $monitor($time," s=%b Q=%b outp=%b",s,Q,outp);
initial begin
    #0 clr=1'b1;
    #1 clr=1'b0;s=3'b000;
    
    #500 $finish;
end
initial
 begin
    $dumpfile("TOP_MODULE.vcd");
    $dumpvars;
 end
endmodule
