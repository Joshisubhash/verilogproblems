
   module odd_counter_test();
   
   reg clk,rst;
   wire [3:0]out;
   
   odd_counter test(.rst(rst),.clk(clk),.out(out));
   
   initial clk = 0;
   always #5 clk = ~clk;
   
   initial begin
   rst = 1;
   #25;
   rst = 0;
   
   
   
   end
   
   endmodule
