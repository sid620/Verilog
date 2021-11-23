// `include "mux4_1.v"  
// assume register file has 4 32 bit register
module decoder2_4(register,register_no);
input [1:0] register_no;
output reg [3:0] register;
always @(*) begin
    case (register_no)
        2'b00: register = 4'b0001;
        2'b01: register = 4'b0010;
        2'b10: register = 4'b0011;
        2'b11: register = 4'b0100;
    endcase 
end
endmodule

// module tb;
// wire [3:0] register;
// reg [1:0] reg_no;
// decoder2_4 d(register,reg_no);
// initial $monitor($time," reg_no=%b register=%b",reg_no,register);
// initial begin
//     #2 reg_no=2'b00;
//     #2 reg_no=2'b01;
//     #2 reg_no=2'b10;
//     #2 reg_no=2'b11;
// end
// endmodule