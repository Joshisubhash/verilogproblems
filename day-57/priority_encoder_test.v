
 module priority_encoder_test();
 
reg clk;
reg [3:0]in;
 wire [1:0]out;
 
 
  priority_encoder test(.out(out),.in(in),.clk(clk));
 
 initial clk=0;
 always #5 clk = ~ clk;
 
 initial begin
 in = 0000;#10;
 in = 1000;#10;
 in = 0100;#10;
 in = 1010;#10;
 in = 0001;#10;
 in = 1011;#10;
 #10;
 $finish;

 end
  
 endmodule
