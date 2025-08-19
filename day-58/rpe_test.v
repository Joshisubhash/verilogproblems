module rpe_test();
 
reg rst,clk;
reg [3:0]in;
 wire [1:0]out;
 
 
  rpe test(.out(out),.in(in),.clk(clk),.rst(rst));
 
 initial clk=0;
 always #5 clk = ~ clk;
 
 initial begin
 rst = 1;
 #30;
 rst = 0; 
 
 in = 1000;#10;
 in = 0100;#10;
 in = 1010;#10;
 in = 0001;#10;
 in = 1011;#10;
 #10;
 $finish;

 end
  
 endmodule
