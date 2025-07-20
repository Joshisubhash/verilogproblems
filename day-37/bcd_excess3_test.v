  module adder_using_mux();
 
 reg  [3:0]bcd;
 wire [3:0]exe;
// wire  [3:0]excess3;
 
 
 
 
  bcd_excess3_using_mux test(.exe(exe),.bcd(bcd));
// bcd_to_excess3_mux test(.bcd(bcd),.excess3(excess3));
 
 initial begin
 
  bcd =  0000;#10;
  bcd =  0001;#10;
  bcd =  0010;#10;
  bcd =  0011;#10;
  bcd =  0100;#10;
  bcd =  0101;#10;
  bcd =  0110;#10;
  bcd =  0111;#10;
  
  bcd =  1000;#10;
  bcd =  1001;#10;
  bcd =  1010;#10;
  bcd =  1011;#10;
  bcd =  1100;#10;
  bcd =  1101;#10;
  bcd =  1110;#10;
  bcd =  1111;#10;
  $finish;
  
  
   
 end
 endmodule
