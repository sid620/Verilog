module MUX2To1(a,b,sel,outp);
input a,b,sel;
output outp;
assign outp=sel?a:b;
endmodule