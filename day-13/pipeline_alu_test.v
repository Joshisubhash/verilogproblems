
module pipe_line_test ();

reg [3:0]a,b;
reg [2:0] opcode;
reg clk;
reg rst;
wire [3:0]out;


 pipe_alu test(
 .a(a),
 .b(b),
 .opcode(opcode),
 .clk(clk),
 .rst(rst),
 .out(out)
 
 );

initial clk=0;
 
always #1 clk=~clk;


initial begin
  
  
 rst=0;
 a = 4'b1010;b=4'b0101;opcode=3'b000; #10;
 a=4'b1000;b=4'b1001;opcode=3'b101;   #10;
 a=4'b0110;b=4'b0111;opcode=3'b010;   #10;
 a=4'b0100;b=4'b1011;opcode=3'b100;   #10;
 a=4'b1010;b=4'b1000;opcode=3'b111;   #10;
  $finish;


end
endmodule

