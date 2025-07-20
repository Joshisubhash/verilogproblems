 
 module clock_divider_test();
 
 reg clk,rst;
 wire  out;
 
 
clock_divider test(
 .clk(clk),
 .rst(rst),
 .out(out)
 
 );
 
 initial clk =0;
 always #5 clk = ~clk;
 
 
 
 initial begin
 
 rst = 1;
 #20;
 rst=0;
 
 
 end
 
 endmodule
