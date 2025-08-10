

module register_file(readdata1,readdata2,writedata,w_en,readaddr1,readaddr2,writeaddr,clk,rst);

input wire clk,rst;
output wire [15:0]readdata1;
output wire [15:0]readdata2;

output reg [15:0]writedata;
input wire w_en;

input wire [3:0]readaddr1;
input wire [3:0]readaddr2;

input wire [3:0]writeaddr;

reg [15:0]mem[15:0];
integer i;

assign readdata1 = mem[readaddr1];
assign readdata2 = mem[readaddr2];

always@(posedge clk)begin
if(rst)begin
writedata <= 0;
for(i=0;i<16;i=i+1)begin
mem[i] <= i;
end
end else begin
if(w_en)begin

mem[writeaddr] <= readdata1 + readdata2;
writedata <= readdata1 + readdata2;
end
end
  
end
endmodule
