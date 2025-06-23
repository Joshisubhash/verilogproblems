
module decoder_test();
reg [1:0] in;
wire [3:0] out;
decoder test (.in(in) , .out(out));
 initial begin 
 
 in = 2'b00;#10;
 $display("%b %b ",in,out);
 in = 2'b01;#10;
 $display("%b %b ",in,out);
 in = 2'b10;#10;
 $display("%b %b ",in,out);
 in = 2'b11;#10;
 $display("%b %b ",in,out);
 $finish;
 
 end
endmodule

//for 4:16 decoder using 2:4 decoder
module decoder_test();
reg [3:0] in;
wire [15:0] out;
reg e;

main test (.out(out),.in(in),.e(e) );
 
 initial begin 
 e = 1;
 
  in = 4'b0000; #10;
   $display("%b %b ",in,out);
  in = 4'b0001;  #10;
   $display("%b %b ",in,out);
  in = 4'b0010; #10;
   $display("%b %b ",in,out);
  in = 4'b0011; #10;
   $display("%b %b ",in,out);
  in = 4'b0100; #10;
   $display("%b %b ",in,out);
  in = 4'b0101; #10;
   $display("%b %b ",in,out);
  in = 4'b0110; #10;
   $display("%b %b ",in,out);
  in = 4'b0111; #10;
   $display("%b %b ",in,out);
  in = 4'b1000; #10;
   $display("%b %b ",in,out);
  in = 4'b1001; #10;
   $display("%b %b ",in,out);
  in = 4'b1010; #10;
   $display("%b %b ",in,out);
  in = 4'b1011; #10;
   $display("%b %b ",in,out);
  in = 4'b1100; #10;
   $display("%b %b ",in,out);
  in = 4'b1101; #10;
   $display("%b %b ",in,out);
  in = 4'b1110; #10;
   $display("%b %b ",in,out);
  in = 4'b1111; #10; 
   $display("%b %b ",in,out);
 
 
 
 
  e = 0;
 in = 2'b00;#10;
 $display("%b %b ",in,out);
 in = 2'b01;#10;
 $display("%b %b ",in,out);
 in = 2'b10;#10;
 $display("%b %b ",in,out);
 in = 2'b11;#10;
 $display("%b %b ",in,out);
 $finish;
 
 end


endmodule

