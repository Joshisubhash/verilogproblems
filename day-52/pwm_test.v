module pwm_test();

 reg clk,rst;
 reg [3:0]reg_value;

 wire out; 

pwm test(.clk(clk),.rst(rst),.reg_value(reg_value),.out(out));

initial clk = 0;
always #5 clk = ~clk;


initial begin
rst = 1;
#30;
rst = 0;

reg_value = 4'b0111;#200;rst=1;#20;
rst=0;
reg_value = 4'b1010;#200;rst=1;#20;
rst=0;
reg_value = 4'b0101;#200;
$finish;



end

endmodule
