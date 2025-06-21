module tri_state_test();

reg a,b,c,d,s0,s1,e;
wire ao,bo,co,do;

tri_state test (
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.s0(s0),
.s1(s1),
.ao(ao),
.bo(bo),
.co(co),
.do(do)

);


initial begin

 a = 1'b1;
 b = 1'b1;
 c = 1'b1;
 d = 1'b0;
 e = 1;
 s0 = 1'b0;s1 = 1'b0;#10;
 s0 = 1'b0;s1 = 1'b1;#10;
 s0 = 1'b1;s1 = 1'b0;#10;
 s0 = 1'b1;s1 = 1'b1;#10;
 e = 0;
 s0 = 1'b0;s1 = 1'b0;#10;
 s0 = 1'b0;s1 = 1'b1;#10;
 s0 = 1'b1;s1 = 1'b0;#10;
 s0 = 1'b1;s1 = 1'b1;#10;
 $finish;
 

end

endmodule

  
