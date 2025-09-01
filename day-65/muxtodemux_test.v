
   module mux_to_demux_test();
   
   reg [1:0]sel;
   reg a,b,c,d;
   wire  out1,out2,out3,out4;
   
  mux_to_demux test(.out1(out1),.out2(out2),.out3(out3),.out4(out4),.sel(sel),.a(a),.b(b),.c(c),.d(d));
   
   
   initial begin
   
//   a=1;b=0;c=1;d=0;#10;
   a=1;b=1;c=1;d=1;#10;
   sel = 2'b00;#10;
   sel = 2'b01;#10;
   sel = 2'b10;#10;
   sel = 2'b11;#10; 
   
    a=0;b=1;c=0;d=1;#10;
   sel = 2'b00;#10;
   sel = 2'b01;#10;
   sel = 2'b10;#10;
   sel = 2'b11;#10;  
   

   
      
     
   
   
 
  $finish;
   end
   endmodule
   
