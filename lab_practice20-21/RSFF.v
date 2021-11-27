module RSFF(clk,s,r,q,rst);
input s,r,clk,rst;
output reg q;
always @(posedge clk) begin
    if (rst) q<=1'b0;
    else begin 
    case ({s,r})
        2'b01:q<=1'b0;
        2'b10:q<=1'b1;
        2'b11:q<=1'b1;
    endcase 
    end
end
endmodule