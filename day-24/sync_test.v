module sync_test();

reg  clka,clkb,asynin,rst;
wire ff1,ff2, synout;


sync test(
.synout(synout),
.asynin(asynin),
.clka(clka),
.clkb(clkb),
.rst(rst),
.ff1(ff1),
.ff2(ff2)

);


initial clka=0;
initial clkb =0;


always #7 clka = ~clka;
always #13 clkb = ~clkb;


initial begin

rst = 1;
#10;
rst=0;
asynin = 1;



end


endmodule
