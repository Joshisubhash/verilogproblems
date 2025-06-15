
module ripple_carry_adder_test;

reg [3:0]a,b;
reg cin;
wire [3:0]y;
wire cout;

ripple_carry_adder test(
 
 .y(y),
 .cout(cout),
 .a(a),
 .b(b),
 .cin(cin)
);
 
 initial begin
 
    a = 4'b0;b=4'b0;cin=4'b0;#10
    a = 4'b0;b=4'b0;cin=4'b1;#10
    a = 4'b0;b=4'b1;cin=4'b0;#10
    a = 4'b0;b=4'b1;cin=4'b1;#10            
    a = 4'b1;b=4'b0;cin=4'b0;#10
    a = 4'b1;b=4'b0;cin=4'b1;#10
    a = 4'b1;b=4'b1;cin=4'b0;#10
    a = 4'b1;b=4'b1;cin=4'b1;#10
    a=4'b1111;b=4'b1111;cin=4'b1111;#10
     $finish;
 
 
 end

endmodule
