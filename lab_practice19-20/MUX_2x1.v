module MUX_2x1(a,b,sel,outp);
input a,b,sel;
output outp;
assign outp=sel?a:b;
endmodule