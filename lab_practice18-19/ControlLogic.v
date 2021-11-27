module d_ff(q,d,clk,rst);
input clk,d,rst;
output reg q;
// initial q<=1'b0;
always @(posedge clk) begin
    if(rst)q<=1'b0;
    else if(~d) begin
        q<=1'b0;
    end
    else begin
        q<=1'b1;
    end
end
endmodule

module ControlLogic(z,s,x,t0,t1,t2,clk,set);
input clk,z,s,x,set;
output t0,t1,t2;
d_ff d1(t0,(t0 & (~s))|(t2 & z),clk,set);
d_ff d2(t1,(t0 & s)|(t2 &(~x) & (~z))|(t1 & (~x)),clk,1'b0);
d_ff d3(t2,(t1 & x)|(t2 & x & (~z)),clk,1'b0);
endmodule