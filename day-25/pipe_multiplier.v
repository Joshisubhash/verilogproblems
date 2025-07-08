module pipe_multiplier(out,c,a,b,clk,rst);

input wire [3:0]a,b;
output reg [3:0]out;
input wire clk,rst;
output reg c;
 

reg [3:0]reg_a,reg_b;
//reg [3:0]execute;
//reg [3:0]co;
//parameter opcode = 1'b0;
//reg [1:0]state;
reg [3:0]state2_a,state2_b;

reg [7:0]stage3_out;

reg [7:0]stage4_out;
//fetch
always@(posedge clk)begin
if(rst)begin
reg_a<=0;
reg_b<=0;
out<=0;
c<=0;
end else begin
reg_a <= a;
reg_b<=b;
end 
end

//decode it worked but not proper 
//always@(posedge clk)begin
//if(rst)begin
//execute <= 0;
//co <=0;
//state<=0;
//end 
//else begin

//case(state) 
//opcode : {co ,execute } <= reg_a * reg_b;
//default execute <= 0;

//endcase
//end
//end

//decode
always@(posedge clk)begin
if(rst)begin
state2_a <= 0;
state2_b <= 0;
end
else begin
state2_a <= reg_a;
state2_b <=reg_b;
end
end

//execute
always@(posedge clk)begin
if(rst)begin
stage3_out <= 0;
end
else begin
stage3_out <= state2_a * state2_b;
end
end


//write back
always@(posedge clk)begin
if(rst)begin
stage4_out <=0;
out<=0;
c<=0;
end
else begin
stage4_out <= stage3_out;
out <= stage4_out[3:0];
c <= stage4_out[7:4];
 
 
end
end


endmodule

