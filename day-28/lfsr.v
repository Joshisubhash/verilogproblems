
module lfsr(out,datain,rst,clk);
 input wire rst,clk;
 input wire [3:0]datain;
 output reg [3:0]out;
 
 reg state;
 always@(posedge clk)begin
 $display("%d | %b | %b | %b",$time,datain,out,state);
 if(rst)begin
 
 out<=datain;
 state<=0;
 end else begin
 //if we assign state here in non blocking assignment it will not work 
   //the feed back will work in different manner
   //becaue the state will assign to out in next clock cycle
   
// state <= out[0] ^ out[1];
// out <= { state , out[3:1] };

 state = out[0] ^ out[1];
 out <= { state , out[3:1] };

 
 end
 
 end
 endmodule
 
