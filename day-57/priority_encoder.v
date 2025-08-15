
  module priority_encoder(out,in,clk);
  input wire clk;
  input wire [3:0]in;
  output reg [1:0]out;
  
  
  always@(posedge clk)begin
 
  casex(in)
  4'b???1 : out <= 3;
  4'b??10 : out <= 2;
  4'b?100 : out <= 1;
  4'b1000 : out <= 0;
 
   endcase
  end
  endmodule
