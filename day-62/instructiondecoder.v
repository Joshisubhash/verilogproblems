
 module instruction_decoder(out,wen_reg,ren_mem,in,rst,clk);
   
   input wire [2:0]in;
   input wire rst,clk;
   
   output reg [2:0]out;
   output reg wen_reg;
   output reg ren_mem;
   
   parameter add=3'b001,sub=3'b010,mul=3'b011,div=3'b100,load=3'b101;
   
   
   always@(posedge clk)begin
   if(rst)begin
   out <= 0;
   wen_reg = 0;
   ren_mem = 0;
   end else begin
   case(in[2:0])
   add : begin
          out <= in[2:0];
          wen_reg <= 1;
         end
    sub : begin
          out <= in[2:0];
          wen_reg <= 1;
         end
   mul : begin
          out <= in[2:0];
          wen_reg <= 1;
         end
    div : begin
          out <= in[2:0];
          wen_reg <= 1;
         end   
    load : begin
          out <= in[2:0];
          wen_reg <= 1;
          ren_mem <= 1;
         end
         
   
   endcase
   end
    
   end
    
   endmodule
