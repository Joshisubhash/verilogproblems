module and_gate_using_mux_test();
 
 
 reg a;
 reg sel;
 wire out;
 
 and_gate_using_mux test(.a(a),.sel(sel),.out(out));
 
 initial begin
 a=0;sel=0;#20;
 a=0;sel=1;#20;
 a=1;sel=0;#20;
 a=1;sel=1;#20;
 $finish;
 end
 
 
 endmodule
