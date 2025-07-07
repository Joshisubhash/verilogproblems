module johnson_counter(q,d,clk,rst);

input wire clk,rst,d;
output reg [3:0]q;
 

always@(posedge clk)begin
if(rst)begin
q<=d;
end
else begin
q <= {~q[0],q[3:1]};
end

end
endmodule
