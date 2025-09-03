 module countoneandzeros_test();
   
   reg [31:0]in;
   reg clk,rst;
   
   wire out1,out0,equal;
    
   countoneanndzeros test(.out0(out0),.out1(out1),.equal(equal),.in(in),.clk(clk),.rst(rst));
   
   initial clk =0 ;
   always #5 clk = ~clk;
   
   initial begin
   in = 0;
          rst =1;
   #20;
   rst=0;
   
    in = 32'b00011010101100110101100110101010;   #100;   $display("time=%0t in=%b", $time, in); 
    in = 32'b00011010101100110101100110101011;   #100;   $display("time=%0t in=%b", $time, in); 
    in = 32'b11101010110011010110011010101111;   #100;   $display("time=%0t in=%b", $time, in); 
    in = 32'b11101010110011010110011010101010;  #100;   $display("time=%0t in=%b", $time, in); 
    $finish;
   
   end
   
   
   endmodule
