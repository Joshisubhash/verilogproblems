module truncated_counter(out,firstcount,lastcount,clk,rst,finish);

input wire [3:0]firstcount,lastcount;
input wire clk,rst;
output reg finish;
output reg [3:0]out;
 

always@(posedge clk)begin
if(rst)begin
out <= firstcount;
end else begin
out <= out + 1'b1;
if(out == lastcount)begin
finish <= 1;
out <= firstcount;
end
 
end
 
end

endmodule
