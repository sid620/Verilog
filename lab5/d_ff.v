// d flip flop with active low reset
module d_ff(q,d,clk,reset);
input clk,reset,d;
output reg q;
always @(posedge clk or negedge reset) begin
    if(!reset) begin
        q<=1'b0;
    end
    else begin
        q<=d;
    end
end
endmodule