
// empty = (w_ptr == r_ptr);
//full  = ((w_ptr + 1) % DEPTH == r_ptr);

 module sync_fifo(data_out,data_in,rst,w_en,r_en,clk,full,empty);
  
 input wire clk;
 input wire rst;
 input wire data_in;
 input wire w_en,r_en;
 output reg empty,full;
 output reg data_out;
 
 reg [3:0]w_ptr,r_ptr;
 
 reg mem[0:15];
 
 always@(posedge clk)begin
 if(rst)begin
 empty <= 0;
 full <= 0;
 w_ptr <= 0;
 r_ptr <= 0;
 data_out <=0;
 end else begin
 
 if(w_en && !full)begin
 mem[w_ptr] <= data_in;
// full <= 0;
// empty <=0 ;
 if((w_ptr + 1) % 16 == r_ptr)begin
 full <= 1;
 empty <= 0;
// w_ptr <= 0;
 end else begin
 w_ptr <= w_ptr + 1'b1;
 end
 end
 
 if(r_en && !empty)begin
 data_out <= mem[r_ptr];
// full <=0;
// empty <= 0;
 if(r_ptr == w_ptr)begin
 empty <= 1;
 full <= 0;
 data_out <= 0;
// r_ptr <= 0;
 end else begin
 r_ptr <= r_ptr + 1'b1;
 end
 end
 
 
 end
 end
 
 endmodule
 
