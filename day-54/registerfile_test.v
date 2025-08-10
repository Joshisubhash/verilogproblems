
  module register_file_test();
  
  reg clk,rst;
  wire [15:0]readdata1;
  wire [15:0]readdata2;
wire [15:0]writedata;
  
  reg w_en;
   
  reg [3:0]readaddr1;
  reg [3:0]readaddr2;
   
  reg [3:0]writeaddr;

 register_file test(.readdata1(readdata1),.readdata2(readdata2),.writedata(writedata),.w_en(w_en),.readaddr1(readaddr1),.readaddr2(readaddr2),.writeaddr(writeaddr),.clk(clk),.rst(rst));
 
 initial clk =0;
 always #5 clk = ~clk;
 
 initial begin
 rst = 1;
 
 #30;
 rst = 0;

 
  readaddr1 = 4'b0011;
 readaddr2 = 4'b0100;
  writeaddr = 4'b0101;
 
 w_en = 1; 
 #70;
 w_en=0;//without this its functionality fails
   readaddr1 = 4'b0101;
 end 
endmodule
