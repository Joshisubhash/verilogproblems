module truncated_counter_test();
  reg [3:0]firstcount,lastcount;
  reg clk,rst;

   wire [3:0]out;
   wire finish;
   
   truncated_counter test(.out(out),.firstcount(firstcount),.lastcount(lastcount),.clk(clk),.rst(rst),.finish(finish));
   
   initial clk=0;
   always #5 clk = ~clk;
   
   initial begin
      firstcount = 4'd3;
   lastcount = 4'd9;
   rst = 1;
   #20;
   rst =0 ;

   
 
   end
   
   endmodule
