//sr test bench
 module sr_latch_test();
 
 reg s,r;
 wire q,qb;
 latch test(
 .s(s),
 .r(r),
 .q(q),
 .qb(qb)
 
 );
 
 initial begin
 s=0;r=0;#10;
 s=0;r=1;#10;
 s=1;r=0;#10;
 s=1;r=1;#10;
  s=0;r=0;#10;
 s=0;r=1;#10;

 $finish;
 end 
 endmodule
 
  
  
  
   //d-latch test bench
 module d_latch_test();
 
 reg e,d;
 wire q,qb;
 latch test(
 
  .e(e),
  .d(d),
 .q(q),
 .qb(qb)
 
 );
 
 initial begin
  e=1;d=0;#10;
  e=1;d=1;#10;
  e=0;d=0;#10;
  e=0;d=1;#10;

 $finish;
 end 
 endmodule
