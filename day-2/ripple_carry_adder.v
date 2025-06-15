
module ripple_carry_adder(

output [3:0]y,
output cout,

input wire [3:0]a,b,
input wire cin
);

wire c1,c2,c3;

full_add one(y[0],c1,a[0],b[0],cin);
full_add two(y[1],c2,a[1],b[1],c1);
full_add three(y[2],c3,a[2],b[2],c2);
full_add four (y[3],cout,a[3],b[3],c3);

endmodule



module full_add(y,cout,a,b,cin);
input wire a,b,cin;
output y,cout;
 assign y = a ^ b ^ cin;
 assign cout = a&b | b&cin | cin&a;

 
endmodule
