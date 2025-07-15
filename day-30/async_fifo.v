
module asyn_fifo(dataout,full,empty,datain,w_en,r_en,w_clk,r_clk,rst);
 
input wire datain;
input wire w_en;
input wire w_clk;

input wire rst;

input wire r_en;
input wire r_clk;

output reg dataout;
output wire full;
output wire empty;

reg [4:0]w_ptr_bin;
reg [4:0]r_ptr_bin;
     
reg [4:0]w_ptr_grey;
reg [4:0]r_ptr_grey;


reg mem[0:15];


 reg [4:0]w_reg1;
 reg [4:0]w_reg2;
      
 reg [4:0]r_reg1;
 reg [4:0]r_reg2;
 

always@(posedge w_clk)begin
if(rst)begin
w_ptr_bin<=0;  
w_ptr_grey<=0; 

dataout <= 0;
 
end else begin
if(w_en && !full)begin
mem[w_ptr_bin[3:0]] <= datain;
w_ptr_bin <= w_ptr_bin + 1'b1;
//w_ptr_grey <= {w_ptr_bin[3],w_ptr_bin[3]^w_ptr_bin[2],w_ptr_bin[2]^w_ptr_bin[1],w_ptr_bin[1]^w_ptr_bin[0]};
//(here we are using w_ptr_bin + 1 because to update next value of binary counter not the old one)
w_ptr_grey <= (w_ptr_bin + 1'b1 )  ^ ((w_ptr_bin + 1) >> 1);
 
end 
 
 
end
end

always@(posedge r_clk)begin
if(rst)begin
dataout<=0; 
r_ptr_bin <=0;  
r_ptr_grey <= 0; 
end else begin
if(r_en && !empty)begin
dataout <= mem[r_ptr_bin[3:0]];
r_ptr_bin <= r_ptr_bin + 1'b1;
r_ptr_grey <= (r_ptr_bin + 1'b1 )  ^ ((r_ptr_bin + 1) >> 1);
 
end
 
end

end


//syncronizer
always@(posedge r_clk)begin
if(rst)begin
w_reg1 <= 0;
w_reg2 <= 0;
end else begin
w_reg1 <= w_ptr_grey;
w_reg2 <= w_reg1;

end
end

always@(posedge w_clk)begin
if(rst)begin
r_reg1 <= 0;
r_reg2 <= 0;
end else begin
r_reg1 <= r_ptr_grey;
r_reg2 <= r_reg1;

end
end

 
always @(posedge w_clk or posedge r_clk) begin
  $display("W: bin=%b gray=%b | R: bin=%b gray=%b | FULL=%b EMPTY=%b", 
           w_ptr_bin, w_ptr_grey, r_ptr_bin, r_ptr_grey, full, empty);
end

 
assign full = (w_ptr_grey == {~r_reg2[4:3] , r_reg2[2:0]});
assign empty = (r_ptr_grey == w_reg2);
endmodule

