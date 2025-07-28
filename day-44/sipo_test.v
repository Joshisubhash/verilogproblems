
module sipo_test();
 
 reg  in;
 reg rst,clk;
 
 wire [3:0]out;
 
sipo test(.out(out),.rst(rst),.clk(clk),.in(in));
initial clk =0;
always #5 clk = ~clk;

initial begin
 rst=1;
 
#30;
rst=0;
 
in = 1; #10;
in = 0; #10;
in = 1; #10;
in = 0; #10;
$finish;
end
endmodule
