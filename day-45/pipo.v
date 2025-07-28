module pipo(out,rst,clk,in);

input wire [3:0]in;
input rst,clk;
output reg [3:0]out;


always@(posedge clk)begin
if(rst)begin
out <= 0;
end else begin
out <= in;

end
end
endmodule
