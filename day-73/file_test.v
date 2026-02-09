
//**Design Spec:**

//* Inputs: `clk, rst`
//* Output: `count[3:0]` (counts 0→9 then wraps).

//**Testbench Requirements:**

//* Verify sequence: 0 → 1 → … → 9 → 0.
//* Test reset in middle of count.
//* Run for at least 30 cycles.

module mod10_counter_tbfunction();

reg rst,clk;
wire [3:0]out;

reg [3:0]count;

mod_10counter_tbfunction test(.out(out),.rst(rst),.clk(clk));

initial clk=0;
always #5 clk = ~clk;

//always@(posedge clk)begin
//if(rst)begin
//count <= 0;
//end
//else if(count == 9)begin
//count <= 0;
//end
// else begin
//count <= count + 1'b1;
//end
//end

always@(posedge clk)begin
if(rst)begin
count <= 0;
end else begin
count <= (count == 9)? 0 : count + 1'b1;
end
end




initial begin
//count =0;

rst = 1;
#20;
rst = 0;
#100;

 rst = 1;
repeat (2)@(posedge clk) ;
 rst = 0;
repeat(5)@(posedge clk) ;
 rst = 1;
repeat(5)@(posedge clk) ;
 rst =0;
repeat(20)@(posedge clk) ;

// if we uncomment thsi below code snipeet then we will get correcgt output
// #1   rst = 1;
// repeat (2)@(posedge clk) ;
// #1 rst = 0;
// repeat(5)@(posedge clk) ;
// #1 rst = 1;
// repeat(5)@(posedge clk) ;
// #1 rst =0;
// repeat(20)@(posedge clk) ;


end

always@(posedge clk)begin
#1;
if(out != count)begin
$display("%d | %d",out,count);
end
end 
endmodule
