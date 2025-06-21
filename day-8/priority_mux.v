module priority_mux(
 input wire [3:0]in,
 input wire clk,
 output reg out

);

 always@(posedge clk)begin
 casez(in) 
 4'b???1 : out = in[0];
 4'b??10 : out = in[1];
 4'b?100 : out = in[2];
 4'b1000 : out = in[3];
 default : out = 0;
 endcase
 end
 endmodule



//for bettter ouptu of priority mux with highest priority will be 1 and remaining will be 0
 
module priority_mux(
 input wire [3:0]in,
 input wire clk,
 output reg [3:0]out

);

 always@(posedge clk)begin
 casez(in) 
 4'b???1 : out = {1'b0,1'b0,1'b0,in[0]};
 4'b??10 : out = {1'b0,1'b0,in[1],1'b0};
 4'b?100 : out = {1'b0,in[2],1'b0,1'b0};
 4'b1000 : out = {in[3],1'b0,1'b0,1'b0};
 default : out = 0;
 endcase
 end
 endmodule
