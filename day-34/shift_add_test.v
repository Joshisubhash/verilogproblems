 module shift_add_test();
 
 reg [7:0]a;
 reg [3:0]b;
 reg clk,rst;
 wire [7:0]out;
 
 
 
 shift_add test(
 .out(out),
 .a(a),
 .b(b),
 .clk(clk),
 .rst(rst)
 
 );
 initial clk=0;
 always #5 clk = ~clk;
 
 initial begin
 
 
 
 
   a = 8'b00000011;   
   b = 4'b0101;     
   rst = 1;
   #20;
   rst = 0;
   #100;
   $display("Test 1: %d × %d = %d", a, b, out);
   
 
   a = 8'b00000101;   
   b = 4'b0011;     
   rst = 1;
   #20;
   rst = 0;
   #100;
   $display("Test 2: %d × %d = %d", a, b, out);
   
 
   a = 8'b00000111;  
   b = 4'b0100;       
   rst = 1;
   #20;
   rst = 0;
   #100;
   $display("Test 3: %d × %d = %d", a, b, out);
   
   $finish;
   

 
 
 end
 
 endmodule
