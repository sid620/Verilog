`include "Ripple_Counter.v"
`include "Parity_Checker.v"
`include "Fetch_Data.v"
module Design(clk,rst,match,Q,s_data, s_parity);
input clk,rst;
output match;
output [3:0] Q;
output [7:0] s_data;
output s_parity;
Ripple_Counter rc(clk,rst,Q);
Fetch_Data fc(Q,s_data,s_parity);
Parity_Checker pc(s_data,s_parity,match);
endmodule

module TestBench;
reg clk,rst;
wire match,s_parity;
wire [3:0] Q;
wire [7:0] s_data;
initial clk=1'b0;
always #1 clk=~clk;
Design d(clk,rst,match,Q,s_data,s_parity);
initial $monitor($time," Q=%b, s_data=%b, s_parity=%b, match=%b",Q,s_data,s_parity,match);
initial begin
    #0 rst=1'b1;
    #5 rst=1'b0;
    #50 $finish;
end
endmodule
