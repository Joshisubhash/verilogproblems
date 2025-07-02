
module mealy_model_test();

reg clk,rst,in;
wire out;
 
mealy_model_nonoverlapping test(
.clk(clk),
.rst(rst),
.in(in),
.out(out)

);

//for overlapping
//  mealy_overlapping test(
// .clk(clk),
// .rst(rst),
// .in(in),
// .out(out)

// );

initial clk=0;
always #5 clk = ~clk;

always @(posedge clk) begin
    $display("Time: %0t, in: %b, out: %b", $time, in, out);
end

initial begin
rst=1;#10;
rst=0;
in=1;#10;
in=1;#10;
in=0;#10;
in=1;#10;

in=1;#10;
in=1;#10;
in=0;#10;
in=1;#10;

in=1;#10;
in=1;#10;
in=1;#10;
in=1;#10;
$finish;


end
endmodule
