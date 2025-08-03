 module ram(out,datain,addr,rst,clk,w_en,r_en);
 
 input wire [3:0]datain,addr;
 input rst,clk;
 input w_en,r_en;
 output reg [3:0]out;
 
 reg [3:0] mem[0:15];
 
 always@(posedge clk)begin
 if(rst)begin
 out <= 0;
 end else begin
 if(w_en)begin
 mem[addr] <= datain;
 end 
 
 if(r_en)begin
 out <= mem[addr];
 end
  
 end 
 end
  
 endmodule
