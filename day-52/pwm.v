module pwm(out,reg_value,clk,rst);

input wire clk,rst;
input wire [3:0]reg_value;

output reg out;

reg [3:0]count=0;

always@(posedge clk)begin
if(rst)begin
count <= 1'b0;
out <= 1'b0;
end else begin


//count <= count + 1'b1;
//if(count < reg_value)begin
//out <= 1'b1; 
//$display("%b | %b",count,out);
//end else if(count == 4'd15)begin
//$display("%b | %b",count,out);
//count <= 1'b0;
//out <= 1'b0;
//end  else begin
//out <= 1'b0; 
//$display("%b",count); 
//end
//here - code is good but 
//In a clocked always block, a register like count can only be assigned one value per clock edge. 
//Your code attempts to assign it two different values under certain conditions.

//When count is 15, both assignments are active on the same clock edge. The simulator sees two different 
//instructions for what count should become next. This is a multiple driver error and is invalid Verilog 
//for hardware synthesis. While a simulator might resolve it by taking the last command it reads 
//(resetting count to 0), you cannot rely on this behavior.

 
 
 if(count < reg_value)begin
out <= 1'b1; 
$display("%b | %b",count,out);
end  else begin
out <= 1'b0; 
$display("%b",count);
end

if(count == 4'd15)begin
$display("%b | %b",count,out);
count <= 1'b0;
out <= 1'b0;
end  else begin
count <= count + 1'b1;
end

end
end
endmodule
