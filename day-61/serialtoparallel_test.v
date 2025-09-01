
module serialtoparallel_test();
 
 reg in;
 reg rst,clk;
 
 wire [7:0]out;
 
 initial clk=0;
 always #5 clk = ~clk;
 
 serialtoparallel test(.out(out),.in(in),.rst(rst),.clk(clk));
 
 initial begin
 
 
 rst = 1;
 #30;
 rst =0;
 in=1;#10;
 in=0;#10;
 in=1;#10;
 in=0;#10;
 in=1;#10;
 in=0;#10;
 in=1;#10;
  in=0;#10;
 
 
 end
 
 endmodule
