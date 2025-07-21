
 
 module booth_multiplier_test();
 
 reg [3:0]a,b;
 reg [2:0]n;
 reg rst,clk;
 wire [7:0]p;
 
 
 booth_multiplier test(
 .a(a),.b(b),.n(n),.rst(rst),.p(p),.clk(clk)
 );
 
 initial clk=0;
 always #5 clk=~clk;
 
 initial begin
 a = 4'b0010;
 b = 4'b1101;
 n =4;
 rst = 1;
 #10;
 rst = 0;
 
 
 
 
 end
 endmodule
 
