
module instruction_decoder_test();
 
   reg [2:0]in;
   reg rst,clk;
   
  wire [2:0]out;
  wire wen_reg;
  wire ren_mem;
  
  initial clk=0;
  always #5 clk=~clk;
  
  instruction_decoder test(.out(out),.rst(rst),.clk(clk),.in(in),.wen_reg(wen_reg),.ren_mem(ren_mem));
  
  initial begin
  rst = 1;
  #30;
  rst=0;
  #10;
  in = 3'b001;#9;
  in = 3'b010;#9;
  in = 3'b011;#9;
  in = 3'b100;#9;
  in = 3'b101;#9;
 
  
//  input in at the exact same time as a rising clock edge (e.g., #30; rst=0; in = 3'b001;). 
//  This can create a race condition where it's uncertain if the old or new value of in will be captured.
//  in = 3'b001;#10;
//  in = 3'b010;#10;
//  in = 3'b011;#10;
//  in = 3'b100;#10;
//  in = 3'b101;#10;
  
  end
  
  
  endmodule
