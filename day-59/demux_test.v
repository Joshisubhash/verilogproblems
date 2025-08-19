
module demux_test();
 reg in;
 reg sel,rst,clk;
 wire out1,out2;
 
 demux test(.in(in),.sel(sel),.rst(rst),.clk(clk),.out1(out1),.out2(out2));
 
 initial clk = 0;
 always #5 clk = ~clk;
 
 
 initial begin
 rst = 1;
 in=0;

 #30;
 rst = 0;
 sel = 0;
 in = 1;#10;
 in = 0;#10;
 sel = 1;
 in = 1;#10;
 in = 0;#10;
 #50;
 $finish;
 
 end
 endmodule
