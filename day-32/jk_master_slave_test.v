
 module master_slave_test();
 
 reg j,k;
 reg clk;
 reg rst;
 wire q,qb;
 
 
 master_slave test(
 .j(j),
 .k(k),
 .rst(rst),
 .clk(clk),
 .q(q),
 .qb(qb)
 
 );
 
 initial clk = 0;
 always #5 clk = ~clk;
  
 always@(posedge clk)begin
 $display("%b | %b | %b | %b", j, k, q, qb);
end

 initial begin
 rst = 1;#10;
 rst = 0;
 j=0;k=0;#20;
 j=0;k=1;#20;
 j=1;k=0;#20;
 j=1;k=1;#20;
 j=0;k=0;#20;
 j=0;k=1;#20;
 
 $finish;
  
 end
  

 endmodule
