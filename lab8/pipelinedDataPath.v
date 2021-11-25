`include "encoder8_3.v"
`include "ALU.v"
`include "evenParityGenerator.v"

module pipelinedDataPath(input clk, input [7:0] functionCode, input [31:0] A, input [31:0] B, output result);
reg [66:0] pipeline1;
reg [31:0] pipeline2;

wire [2:0] opCode;
wire [31:0] X;
// wire result;
encoder8_3 enc(functionCode,opCode);
ALU alu(pipeline1[66:64],pipeline1[63:32],pipeline1[31:0],X);
evenParityGenerator epg(pipeline2,result);
always @(posedge clk) begin
    pipeline1<={opCode,A,B};
    pipeline2<=X;
end
endmodule;

module tb;
reg clk;
reg [31:0] A,B;
reg [7:0] functionCode;
wire result;
initial clk=0;
always #1 clk=~clk;
pipelinedDataPath pDP(clk,functionCode,A,B,result); 
initial $monitor($time," A=%b, B=%b, result=%b",A,B,result);
initial begin
    #2 A=32'h00000001; functionCode=8'h00; B=32'h00000003;
    #2 A=32'h00000002; functionCode=8'h00; B=32'h00000003;
    #20 $finish;
end
endmodule;
