// implement 4 bit synchronous adder using J-K flip flops
module jk_ff(input clk,input j,input k,output reg q);
initial q<=0;
always @(posedge clk) begin
    if(j==0 && k==1) begin
       q<=0; 
    end
    else if (j==1 && k==0) begin
        q<=1;
    end
    else if (j==1 && k==1) begin
        q<=~q;
    end
end
endmodule

// module testbench;
// reg j,k,clk;
// wire q;
// jk_ff jk(clk,j,k,q);
// initial begin
//     clk=0;
//     // q=0;
// end
// always #3 clk=~clk;
// initial $monitor($time," j=%b, k=%b, q=%b",j,k,q);
// initial begin
//     #4 j=0;k=0;
//     #4 j=0;k=1;
//     #4 j=1;k=0;
//     #4 j=1;k=1;
//     #60 $finish;
// end
// endmodule