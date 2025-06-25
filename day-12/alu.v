
module alu(out ,opcode,a,b);
 
 input wire [3:0]a,b;
 input wire [2:0]opcode;
 output reg [3:0]out;
 
 always@(*)begin
 case(opcode)
 3'b000 : out <=  a + b;
 3'b001 : out <= a -b;
 3'b010 : out <= a&b;
 3'b011 : out <= a;
 3'b100 : out <= a^b;
 3'b101 : out <= ~a;
 3'b110 : out<= a << 1;
 3'b111 : out <= a >> 1;
 
 endcase
 
 end
 endmodule

