
module master_slave(q,qb,j,k,rst,clk);
input wire j,k;
input wire rst,clk;
output wire q;
output wire qb;

 

wire q1,qb1;
 

jk one(.q(q1),.qb(qb1),.j(j),.k(k),.rst(rst),.clk(clk));
jk two(.q(q),.qb(qb),.j(q1),.k(qb1),.rst(rst),.clk(~clk));
 
endmodule




module jk(q,qb,j,k,rst,clk);

input wire j,k;
input wire rst,clk;
output reg q;
output wire qb;

assign qb = ~q;

// jk
always@(posedge clk)begin
if(rst)begin
q<=0;
end else begin
case({j,k})
2'b00 : begin
        q <= q;
        end
2'b01 : begin 
        q <= 0;
        end
2'b10 : begin
        q <= 1;
        end
2'b11 : begin
        q <= qb;
        end
       endcase
end
end 

endmodule

