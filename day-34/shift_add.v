//If a is an input, you cannot write a = a << 1; inside an always block —
//because inputs are read-only. You cannot modify inputs in Verilog — it's a rule meant to preserve the
//modular and hierarchical nature of digital design.

module shift_add(out,a,b,clk,rst);
input wire clk,rst;
input wire [3:0]b;
input wire [7:0]a;
output reg [7:0]out;


 
  reg [7:0]reg_out=0;
 reg [7:0]reg_a;
 reg [3:0]reg_b;

 

always@(posedge clk)begin
if(rst)begin
reg_a <= a;
reg_b <= b;
reg_out <=0;  
out<=0;
end else begin


if(reg_b[0])begin
reg_out <= reg_out + reg_a;
//reg_a <= reg_out;
reg_a <= reg_a << 1;
reg_b <= reg_b >> 1;
 $display("%b | %b | %b ",reg_a,reg_b,reg_out);
end

else if(reg_b == 4'b0)begin
out <= reg_out;

end
else begin
reg_a <= reg_a << 1;
reg_b <= reg_b >> 1;
 
end

end
end
 
endmodule
