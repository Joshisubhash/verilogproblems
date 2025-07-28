
module sipo(out,rst,clk,in);

input wire in;
input wire rst,clk;
output reg [3:0]out;

reg [3:0]shift=0;

always@(posedge clk)begin
if(rst)begin
out <= 0;
end else begin
shift <= {shift[2:0],in};
out[3] <= shift[3];
out[2] <= shift[2];
out[1] <= shift[1];
out[0] <= shift[0];

end
 
end
endmodule
