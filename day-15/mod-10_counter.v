module counter(out,clk,rst);
 
input clk,rst;
output reg [3:0]out;


always@(posedge clk)begin
if(rst)begin
 out<=4'b0000;
 end
 else begin
  if(out == 4'd9)begin
  out<=4'b0000;
 end
 else begin
 out <= out +4'b0001;
 end
 end

end
endmodule
