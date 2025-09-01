module serialtoparallel(out,in,rst,clk);
   
   input wire in;
   input wire rst,clk;
   
   output reg [7:0]out;
   
   reg [7:0]shift=0;
   reg [3:0]count=0;
   
   always@(posedge clk)begin
   if(rst)begin
   out<=0;
   end else begin
   shift <= {shift[6:0],in};
   count <= count + 1'b1;
   if(count == 7'd8)begin
   out <= shift;
   end
   $display("%b | %b",shift,count);
   
   
   end
   end
   endmodule
