 module n_bit_usr_test();
   parameter n=4;
   reg [n-1:0]in;
   reg [1:0]cntrl;
   reg rst,clk,a,b;
    wire [n-1:0]out;
   
   n_bit_usr  #(n) test (.in(in),.cntrl(cntrl),.rst(rst),.clk(clk),.a(a),.b(b),.out(out));
   
   initial clk=0;
   always #5 clk = ~clk;
   
   
   
   initial begin
     a = 1'b1;
       b = 1'b1;
   rst = 1;#20;
   rst = 0;
   cntrl = 2'b00;
    in = 'd2;
   #100;
   cntrl = 2'b01;#10;
 
   #100;
      cntrl = 2'b10;#10;
   
   #100;
   
    cntrl = 2'b11;#10;
    
   
   end
   endmodule
