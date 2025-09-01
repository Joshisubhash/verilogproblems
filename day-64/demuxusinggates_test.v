

   module demux_using_gates_test();
   
   reg [1:0]sel;
   reg din;
   wire a,b,c,d;
   
   demux_using_gates test(.sel(sel),.din(din),.a(a),.b(b),.c(c),.d(d));
   
   
   initial begin
   sel = 2'b00;din=1;#10;
     sel = 2'b00;din=0;#10;
   
   sel = 2'b01;din=1;#10;
    sel = 2'b01;din=0;#10;
   
   
   sel = 2'b10;din=1;#10;
   sel = 2'b10;din=0;#10;
   
   sel = 2'b11;din=1;#10
      sel = 2'b11;din=0;#10;
 
  $finish; 
   end 
   endmodule
