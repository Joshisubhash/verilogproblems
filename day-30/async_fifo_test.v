
module asyn_fifo_test();

 reg datain;
 reg w_en;
 reg w_clk;
  
 reg rst;
 
 reg r_en;
 reg r_clk;
 
  wire dataout;
  wire  full;
  wire  empty;
  
  asyn_fifo test(
  .datain(datain),
  .full(full),
  .empty(empty),
  .dataout(dataout),
  .w_en(w_en),
  .r_en(r_en),
  .w_clk(w_clk),
  .r_clk(r_clk),
  .rst(rst)
  
  );
  
  
  initial w_clk =0;
  initial r_clk=0;
  
  always #5 w_clk = ~w_clk;
  always #10 r_clk = ~r_clk;
  
  
  
  initial begin
//  rst = 1;#5;
  w_en =1;#5;
 r_en = 0;#5;
 rst =1;
 #20;
 
  rst = 0;#5;
  
  
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
  datain = 1'b0;#10;
  datain = 1'b1;#10;
   w_en=0;
   
  r_en=1;
  end
  
  
 endmodule
