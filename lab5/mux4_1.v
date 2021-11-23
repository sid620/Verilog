// `include "reg_32bit.v"
module mux4_1(regData,q1,q2,q3,q4,reg_no);
input [31:0] q1,q2,q3,q4;
input [1:0] reg_no;
output reg [31:0] regData;
always @(*) begin
if (reg_no === 2'b00) begin
    assign regData=q1;
end
else if (reg_no === 2'b01) begin
    assign regData=q2;
end
else if (reg_no === 2'b10) begin
    assign regData=q3;
end
else begin
    assign regData=q4;
end
end
endmodule

// module tb;
// wire [31:0] regData;
// reg [31:0] q1,q2,q3,q4;
// reg [1:0] reg_no;
// initial $monitor($time," regData=%b",regData);
// mux4_1 m(regData,q1,q2,q3,q4,reg_no);
// initial begin
//     #0 q1=32'd1; q2=32'd2; q3=32'd3; q4=32'd4;
//     #2 reg_no=2'b00;
//     #2 reg_no=2'b01;
//     #2 reg_no=2'b10;
//     #2 reg_no=2'b11;
// end
// endmodule;