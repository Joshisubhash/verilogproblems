
 module usr_test();
 
 reg clk,rst;
reg [3:0]in;
reg shift_l,shift_r;
reg [1:0]sel;
wire [3:0]out;

usr test(
.out(out),
.in(in),
.rst(rst),
.clk(clk),
.shift_l(shift_l),
.shift_r(shift_r),
.sel(sel)

);

initial clk=0;
initial rst=0;

always #5 clk = ~clk;

initial begin
 shift_l = 0;
 #10;
 in = 4'b1011;
 #10;
  shift_r = 1;
  #10;
  
 sel = 2'b11;
#20;
 sel = 2'b10;
 #20;
 sel = 2'b01;
 #20;
 sel =2'b00;
 #20;
 
 $finish;


end
endmodule


