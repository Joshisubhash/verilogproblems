module bcd_adder_test();

reg [3:0]a,b;
reg cin;
wire [3:0]out;
wire cout;



bcd_adder test(
.a(a),
.b(b),
.cin(cin),
.cout(cout),
.out(out)

);


initial begin



 a = 3;
b=4;
cin=0;
#20;

a=9;
b=9;
cin=0;
#20;

 a=15;
 b=15;
 cin=1;
 #20;

 a=5;
 b=5;
 cin=0;
 #20;

 a=15;
 b=15;
 cin=0;
 #20;
#30;
$finish;

end
 
endmodule
