
 module lfsr_test();
 
 reg rst,clk;
 reg [3:0]datain;
 
 wire [3:0]out;
 
 
 lfsr test(
 .rst(rst),
 .clk(clk),
 .datain(datain),
 .out(out)
 );
 
 initial clk = 0;
 always #5 clk = ~clk;

initial begin
rst = 1;
datain = 1001;
#20;
rst = 0;



end
 endmodule
