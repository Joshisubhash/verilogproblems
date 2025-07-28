 module pipo_test();
 
 reg  [3:0]in;
 reg rst,clk;
 
 wire [3:0]out;
 
pipo test(.out(out),.rst(rst),.clk(clk),.in(in));
initial clk =0;
always #5 clk = ~clk;

initial begin
// rst=1;
//#30;
rst=0;
in = 4'b1010;#10;
in = 4'b0101;#10;
in = 4'b0011;#10;
in = 4'b1100;#10;
 #100; 
$finish;
end


endmodule
