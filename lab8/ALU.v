module ALU(input [2:0] ctrl, input [31:0] A, input [31:0] B, output reg [31:0] X);
always @(*) begin
    case (ctrl)
        3'b000: X=A+B;
        3'b001: X=A-B;
        3'b010: X=A^B;
        3'b011: X=A|B;
        3'b100: X=A&B;
        3'b101: X=~(A | B);
        3'b110: X=~(A & B);
        3'b111: X=~(A ^ B);
    endcase 
end
endmodule