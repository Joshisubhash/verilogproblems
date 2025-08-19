
module demux(out1,out2,sel,in,rst,clk); 
  
  input wire in;
  input sel,rst,clk;
  output reg out1,out2;
  
  always@(posedge clk)begin
  if(rst)begin
  out1 <= 0;
  out2 <= 0;
  end else begin
   case(sel)
   0 : out1 <= in;
  1 : out2 <= in;
  endcase
  
  end
  
  
  end
  
  endmodule
