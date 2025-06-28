module counter_fsm_test();

 
reg clk;
reg rst;
reg start;
wire [3:0]out;


counter_fsm test(
.clk(clk),
.rst(rst),
.out(out),
.start(start)

);

initial clk = 0;
always #5 clk = ~clk;

initial begin
start =1;#10;
start=0;
rst = 0;
 



end
 endmodule
