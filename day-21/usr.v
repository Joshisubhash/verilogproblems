
module usr(out,in,clk,rst,sel,shift_l,shift_r);

input wire clk,rst;
input [3:0]in;
input wire shift_l,shift_r;
input [1:0]sel;
output reg [3:0]out;

wire din1,din2,din3,din4;
wire dout1,dout2,dout3,dout4;

mux4_1 one(.out(din4),.sel(sel),.in({in[3],shift_r,dout3,dout4}),.clk(clk));
mux4_1 two(.out(din3),.sel(sel),.in({in[2],dout4,dout2,dout3}),.clk(clk));
mux4_1 three(.out(din2),.sel(sel),.in({in[1],dout3,dout1,dout2}),.clk(clk));
mux4_1 four(.out(din1),.sel(sel),.in({in[0],dout2,shift_l,dout1}),.clk(clk));

d_ff  first(.q(dout4),.d(din4),.clk(clk),.rst(rst));
d_ff second(.q(dout3),.d(din3),.clk(clk),.rst(rst));
d_ff  third(.q(dout2),.d(din2),.clk(clk),.rst(rst));
d_ff fourth(.q(dout1),.d(din1),.clk(clk),.rst(rst));

always@(posedge clk)begin
 out[3] <= dout4;
out[2] <= dout3;
out[1] <= dout2;
out[0] <= dout1;
end
endmodule



module d_ff(q,d,clk,rst);

input wire d,clk,rst;
output reg q;

always@(posedge clk)begin
 if(rst)begin
 q<=0;
 end
 else begin
 q <= d;
 end
 end
 
 endmodule
 
 
 module mux4_1(out,sel,in,clk);
 
 input wire [3:0]in;
 input wire clk;
 input wire [1:0] sel;
 
output reg out;

always@(posedge clk)begin
  case(sel)
  2'b00 : out <= in[0];
  2'b01 : out <= in[1];
  2'b10 : out <= in[2];
  2'b11 : out <= in[3];
  default : out <= 0;
  endcase

end


 endmodule
