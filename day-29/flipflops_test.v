
module flipflop_test();

  //for jk_flipflop
//reg j,k,rst,clk;
//wire q,qb;
//flipflops test(
//.j(j),
//.k(k),
//.rst(rst),
//.clk(clk),
//.q(q),
//.qb(qb)
//);


  //for sr_flipflop
//reg s,r,rst,clk;
//wire q,qb;
//sr_flipflops test(
// .s(s),
// .r(r),
//.rst(rst),
//.clk(clk),
//.q(q),
//.qb(qb)
 
//);

//for T_flipflop
reg t,rst,clk;
wire q,qb;
t_flipflops test(
  .t(t),
.rst(rst),
.clk(clk),
.q(q),
 .qb(qb)
);
initial clk=0;
always #5 clk = ~clk;
initial begin
rst=1;
#20;
rst=0;
//j=0;k=0;#20;
//j=0;k=1;#20;
//j=1;k=0;#20;
//j=1;k=1;#20;
//j=0;k=0;#20;
//j=0;k=1;#20;

//s=0;r=0;#20;
//s=0;r=1;#20;
//s=1;r=0;#20;
//s=1;r=1;#20;
//s=0;r=0;#20;

t=0;#20;
t=0;#20;
t=0;#20;
t=0;#20;
t=0;#20;
t=1;#20;
t=1;#20;
t=1;#20;
t=1;#20;
t=1;#20;
t=0;#20;
t=1;#20;
t=1;#20;
t=1;#20;
t=1;#20;
t=1;#20;
$finish;
end
endmodule
