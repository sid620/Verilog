module Parity_Checker(data,parity,match);
input [7:0] data;
input parity;
output match;
assign match = parity === (^data)?1'b1:1'b0;
endmodule