
module sorting(
 input [3:0]a,b,c,d,
 output [3:0]x,y,z,w
);

wire [3:0]ab0,ab1,ac1,ac0;
wire [3:0]bc0,bc1,bc2,bc3;
wire [3:0]mid1,mid2;

 sorting_comparator one(a,b,ab0,ab1); 
 sorting_comparator two(c,d,ac0,ac1);
 
 sorting_comparator three(ab0,ac0,bc0,bc1);
 sorting_comparator four(ab1,ac1,bc2,bc3);
 
 sorting_comparator five(bc1,bc2,mid1,mid2);
 
 assign x = bc0;
 assign y = mid1;
 assign z = mid2;
 assign w = bc3;
 
endmodule


module sorting_comparator(
input [3:0]a,b, 
output [3:0]x,y 
);


assign {x,y} = {a>b} ? {a,b} : {b,a};

endmodule

// for descending order
/*
module sorting_comparator(
input [3:0]a,b, 
output [3:0]x,y 
);


assign {x,y} = {a<b} ? {a,b} : {b,a};

endmodule*/
