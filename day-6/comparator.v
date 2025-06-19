 module comparator(a,b,g,l,e);
 
 
 input wire a,b;
 output reg g,l,e;
 
 always@(*)begin
 
 g = a&~b;
 l = ~a&b;
 e = a~^b;
 
 end
 endmodule


 
 
module comparator(a,b,g,l,e);
parameter n = 2;

input wire [n-1:0]a,b;
output reg g,l,e;


always @(*) begin

g = (a > b);
l = (a < b);
e = (a==b);

 
 end
 
 endmodule
