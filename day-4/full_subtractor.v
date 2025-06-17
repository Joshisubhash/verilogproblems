

module full_subtractor(
input wire a,b,c,
output wire diff,borrow

);


assign diff =  a^b^c;
assign borrow = ~a&b | b&c | c&~a;

endmodule

