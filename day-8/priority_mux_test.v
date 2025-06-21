module priority_mux_test();
reg clk =0;
reg [3:0]in;

wire out;
 

priority_mux test(
 .in(in),
 .clk(clk),
 .out(out)
 
);

 always #5 clk = ~clk;
 initial begin
  
  in = 4'b0000; #10;
  in = 4'b0001;  #10;
  in = 4'b0010; #10;
  in = 4'b0011; #10;
  in = 4'b0100; #10;
  in = 4'b0101; #10;
  in = 4'b0110; #10;
  in = 4'b0111; #10;
  in = 4'b1000; #10;
  in = 4'b1001; #10;
  in = 4'b1010; #10;
  in = 4'b1011; #10;
  in = 4'b1100; #10;
  in = 4'b1101; #10;
  in = 4'b1110; #10;
  in = 4'b1111; #10; 
  $finish;
 
  end
endmodule



//test bench for multiple bits output for highest priority 
module priority_mux_test();
reg clk =0;
reg [3:0]in;

wire [3:0]out;
 

priority_mux test(
 .in(in),
 .clk(clk),
 .out(out)
 
);

 always #5 clk = ~clk;
 initial begin
  
  in = 4'b0000; #10;
  in = 4'b0001;  #10;
  in = 4'b0010; #10;
  in = 4'b0011; #10;
  in = 4'b0100; #10;
  in = 4'b0101; #10;
  in = 4'b0110; #10;
  in = 4'b0111; #10;
  in = 4'b1000; #10;
  in = 4'b1001; #10;
  in = 4'b1010; #10;
  in = 4'b1011; #10;
  in = 4'b1100; #10;
  in = 4'b1101; #10;
  in = 4'b1110; #10;
  in = 4'b1111; #10; 
  $finish;
 
  end
endmodule
