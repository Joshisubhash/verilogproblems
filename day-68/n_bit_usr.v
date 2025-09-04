

module n_bit_usr #(parameter n = 4)(out,in,cntrl,rst,clk,a,b);

input wire [n-1:0]in;
input wire [1:0]cntrl;
input wire rst,clk,a,b;
output reg [n-1:0]out;

always@(posedge clk)begin
if(rst)begin
out <= 0;
end else begin

case(cntrl)
2'b00 : out <= in;
2'b01 : out <= {out[n-2:0],a};
2'b10 : out <= {b,out[n-1:1]};
2'b11 : out <= out;
endcase
 
end

end
endmodule
