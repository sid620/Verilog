`include "decoder2_4.v"
`include "mux4_1.v"
`include "reg_32bit.v"
module RegFile(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
input RegWrite;
input clk,reset;
input [31:0] WriteData;
input [1:0] WriteReg,ReadReg1,ReadReg2;
output [31:0] ReadData1,ReadData2;
wire [3:0] regValue;

// 4 regiters in the register file
reg [4:0][31:0] registers;
wire [3:0][31:0] regOutput;
reg_32bit r1(regOutput[0],registers[0],clk,reset);
reg_32bit r2(regOutput[1],registers[1],clk,reset);
reg_32bit r3(regOutput[2],registers[2],clk,reset);
reg_32bit r4(regOutput[3],registers[3],clk,reset);
// decoder2_4 d1(regValue,ReadReg1);
// decoder2_4 d2(regValue,ReadReg2);
decoder2_4 d3(regValue,WriteReg);
mux4_1 m1(ReadData1,registers[1],registers[2],registers[3],registers[4],ReadReg1);
mux4_1 m2(ReadData2,registers[1],registers[2],registers[3],registers[4],ReadReg2);
initial begin
    registers[1]<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
    registers[2]<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
    registers[3]<=32'b0000_0000_0000_0000_0000_0000_0000_0010;
    registers[4]<=32'b0000_0000_0000_0000_0000_0000_0000_0011;
end
always @(*) begin
    if(RegWrite & clk & (regValue[0] | regValue[1])) begin
        registers[regValue]<=WriteData;
        // $display("Here");
    end
end
endmodule

module tb;
reg clk,reset,RegWrite;
reg [1:0] WriteReg,ReadReg1,ReadReg2;
reg [31:0] WriteData;
wire [31:0] ReadData1,ReadData2;
RegFile f(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
initial clk<=1'b0;
always #5 clk <=~clk;
initial $monitor($time," ReadReg1=%b, ReadReg2=%b, WriteData=%b, WriteReg=%b, RegWrite=%b, ReadData1=%b, ReadData2=%b ",ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
initial reset=1'b0;
initial begin
    #2 ReadReg1=2'b00;ReadReg2=2'b01;RegWrite=1'b0;reset=1'b1; 
    #2 WriteReg=2'b01;RegWrite=1'b1;WriteData=32'b0000_0000_0000_0000_0000_0000_0000_1000;
    #2 RegWrite=1'b0;
    #20 $finish;
end
endmodule