module up_down_counter_test();

reg clk,rst,cntrl;
wire [3:0]count;


up_down_counter test(
 .clk(clk),
 .rst(rst),
 .cntrl(cntrl),
 .count(count)
);

initial clk=0; 
always #5 clk = ~clk;

initial begin

rst=1;#10;
rst=0;
cntrl=1;#160;
rst=1;#10;
rst=0;
cntrl=0;#160;
$finish;

end
endmodule

