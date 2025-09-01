module binary_bcd(hundred,tens,ones,dec_in,rst,clk);
   
   input wire [3:0]dec_in;
   input wire rst,clk;
   
   output reg [3:0]hundred,tens,ones;
   
   reg [3:0]shift_hundred=0;
   reg [3:0]shift_tens=0;
   reg [3:0]shift_ones=0;
   reg [11:0]shift=0;
   
   reg [3:0]count=4;
   always@(posedge clk)begin
   if(rst)begin
   hundred <= 0;
   tens <= 0;
   ones <= 0;
   count <= 4;
   shift <= 0;
   end else begin
   if(count!=0)begin
      
  if(shift[11:8] >4)begin
  shift[11:8] = shift[11:8] + 4'd3;
  end  
  
  if(shift[7:4] >4)begin
  shift[7:4] = shift[7:4] + 4'd3;
  end 
  
  if(shift[3:0] >4)begin
  shift[3:0] = shift[3:0] + 4'd3;
  end
   
   
   
//   shift <= {shift_hundred[3:0],shift_tens ,shift_ones,dec_in[count]};
   shift <= {shift[10:0],dec_in[count-1]};
// shift <= (shift << 1 ) |  dec_in[count-1];
  
   count <= count - 1'b1;
   $display("%b | %b | %b",shift,count,dec_in[count-1]);
   end else begin
 
   hundred <= shift[11:8];
   tens <= shift[7:4];
   ones <= shift[3:0];
    
   end
   end
    
   end
    
   endmodule
   
   
//   --------------not works last shift overwritres all---------------------
//   At one clock edge:

//Clock rises.

//Simulator executes the always block top to bottom, but:

//The if checks shift[3:0] (old value).

//If > 4, it schedules an update for shift[3:0].

//It does NOT apply immediately (non-blocking).

//Then the line shift <= {...} schedules another update for the entire shift register.

//End of this clock → both scheduled updates try to apply.

//But shift <= {...} overwrites the entire register, so the slice update (shift[3:0] <= ...) is lost.
     
//  if(shift[11:8] >4)begin
//  shift[11:8] <= shift[11:8] + 4'd3;
//  end   
//  if(shift[7:4] >4)begin
//  shift[7:4] <= shift[7:4] + 4'd3;
//  end  
//  if(shift[3:0] >4)begin
//  shift[3:0] <= shift[3:0] + 4'd3;
//  end 
//   shift <= {shift[10:0],dec_in[count-1]};

//------------works----------------
//At one clock edge:

//Clock rises.

//Simulator executes the always block top to bottom.

//It checks shift[3:0] using the current value.

//If > 4, it immediately updates shift[3:0] because of =.

//Then it schedules shift <= {...} for the end of the timestep.

//End of this clock → shift gets the new shifted value.
//But note: the shifted value was calculated after correction, so correction is preserved.

//  if(shift[11:8] >4)begin
//  shift[11:8] = shift[11:8] + 4'd3;
//  end   
//  if(shift[7:4] >4)begin
//  shift[7:4] = shift[7:4] + 4'd3;
//  end  
//  if(shift[3:0] >4)begin
//  shift[3:0] = shift[3:0] + 4'd3;
//  end 
//   shift <= {shift[10:0],dec_in[count-1]};
