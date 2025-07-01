
module eight_using_four(sum,co,a,b,cin,clk,rst,start);

input wire [7:0]a,b;
input wire cin;
input clk;
input rst;
input wire start;
output reg [7:0]sum;
output reg co;

reg [3:0]a_reg,b_reg;
reg [3:0]sum_l,sum_u;
 
reg [3:0]state;
wire[3:0] sum_wire;
reg c_in;
wire c_out;

four_adder one(
.a(a_reg),
.b(b_reg),
.cin(c_in),
.sum(sum_wire),
.co(c_out)


);


parameter idel = 4'b0000, lower = 4'b0001 , upper = 4'b0010 , done = 4'b0011;


always@(posedge clk)begin
if(rst)begin
sum <= 0;
co <= 0;
state<=idel;
end
else begin
case(state)
idel : begin
       if(start)begin
       a_reg <= a[3:0];
       b_reg <= b[3:0];
       c_in <= cin;
       sum <= 0;
       co <= 0;
       state <= lower;
       end
       end
lower : begin
        sum_l <= sum_wire;
        c_in <= c_out;
        a_reg <= a[7:4];
        b_reg <= b[7:4];
        state <= upper;
        end
 upper : begin
         sum_u <= sum_wire;
         co <= c_out;
         state <= done;
         end
 done :  begin
         sum <= {sum_u , sum_l};  
         state <= idel; 
         end
        

  endcase

end
end
endmodule

module four_adder (
    input wire [3:0] a, b,
    input wire cin,
    output wire [3:0] sum,
    output wire co
);
    assign {co, sum} = a + b + cin;
endmodule

