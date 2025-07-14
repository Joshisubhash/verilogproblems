 module jk_flipflops(q,qb,j,k,rst,clk);
 input wire j,k;
 input wire rst,clk;
 output reg q ,qb;
 reg [1:0]state;
 
 always@(posedge clk)begin

 if(rst)begin
 q <= 0;
 qb <= 0;
 end else begin
 case({j,k})
 2'b00 : begin
         q <= q;
         qb <= ~q;
         end
 2'b01 :  begin
         q <= 0;
         qb<=1;
         end
         
  2'b10 : begin
         q <= 1;
         qb <= 0;
         end
 2'b11 : begin
         q <= ~q;
         qb <= q;
         end       
         
 endcase
 end
 end
 endmodule
 
 
 module sr_flipflops(q,qb,s,r,rst,clk);
 input wire rst,clk;
 input wire s,r;
 output reg q,qb;
 
 always@(posedge clk)begin
 if(rst)begin
 q <= 0;
 qb <= 0;
 end else begin
 case({s,r})
 2'b00 : begin
         q <= q;
         qb <= ~q;
         end
 2'b01 : begin
         q <= 0;
         qb <= 1;
         end
 2'b10 : begin
         q <= 1;
         qb <= 0;
         end
 2'b11 : begin
         q <= 1'bx;
         qb <= 1'bx;
         end
      endcase
  end    
 end
 endmodule
 
 
 //t ff is jk_ff with bith j and k joined
 module t_flipflops(q,qb,t,rst,clk);
 input wire t;
 input wire rst,clk;
 output reg q;
 output wire qb;
 
 assign qb = ~q;
 always@(posedge clk)begin
 if(rst)begin
 q<=0;
  
 end else begin
 if(t)begin
 q <= ~q;
 end else begin
 q <= q;
 end
 end
 end
 endmodule
