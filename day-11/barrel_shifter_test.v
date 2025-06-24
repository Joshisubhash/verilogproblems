
module barrel_shifter_test();

wire [3:0]out;
reg [1:0]sel;
reg a,b,c,d;
reg clk=0;


barrel_shifter test(
.out(out),
.sel(sel),
.a(a),
.b(b),
.c(c),
.d(d),
.clk(clk)

);

always #2.5 clk = ~clk;

initial begin

 sel = 2'b00;#10;
 a = 1'b1;#10;
 b = 1'b0;#10;
 c = 1'b0;#10;
 d = 1'b0;#10;

 sel = 2'b01;#10;
 a = 1'b1;#10;
 b = 1'b0;#10;
 c = 1'b0;#10;
 d = 1'b0;#10;
 
 sel = 2'b10;#10;
 a = 1'b1;#10;
 b = 1'b0;#10;
 c = 1'b0;#10;
 d = 1'b0;#10;
 
 sel = 2'b11;#10;
 a = 1'b1;#10;
 b = 1'b0;#10;
 c = 1'b0;#10;
 d = 1'b0;#10;
$finish;

end

endmodule

