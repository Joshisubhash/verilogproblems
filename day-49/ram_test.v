module ram_test();
 
reg [3:0]datain,addr;
reg   rst,clk;
reg   w_en,r_en;
wire [3:0]out;
      
integer i;   
ram test(.out(out),.datain(datain),.addr(addr),.rst(rst),.clk(clk),.w_en(w_en),.r_en(r_en));


initial clk = 0;
always #5 clk = ~clk;

initial begin
rst = 1;
w_en = 0;r_en=0;

#30;
rst = 0;
w_en = 1;r_en=0;
//addr = 4'b0000;    datain = 4'b0000; #10;
//addr = 4'b0001;    datain = 4'b0001; #10;
//addr = 4'b0010;    datain = 4'b0010; #10;
//addr = 4'b0011;    datain = 4'b0011; #10;
//addr = 4'b0100;    datain = 4'b0100; #10;
//addr = 4'b0101;    datain = 4'b0101; #10;
//addr = 4'b0110;    datain = 4'b0110; #10;
//addr = 4'b0111;    datain = 4'b0111; #10;
//addr = 4'b1000;    datain = 4'b1000; #10;
//addr = 4'b1001;    datain = 4'b1001; #10;
//addr = 4'b1010;    datain = 4'b1010; #10;
//addr = 4'b1011;    datain = 4'b1011; #10;
//addr = 4'b1100;    datain = 4'b1100; #10;
//addr = 4'b1101;    datain = 4'b1101; #10;
//addr = 4'b1110;    datain = 4'b1110; #10;
//addr = 4'b1111;    datain = 4'b1111; #10;
for(i=0;i<16;i=i+1)begin
addr = i;
datain = i;
#10;
end


#20;
w_en = 0;r_en=1;
//addr = 4'b0000; #10; 
//addr = 4'b0001; #10; 
//addr = 4'b0010; #10; 
//addr = 4'b0011; #10; 
//addr = 4'b0100; #10; 
//addr = 4'b0101; #10; 
//addr = 4'b0110; #10; 
//addr = 4'b0111; #10; 
//addr = 4'b1000; #10; 
//addr = 4'b1001; #10; 
//addr = 4'b1010; #10; 
//addr = 4'b1011; #10; 
//addr = 4'b1100; #10; 
//addr = 4'b1101; #10; 
//addr = 4'b1110; #10; 
//addr = 4'b1111; #10; 
for(i=0;i<16;i=i+1)begin
addr = i;
datain = i;
#10;
end
#50;
$finish;

end
      
 endmodule
