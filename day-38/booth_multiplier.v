

module booth_multiplier(p,a,b,n,rst,clk);

input wire [3:0]a,b;
input [2:0]n;
input rst,clk;
output reg [7:0]p;

reg [3:0]reg_p,reg_q;
reg qn;
reg [2:0]count;
wire [3:0]c;

assign c = ~(a) + 1;


always@(posedge clk)begin
 

if(rst)begin
reg_q <= b;
count <= n;
qn<=0;
reg_p<=0;
end else begin
$display("only-c-%b ",c);
if(reg_q[0] == qn && count!=0)begin
{reg_p,reg_q} <= {reg_p,reg_q} >>> 1; 
reg_p[3] <= reg_p[3];
qn <= reg_q[0];
count <= count - 1;
$display("1st- %b | %b | %b | %b",reg_p,reg_q,qn,count);
end 
else if(reg_q[0]==0 && qn==1 && count!=0) begin
reg_p = reg_p + a;
{reg_p,reg_q} <= {reg_p,reg_q} >>> 1; 
reg_p[3] <= reg_p[3];
qn <= reg_q[0];
count <= count - 1;
$display("2nd- %b | %b | %b | %b",reg_p,reg_q,qn,count);
end 
else if(reg_q[0]==1 && qn==0 && count!=0)begin
reg_p = reg_p + c;
{reg_p,reg_q} <= {reg_p,reg_q} >>> 1;
reg_p[3] <= reg_p[3];
qn <= reg_q[0];
count <= count - 1;
$display("3rd - %b | %b | %b | %b",reg_p,reg_q,qn,count);
end else begin

p <= {reg_p,reg_q};
$display("%b | %b |%b",p,reg_p,reg_q);
end
 
end
 end
 
endmodule

