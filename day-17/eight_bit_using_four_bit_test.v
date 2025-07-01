
module eight_using_four_test();

reg [7:0]a,b;
reg cin;
reg clk;
reg rst;
reg start;

wire [7:0]sum;
wire co;


eight_using_four test (
.a(a),
.b(b),
.cin(cin),
.clk(clk),
.rst(rst),
.start(start),
.sum(sum),
.co(co)

);




initial clk=0;
always #5 clk =~clk;

 

initial begin
    clk = 0;
    rst = 1; #10;
    rst = 0; start = 1;
    a = 8'b00110011; b = 8'b00001111; cin = 0;
    #100;
    $display("SUM = %b, CO = %b", sum, co);
     a = 8'b00110011; b = 8'b00001111; cin = 1;
    #100;
    $display("SUM = %b, CO = %b", sum, co);
    
    $finish;
end

endmodule
