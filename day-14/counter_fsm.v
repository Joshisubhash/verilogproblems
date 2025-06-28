
module counter_fsm(out,rst,clk,start);
input wire clk,rst;
output reg [3:0]out;
input wire start;

reg [3:0]state;
 reg [3:0]count;
parameter idel=4'b0000,red=4'b0001,yellow=4'b0010,green=4'b0011;

parameter red_time = 4'd5 ,yellow_time = 4'd7 ,green_time = 4'd8;



always@(posedge clk)begin
if(rst || start)begin
count<=0;
state<=red;
end


 else begin

case(state)

     
 red :  begin
        out <= 4'b0001; 
        if(count == red_time) begin
        count<=0;
        state <= yellow;
        end 
       else begin
        count <= count + 1;
        end 
          
        end
 yellow : begin
          out <= 4'b0010;
         if(count == yellow_time)begin
         count<=0;
          state <= green;
          end
          else begin
            count <= count + 1;
            end
          end
 green : begin
         out<=4'b0011; 
         if(count == green_time)begin
         count<=0;
         state<=red;
         end
         else begin
        count <= count + 1;
        end
         end
         
 
endcase

end

end
endmodule

