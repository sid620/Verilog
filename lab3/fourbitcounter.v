`include "jk_ff.v"
module fourbitcounter(clk,in,Q1);
input clk,in;
output [3:0] Q1;
wire a,b;
jk_ff jk1(clk,1'b1,1'b1,Q1[0]);
jk_ff jk2(clk,Q1[0],Q1[0],Q1[1]);
jk_ff jk3(clk,a,a,Q1[2]);
jk_ff jk4(clk,b,b,Q1[3]);
// always @(posedge clk) begin          // changing values on posedge will not work as Q1[2] will never become 1 because of combinational part
    assign a=Q1[0] & Q1[1];
    assign b=a & Q1[2];
    // $display("a=%b, b=%b, Q1=%b",a,b,Q1);
// end
endmodule

module testbench;
reg clk,in;
wire [3:0] Q;
fourbitcounter fbc(clk,in,Q);
initial begin
    clk=0;
    // in=1;
    // assign Q=4'b0000;
end
always #2 clk=~clk;
initial $monitor($time," Q=%b",Q);
initial begin
    // #0 in=1;
    #100 $finish;
end
endmodule