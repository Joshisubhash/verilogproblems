

module odd_counter(out,rst,clk);

input wire clk,rst;
output reg [3:0]out;

reg [3:0]count;
always@(posedge clk)begin
if(rst)begin
out <= 0;
count <= 1'b1;
end else begin
//count <= count + 1'b1;
//if(count % 2 != 0)begin
//out <= count;
//end 
//if(count[0] == 1)begin
//out <= count;
//end
count <= count + 2'd2;
 out <= count;
end
 end
endmodule
