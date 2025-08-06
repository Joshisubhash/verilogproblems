
module dual_port_ram(dataout_a,dataout_b,datain_a,datain_b,clk,rst,wen_a,wen_b,ren_a,ren_b,addr_a,addr_b);

input wire [3:0]datain_a,datain_b;
input wire rst,wen_a,ren_a;
input wire wen_b,ren_b;
input wire clk;
input wire [3:0]addr_a,addr_b;
output reg [3:0]dataout_a,dataout_b;

reg [3:0]mem[0:15];
always@(posedge clk)begin
if(rst)begin
dataout_a <= 0;
dataout_b <= 0;
end else begin
if(wen_a)begin
mem[addr_a] <= datain_a;
end 

if(ren_a)begin
dataout_a <= mem[addr_a];
end
 
end





if(wen_b)begin
mem[addr_b] <= datain_b;
end 

if(ren_b)begin
dataout_b <= mem[addr_b];
end
 
end

endmodule
