module siso_test();
 
 reg  in;
 reg rst,clk;
 
 wire out;
 
siso test(.out(out),.rst(rst),.clk(clk),.in(in));
initial clk =0;
always #5 clk = ~clk;

initial begin
 
rst=0;
 
in = 1; #10;
in = 0; #10;
in = 1; #10;
in = 0; #10;
in = 1; #10;
in = 0; #10;
in = 1; #10;
in = 0; #10;
in = 1; #10;
in = 0; #10;
in = 1; #100;


$finish;
end


endmodule
