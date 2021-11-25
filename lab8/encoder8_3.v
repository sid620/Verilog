module encoder8_3(inp,outp);
input [7:0] inp;
output reg [2:0] outp;
always @(*) begin
    outp[2]=inp[7] | inp[6] | inp[5] | inp[4];
    outp[1]=inp[7] | inp[6] | inp[3] | inp[2];
    outp[0]=inp[7] | inp[5] | inp[3] | inp[1];
end
endmodule;

// module tb;
// reg [7:0] inp;
// wire [2:0] outp;
// encoder8_3 enc(inp,outp);
// initial $monitor($time, " inp=%b outp=%b",inp,outp);
// initial begin
//     #2 inp=8'h04;
// end
// endmodule