//test bench for binary to grey
module b2g_test();

reg clk,rst; 
wire [3:0]grey;

b2g test(
.clk(clk),
  .rst(rst), 
.grey(grey)

);

initial clk=0;
always #5 clk= ~clk;

initial begin

rst = 1;#5;
rst=0;

end


endmodule


//test bench for real time grey to binary converter
module g2b_test();

reg clk,rst; 
wire [3:0]grey_out;

g2b test(
.clk(clk),
  .rst(rst), 
.grey_out(grey_out)

);

initial clk=0;
always #5 clk= ~clk;

initial begin

rst = 1;#5;
rst=0;

end
endmodule

