

//day-51
 module dualram_test();
 
 reg [3:0]datain_a,datain_b;
 reg rst,wen_a,ren_a;
 reg wen_b,ren_b;
 reg clk;
 reg [3:0]addr_a,addr_b;
  wire [3:0]dataout_a,dataout_b;
      
integer i;   
 
 dual_port_ram test(.dataout_a(dataout_a),.dataout_b(dataout_b),.datain_a(datain_a),.datain_b(datain_b),.clk(clk),.rst(rst),.wen_a(wen_a),.wen_b(wen_b),.ren_a(ren_a),.ren_b(ren_b),.addr_a(addr_a),.addr_b(addr_b));


initial clk = 0;
always #5 clk = ~clk;

initial begin
rst = 1;
wen_a = 0;ren_a=0;
wen_b = 0;ren_b=0;

#30;
rst = 0;
wen_a = 1 ; ren_a =0;
 
for(i=0;i<16;i=i+1)begin
addr_a = i;
datain_a = i;
#10;
end


#20;
wen_a = 0;ren_a=1;

for(i=0;i<16;i=i+1)begin
addr_a = i;
datain_a = i;
#10;
end


wen_b = 1 ; ren_b =0;
 
for(i=0;i<16;i=i+1)begin
addr_b = i;
datain_b = i;
#10;
end


#20;
wen_b = 0;ren_b=1;

for(i=0;i<16;i=i+1)begin
addr_b = i;
datain_b = i;
#10;
end


//datain_a = 4'b1010;datain_b=4'b1010;
//#50;
//wen_a = 1;ren_b=1;
//addr_a = 5;addr_b=5;


#50;
$finish;

end
      
 endmodule
