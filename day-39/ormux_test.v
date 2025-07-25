module or_gate_using_mux_test();
 reg b;
 reg sel;
 wire out;
 
 or_gate_using_mux test(.b(b),.sel(sel),.out(out));
 
 initial begin
 b=0;sel=0;#20;
 b=0;sel=1;#20;
 b=1;sel=0;#20;
 b=1;sel=1;#20;
 $finish;
 end
 endmodule

