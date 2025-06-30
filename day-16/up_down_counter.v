
module up_down_counter(count,clk,rst,cntrl);

input wire clk,rst;
input wire cntrl;

output reg [3:0]count;


always@(posedge clk)begin

if(cntrl)begin
 if(rst)begin
  count <= 4'b0000;
  end
  else begin
  count <= count + 4'b0001;
  end
  end
 else begin
  if(rst)begin
  count <= 4'b1111;
  end
  else begin
  count <= count - 4'b0001;
  end
  end


end
endmodule




