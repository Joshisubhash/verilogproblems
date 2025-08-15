
 module fifo(out,datain,push,pop,rst,clk,full,empty);
 parameter width = 7,depth =7;
 
  input [width:0]datain;
  input rst,clk;
  input push,pop;
  
  output reg [width:0]out;
  output wire full;
  output wire empty;
  
  reg [width:0] mem [0:depth];
  
//  reg [width:0]out_reg;
  reg [4:0]wptr;
  reg [4:0]rptr;
  reg [3:0] count;
 
//assign empty = (wptr == rptr);
//assign full = ((wptr + 1)% depth == rptr);
    assign full  = (count == depth);
    assign empty = (count == 0);
  
  
  always@(posedge clk)begin
  if(rst)begin
  out <= 0;
  wptr <= 0;
  rptr <= 0;
  count <= 0;
  end else begin
  case({push,pop})
  2'b10 : begin
          if(!full)begin
          mem[wptr] <= datain;
           wptr <= (wptr + 1'b1) % depth;//for wrap up we do % depth
           count <= count + 1'b1;
          end
          end
  2'b01 : begin
           if(!empty)begin
           out <= mem[rptr];
            rptr <= (rptr + 1)% depth;//for wrap up we do % depth
          
            count <= count - 1'b1;
         end
          end
  
  endcase
  end
  
  end
  
  endmodule
