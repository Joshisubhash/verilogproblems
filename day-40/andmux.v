module and_gate_using_mux(out,sel,a);

input wire a;
input wire sel;
output wire out;

assign out = sel ? a : 0;

endmodule
