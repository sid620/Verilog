module MEMORY(add,value);
input [2:0] add;
output reg [7:0] value;
reg [7:0][7:0] tab;
initial begin
    tab[0]<=8'h01;
    tab[1]<=8'h03;
    tab[2]<=8'h07;
    tab[3]<=8'h0f;
    tab[4]<=8'h1f;
    tab[5]<=8'h3f;
    tab[6]<=8'h7f;
    tab[7]<=8'hff;
end
always @(add) begin
    value <= tab[add];
end
endmodule;