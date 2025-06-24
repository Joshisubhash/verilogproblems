
module barrel_shifter(out,sel,a,b,c,d,clk);

input wire a,b,c,d;
input wire [1:0] sel;
input clk;
output wire [3:0]out;

mux one(.out(out[3]),.sel(sel),.a(d),.b(a),.c(b),.d(c),.clk(clk));
mux two(.out(out[2]),.sel(sel),.a(b),.b(d),.c(a),.d(b),.clk(clk));
mux three(.out(out[1]),.sel(sel),.a(b),.b(c),.c(d),.d(a),.clk(clk));
mux four(.out(out[0]),.sel(sel),.a(a),.b(b),.c(c),.d(d),.clk(clk));
  
endmodule



module mux(out,sel,a,b,c,d,clk);
input wire a,b,c,d;
input wire [1:0] sel;
input clk;
output reg out;
always@(posedge clk)begin
case(sel)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
2'b11 : out <= d;
endcase        
end
endmodule

