
 module single_port_ram_test#(n=4,m=16)();
 
reg clk,rst;    
reg w_en,r_en;  
reg [n-1:0]addr;       
reg [n-1:0]din; 
 wire [n-1:0]dout;

reg [n-1:0]dout_expected;
integer i;


single_port_ram test(.clk(clk),.rst(rst),.w_en(w_en),.r_en(r_en),.addr(addr),.din(din),.dout(dout));


initial clk = 0;
always #5 clk = ~clk;


reg [m-1:0]mem[0:m-1];

always@(posedge clk)begin
if(rst)begin
dout_expected <= 0;
end else begin
if(w_en && r_en == 0)begin
mem[addr] <= din;
end 
else if(r_en && w_en == 0)begin
dout_expected <= mem[addr];
end else begin

end

end
end




initial begin
rst = 1;
#25;
rst = 0;

w_en = 1;r_en = 0;
for(i=0;i<16;i=i+1)begin
@(posedge clk)
addr = i;
din = $random;
end
#20;

w_en = 0;r_en = 1;
for(i=0;i<16;i=i+1)begin
@(posedge clk)
addr = i;
end


end

always@(posedge clk)begin
if(dout!=dout_expected)begin
$display("%d | %d",dout,dout_expected); 
end

end



endmodule


