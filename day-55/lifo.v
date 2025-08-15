module lifo(out,full,empty,datain,r_en,w_en,clk,rst,push,pop);
input wire push,pop;
input wire [7:0]datain;
input wire w_en,r_en;
input rst,clk;
output reg [7:0]out;
output reg full;
output reg empty;
parameter width = 8,depth=15;

reg [width:0]mem[0:depth];
reg [3:0]sptr;


always @(*)begin
    empty <= (sptr == 0);
        full  <= (sptr == depth);
end

always@(posedge clk)begin
if(rst)begin
sptr <= 0;
out <=0;
full <= 0;
empty <= 1;
end else begin
case({push,pop}) 

 2'b10 :   begin
           if(w_en && !full)begin
            mem[sptr] <= datain;
            sptr <= sptr + 1'b1;
            end
            end
  2'b01 :   begin
           if(r_en && !empty)begin
            out <= mem[sptr - 1] ;
           sptr <= sptr - 1'b1;
            $display("%b | %b",out,sptr);
            end else begin
            out <= 8'b0;
            end
            end

endcase
 
end 
end
endmodule
