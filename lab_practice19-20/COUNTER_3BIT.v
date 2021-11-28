module COUNTER_3BIT(clk,clr,Q);
input clk,clr;
output reg [2:0] Q;
initial Q=3'b000;
always @(posedge clk) begin
    // if(clr) Q=3'b000;
    Q<=Q+1;
end
always @(clr) 
    if(clr)Q<=3'b000;
endmodule