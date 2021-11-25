module evenParityGenerator(input [31:0] inp, output reg bit);
integer i;
// initial #3 bit=inp[0];
always @(*) begin
    bit=inp[0];
    for(i=1;i<32;i=i+1)
        bit = bit ^ inp[i]; 
end
endmodule

// module tb;
// reg [31:0] A;
// wire bit;
// evenParityGenerator x(A,bit);
// initial $monitor($time," A=%b, bit=%b",A,bit);
// initial begin
//     #2 A=32'hABC1FF06;
//     #4 $finish;
// end
// endmodule