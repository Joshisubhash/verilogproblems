
module uart_transmitter(out,clk,rst,data,start);
 input wire clk,rst;
 input wire [7:0]data;
 input wire start;
 output reg out;
  
 reg [9:0]d_out;
 reg [3:0]state;
 reg [3:0]i;
 reg busy;
 
 
 reg tick;
 reg [12:0]baud_count;
 parameter baud_rate = 5208;
 
  
  
always@(posedge clk)begin

$display("T=%t | state=%d | tx_busy=%b | tick=%b | out=%b | i=%0d | d_out=%b", 
         $time, state, busy, tick, out, i, d_out);


if(rst)begin
out<=1;
state <= 0;
d_out <= 0;
i <= 0;
busy <= 0;
tick <= 0;
baud_count <= 0;
end 

else begin

if(baud_count == baud_rate)begin
tick <= 1;
baud_count <= 0;
end
else begin
tick <= 0;
baud_count <= baud_count + 1'b1;
end

case(state)
0 : begin
    if(busy == 0 && start == 0)begin
    d_out <= {1'b1 , data , start};
    busy =1;
    state <= 1;
    end
    end
1 : begin
    if(tick)begin
    out <= d_out[i];
    i <= i + 1'b1;
    if(i == 9)begin
     state <= 2;  
     
     end
     end
     
     end
     
2 : begin
    if(tick)begin
    out<=1;
    state <= 0;
    busy <= 0;
    end
    end
    
    endcase

end

end

endmodule
  
