module siso(out,clk,rst,in);

input wire in;
input wire clk,rst;
output reg out;

 

reg [3:0]shift=0;

always@(posedge clk)begin
if(rst)begin
out <= 0;
end else begin
 
shift <= {shift[2:0],in};
out <= shift[3];

end
end
endmodule
