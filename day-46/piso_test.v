
module piso_test();

reg a,b,c,d,e,f,g,h,load;
reg rst,clk;
wire out;

initial clk=0;
always #5 clk = ~clk;

piso test(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.rst(rst),.clk(clk),.load(load),.out(out));

initial begin


a = 1;
b = 0;
c = 1;
d = 0;
e = 1;
f = 0;
g = 1;
h = 0;
rst = 1;
#20;
rst = 0;
load = 1;
#100;
load = 0;


end
endmodule
