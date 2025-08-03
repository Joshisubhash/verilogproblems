module rom_test();
 
 reg [3:0]addr;
 wire [3:0]out;
 
 integer i;
 rom test(.out(out),.addr(addr));
 
 
 initial begin
 for(i=0;i<15;i=i+1)begin
 addr = $random;
 #10;
 end
 $finish;
 end
 endmodule
