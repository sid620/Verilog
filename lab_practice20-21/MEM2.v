module MEM2(index,data,parity);
input [2:0] index;
output reg [7:0] data;
output reg parity;
reg [7:0][8:0] tab;
initial begin
    tab[0]=9'b000000000;
    tab[1]=9'b001000100;
    tab[2]=9'b010001000;
    tab[3]=9'b011001100;
    tab[4]=9'b100010000;
    tab[5]=9'b101010100;
    tab[6]=9'b110011000;
    tab[7]=9'b111011100;
end
always @(index) begin
    // data<=tab[index][8:1];
    // parity<=tab[index][0];
    case (index)
    3'b000:begin 
        data<=tab[3'b000][8:1];
        parity<=tab[3'b000][0];
    end
    3'b001:begin
        data<=tab[3'b001][8:1];
        parity<=tab[3'b001][0];
    end
    3'b010:begin
        data<=tab[3'b010][8:1];
        parity<=tab[3'b011][0];
    end
    3'b011:begin
        data<=tab[3'b011][8:1];
        parity<=tab[3'b011][0];
    end
    3'b100:begin
        data<=tab[3'b100][8:1];
        parity<=tab[3'b100][0];    
    end
    3'b101:begin
        data<=tab[3'b101][8:1];
        parity<=tab[3'b101][0];
    end
    3'b110:begin
        data<=tab[3'b110][8:1];
        parity<=tab[3'b110][0];
    end
    3'b111:begin
        data<=tab[3'b111][8:1];
        parity<=tab[3'b111][0];
    end
    endcase

end
endmodule