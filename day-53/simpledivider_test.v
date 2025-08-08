
 module simple_divider_test();
 
reg[3:0]divident,divisor;
reg rst,clk;
  wire [3:0]qt,r;
  
  simple_divider test(.qt(qt),.r(r),.divident(divident),.divisor(divisor),.rst(rst),.clk(clk));
  
  initial clk =0;
  always #5 clk = ~clk;
  
  initial begin
  rst =1;
  #30;
  rst=0;
  divident = 4'b1101;
  divisor = 4'b0100;
  #100;
  rst = 1;
  #30;
  rst=0;
  divident = 4'b1100;
  divisor = 4'b0011;
  #50;
  $finish;
  end
  
  endmodule
