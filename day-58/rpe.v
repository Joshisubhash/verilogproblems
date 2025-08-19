
module rpe(out,in,clk,rst);
   input wire rst,clk;
  input wire [3:0]in;
  output reg [1:0]out;
 
  
  reg [3:0]state;
 
  
  always@(posedge clk)begin
  if(rst)begin
  out <= 0;
  state <= 0;
  end else begin
  case(state)
0 : begin
   casex(in)
  4'b???1 : out <= 3;
  4'b??10 : out <= 2;
  4'b?100 : out <= 1;
  4'b1000 : out <= 0;
   endcase 
 
   state <= 1;
   end
   
   
 1 : begin  
     casex(in)
  4'b??10 : out <= 2;
  4'b?100 : out <= 1;
  4'b1000 : out <= 0;
   4'b???1 : out <= 3;
   endcase 
 
   state <= 2;
   end
   
   
2 : begin
    casex(in)
  4'b?100 : out <= 1;
  4'b1000 : out <= 0; 
  4'b???1 : out <= 3;
  4'b??10 : out <= 2;
   endcase 
 
   state <= 3;
   end

3 : begin
    casex(in)
  4'b1000 : out <= 0;
  4'b???1 : out <= 3;
  4'b??10 : out <= 2;
  4'b?100 : out <= 1;
   endcase
 
   state <= 0;
   end
   
   endcase
   end
  end
  
  
 
  
  endmodule
