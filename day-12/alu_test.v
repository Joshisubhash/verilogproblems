
module alu_test();

reg [3:0]a,b;
reg [2:0]opcode;
wire [3:0]out;


alu test (
.a(a),
.b(b),
.opcode(opcode),
.out(out)
);

initial begin

a = 4'b1010;
b = 4'b0101;#10;

opcode = 3'b000;#10;
opcode = 3'b001;#10;
opcode = 3'b010;#10;
opcode = 3'b011;#10;
opcode = 3'b100;#10;
opcode = 3'b101;#10;
opcode = 3'b110;#10;
opcode = 3'b111;#10;
$finish;

end

endmodule
