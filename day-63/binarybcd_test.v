module binary_bcd_test();
  
  reg [3:0]dec_in;
  reg rst,clk;
  
   wire [3:0]hundred,tens,ones;
   
   binary_bcd test(.hundred(hundred),.tens(tens),.ones(ones),.rst(rst),.clk(clk),.dec_in(dec_in));
   
   initial clk=0;
   always #5 clk = ~clk;
   
   
   initial begin
   rst = 1;
   #30;
   rst =0;
   dec_in = 4'd13;
   #120;
     rst = 1;
   #30;
   rst =0;
   dec_in = 4'd10;
   
   end
   
   endmodule
