module comparator_test();
 

reg a,b;
wire g,l,e;


comparator test(
.a(a),
.b(b),
.g(g),
.l(l),
.e(e)
);

initial begin
    a = 1'b0; b = 1'b0; #10;
    a = 1'b0; b = 1'b1; #10;
    a = 1'b1; b = 1'b0; #10;
    a = 1'b1; b = 1'b1; #10;
    
    
    $finish;
end

endmodule




module comparator_test();
 
parameter n =2 ;
reg [n-1:0]a,b;
wire g,l,e;


comparator test(
.a(a),
.b(b),
.g(g),
.l(l),
.e(e)
);

initial begin
     a = 2'b00; b = 2'b00; #10;
    a = 2'b01; b = 2'b10; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b00; b = 2'b11; #10;
    a = 2'b11; b = 2'b00; #10;
    a = 2'b01; b = 2'b11; #10;
    a = 2'b10; b = 2'b01; #10;
    
    
    $finish;
end

endmodule

