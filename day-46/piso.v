module piso(out,rst,load,clk,a,b,c,d,e,f,g,h);

input a,b,c,d,e,f,g,h,load;
input wire rst,clk;
output reg out;

reg [7:0]d_ff;

always@(posedge clk)begin
if(rst)begin
out <= 0;
end else if(load)begin
d_ff <= {a,b,c,d,e,f,g,h};
out <= 0;
end else begin
d_ff <= {d_ff[6:0],1'b0};
out <= d_ff[7];
end
end
endmodule
