`include "MUX_2x1.v"
module MUX_ARRAY(B,G,E);
input [7:0] B;
input [7:0] G;
output [7:0] E;
genvar i;
generate
     for(i=0;i<8;i=i+1) begin: for_loop
        MUX_2x1 m1(B[i],1'b0,G[i],E[i]);
     end
endgenerate
endmodule