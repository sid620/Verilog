module TFF(t,q,clk,clear);
input clk,t,clear;
output reg q;
always @(posedge clk) begin
    if(clear) q<=1'b0;
    else if (t)q<=~q;
    else q<=q;
end
endmodule