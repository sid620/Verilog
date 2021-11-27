`include "MUX2To1.v"
module MUX16To8(A,B,sel,outp);
input [7:0] A,B;
input sel;
output [7:0] outp;
genvar i;
// always @(sel) begin
    generate for(i=0;i<8;i=i+1) begin: mux_for
        MUX2To1 m1(A[i],B[i],sel,outp[i]);
    end
    endgenerate
// end
endmodule