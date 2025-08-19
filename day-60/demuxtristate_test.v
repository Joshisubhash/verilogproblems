module demuxtristate_test();
 
 
 reg in;
 reg [1:0]sel;
 wire out1,out2,out3,out4;
 
 demux_tristate test(.in(in),.sel(sel),.out1(out1),.out2(out2),.out3(out3),.out4(out4));
 
 
 
 initial begin
 
 in = 1;
 sel = 00;
 in = 1;#10;
 in = 0;#10;
 sel = 01;
 in = 1;#10;
 in = 0;#10;
 sel = 10;
 in = 1;#10;
 in = 0;#10;
 sel = 11;
 in = 1;#10;
 in = 0;#10;
 
 #50;
 $finish;
 
 end
 
 endmodule
