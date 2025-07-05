
 module parity_checker_test();
 
 reg in,rst,clk,done;
 wire out;
 
 parity_checker test(
 .clk(clk),
 .rst(rst),
 .in(in),
 .done(done),
   .out(out) 
 
 );
 
 initial clk = 0;
 always #5 clk =~clk;
 
 
 always@(posedge clk)begin
 
 $display("%b , %b " , in,out);
 
 end
 
 initial begin
 done =0;
 rst = 1;#10;
 rst=0;#10;
 
 in = 1; #10;
 in = 0; #10;
 in = 1; #10;
 in = 0; #10;
 in = 1; #10;
 in = 0; #10;
 in = 1; #10;
 in = 0;#10;
 in = 1;#10;
 in = 0;#10;
// in = 1;#10; //for even one 
 
 done=1; #50;
 $finish;
 
 
 
 
 end
 endmodule
