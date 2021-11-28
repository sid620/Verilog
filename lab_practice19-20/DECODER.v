module DECODER(A2,A1,A0,B,EN);
input A2,A1,A0;
output reg [7:0] B;
input EN;
always @(A2 or A1 or A0) begin
    if (~EN) B<=8'h00;
    else begin 
    case ({A2,A1,A0})
    3'b000: B<=8'h01;
    3'b001: B<=8'h02;
    3'b010: B<=8'h04;
    3'b011: B<=8'h08;
    3'b100: B<=8'h10;
    3'b101: B<=8'h20;
    3'b110: B<=8'h40;
    3'b111: B<=8'h80;
    endcase
    end
end
endmodule