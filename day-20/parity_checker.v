
module parity_checker(out,in,rst,clk,done);

input wire in,rst,clk,done;
output reg out;

reg [3:0]count=4'b0000;
reg [2:0]state;

always@(posedge clk)begin

if(rst)begin
state <= 0;
out<=0;
end
else begin

case(state)
0 : begin                          // state 0 , check for 1 if bit is 1 go for state 1 and done is 1 go to state 2
    if(in==1'b1)begin
    state<=1;
    out<=1'b0;
 
    end
    else begin
    out<=1'b0;
    state<=0;
    if(done)begin
    state <= 2;
    out<=0;              
    end
    end
    end
    
 1: begin 
   count <= count + 1'b1;    // state 1 where it update the count and send it to the state 2 if done is 1 if not state again go to 0
      if(done)begin
      state <= 2;
      end
      else begin
       state <=0;
       end
        end 
        
 2 : begin                   //in state 2 check if the count is even or odd based on that assign out and go to state 3
   if(count[0] == 1)begin      
      out<=1'b1;
      state<=3;
      end
      else begin
      state <= 3;
      out <= 0;
      end
     end 
 3 :  begin    // after state 2 complete stay in this state for and out is 0
     state <=3;
     out <= 0;
     end
     
     endcase   
end

end
endmodule

