
module pipe_multiplier_test();

reg clk,rst;
reg [3:0]a,b;

wire [3:0]out;
wire c;

pipe_multiplier test(
.clk(clk),
.rst(rst),
.a(a),
.b(b),
.c(c),
.out(out)

);

initial clk=0;
always #5 clk = ~clk;

always@(posedge clk)begin

$display("%b | %b | %b | %b",a,b,out,c);
end


initial begin

rst = 1;
#10;
rst=0;
a = 4'b0101;b=4'b0010;#10;
a = 4'b0100;b=4'b0011;#10;
a = 4'b0110;b=4'b0001;#10;
a = 4'b0011;b=4'b1010;#10;

#50;
$finish;






end
endmodule


 
