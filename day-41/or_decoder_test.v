
 module or_gate_using_decoder_test();
 
 reg a,b;
 wire [3:0]out;
 
 
 or_gate_using_decoder test(.a(a),.b(b),.out(out));
 
 
 initial begin
 a=0;b=0;#20;
 a=0;b=1;#20;
 a=1;b=0;#20;
 a=1;b=1;#20;
 $finish;
 
 end
 
 endmodule
