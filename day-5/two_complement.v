
module two_complement(
input wire [3:0]a,b,
output wire [4:0]val,
output wire signed_flag

);

wire [4:0]temp;

 
 assign temp = a + (~b);
 assign val = temp + 1;
 assign signed_flag =  val[4];


 endmodule
 
 
 
 module two_complement(
 input wire [3:0] a,b,
 
 input wire mode,
 output reg [4:0]s_val,
 output reg [4:0]u_val
 );
 reg [4:0] temp;
 
 
 
 always@(*)begin
 if(mode == 1)begin
  s_val = a + b;
 end
 else begin
   temp = a + (~b);
  u_val = temp + 1;
 end
  end
 endmodule
