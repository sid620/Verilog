`include "d_ff.v"
module reg_32bit(q,d,clk,rst);
input [31:0] d;
input clk,rst;
output [31:0] q;
genvar j;
generate for (j=0;j<32;j=j+1) begin: reg_loop
    d_ff r(q[j],d[j],clk,rst);
end      
endgenerate  
endmodule

//testbench
// module tb32reg;
// reg [31:0] d;
// reg clk,reset;
// wire [31:0] q;
// reg_32bit R(q,d,clk,reset);
// always @(clk)
// #5 clk<=~clk;
// initial $monitor($time," d=%b",q);
// initial
// begin
// clk= 1'b1;
// reset=1'b0;//reset the register
// #20 reset=1'b1;
// #20 d=32'hAFAFAFAF;
// #200 $finish;
// end
// endmodule