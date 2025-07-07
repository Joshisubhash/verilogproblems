

module johnson_counter_test();

reg clk,rst,d;
wire [3:0]q;


johnson_counter test(
.clk(clk),
.rst(rst),
.q(q),
.d(d)

);

initial clk=0;
always #5 clk = ~clk;

initial begin
d=1;
rst = 1;#10;
rst=0;#10;

end
endmodule

