
module or_gate_using_decoder(out,a,b);

input wire a,b;
output reg [3:0]out;

always@(*)begin
case({a,b})
2'b00 : out <= 0;
2'b01 : out <= 1;
2'b10 : out <= 2;
2'b11 : out <= 3;
endcase

end
endmodule
