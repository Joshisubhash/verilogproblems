module adder_using_mux();
 
 reg a,b,cin;
 wire sum,cout;
 
 full_adder_using_mux test(
 .a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)
 );
 
 
 
 initial begin
 repeat(20) begin
 {a,b,cin} = $random;#10;
     $display("a=%b b=%b cin=%b", a, b, cin);
 end
 $finish;
 end
 endmodule
