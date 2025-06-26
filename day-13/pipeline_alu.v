module pipe_alu(out,a,b,opcode,clk,rst);
input wire [3:0]a,b;
input wire [2:0]opcode;
input rst;
input clk;
output reg [3:0]out;

reg [3:0]a_reg , b_reg;
reg [2:0]opcode_reg;


reg [3:0]execute_reg;

reg [3:0]out_reg;

always@(posedge clk)begin
 if(rst)begin
 a_reg <= 0;
 b_reg <= 0;
 opcode_reg <= 0;
 end else 
 begin
 a_reg <= a;
 b_reg <= b;
 opcode_reg <= opcode;
 
 end

end


always@(posedge clk)begin
if(rst)begin
 
 opcode_reg <= 0;
 end
 else begin
 case(opcode_reg)
 3'b000 : execute_reg <=  a_reg + b_reg;
 3'b001 : execute_reg <= a_reg - b_reg ;
 3'b010 : execute_reg <= a_reg & b_reg;
 3'b011 : execute_reg <= a_reg;
 3'b100 : execute_reg <= a_reg^b_reg;
 3'b101 : execute_reg <= ~a_reg;
 3'b110 : execute_reg<= a_reg << 1;
 3'b111 : execute_reg <= a_reg >> 1;
 default : execute_reg  <= 4'b0000;
 endcase
 out_reg <= execute_reg;
 end
 
end


always@(posedge clk)begin
if(rst)begin
 
 opcode_reg <= 0;
 end
 else begin
out <= out_reg;
end
end


endmodule
