module carry_look_ahead_adder_test();
reg [3:0] a,b;
reg cin;
wire cout;
wire [3:0] sum;

carry_look_ahead_adder testing(
  .sum(sum),
  .cout(cout),
  .a(a),
  .b(b),
  .cin(cin)
);

initial begin

        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        
        $finish;
end

endmodule
