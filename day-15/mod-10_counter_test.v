module counter_test();

reg clk,rst;
wire [3:0]out;

counter test(
.out(out),
.clk(clk),
.rst(rst)

);

initial clk=0;
always #5 clk = ~clk;

initial begin
    $monitor("Time: %0t | Reset: %b | Output: %b", $time, rst, out);

    rst = 1; #10;   
    rst = 0;        
    #100;           
    $finish;
end

endmodule
