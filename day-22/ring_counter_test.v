
//structral model
module ring_counter_test();

reg clk,rst=0;
wire [3:0]q;

ring_counter test(
.clk(clk),
.rst(rst),
.q(q)

);


initial clk=0;
always #5 clk = ~clk;

initial begin

rst = 1;#10;
rst = 0;#10;
end


endmodule


//BEHAVIORAL MODEL
module ring_counter_test();

reg clk,rst=0,d;
wire [3:0]q;

ring_counter test(
.clk(clk),
.rst(rst),
.d(d),
.q(q)

);


initial clk=0;
always #5 clk = ~clk;

initial begin
d=1;
rst = 1;#10;
rst = 0;#10;


end


endmodule

