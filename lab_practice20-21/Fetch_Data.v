`include "MEM1.v"
`include "MEM2.v"
// `include "MUX2To1.v"
`include "MUX16To8.v"
module Fetch_Data(count,data,parity);
input [3:0] count;
output [7:0] data;
output parity;
wire [7:0] d1,d2;
wire p1,p2;
MEM1 m1(count[2:0],d1,p1);
MEM2 m2(count[2:0],d2,p2);
MUX16To8 m3(d1,d2,count[3],data);
MUX2To1 m4(p1,p2,count[3],parity);
endmodule