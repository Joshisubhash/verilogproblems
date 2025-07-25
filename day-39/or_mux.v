module or_gate_using_mux(out,sel,b);


input wire b;
input wire sel;
output reg out;

 

always@(*)begin
case(sel)
0 : out <= b;
1 : out <= 1; 
endcase
end
endmodule

