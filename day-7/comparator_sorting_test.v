
module sorting_test();

wire [3:0]x,y,z,w;
 reg [3:0]a,b,c,d;


sorting test(

.a(a),
.b(b),
.c(c),
.d(d),
.x(x),
.y(y),
.z(z),
.w(w)
);


initial begin

   a = 4'b1011;
   b = 4'b0011; 
   c = 4'b0111; 
   d = 4'b0001;
  #10;
 
 

end

endmodule
