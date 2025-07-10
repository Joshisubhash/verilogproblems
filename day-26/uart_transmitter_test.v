
module uart_transmitter_test();

reg start;
reg clk,rst;
reg [7:0]data;

wire out;
 

uart_transmitter test(
.start(start), 
.clk(clk),
.rst(rst),
.data(data),
.out(out) 
 
 
 );

initial clk = 0;
always #1 clk = ~clk;

//initial begin
//start=1;
//rst = 1;
//#10;
//rst=0;
//#5;

//start = 0;#5;
//data = 8'b10101010;#20;
//(here start should be 1 again or else it is show x because after start #5 there is nothing that drives the start so start becomes x)
//start =1;
////stop = 1;

////$finish;



//end


initial begin
    rst = 1;
    start = 1;
    data = 8'b10101010;
    #10 rst = 0;
    #20 start = 0;
    #2  start = 1; // hold start low for just one cycle
    #10000; // wait for output to complete
    $finish;
end




endmodule

