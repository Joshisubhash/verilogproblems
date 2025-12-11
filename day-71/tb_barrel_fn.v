
//4-bit Barrel Shifter
//Inputs: in[3:0], shift[1:0]
//Output: out[3:0] (shift left or right depending on mode)
//TB: Apply all input combinations, compare with TB-calculated shifted result. Print mismatches
 
 module barrel_shifter_tbfunction(out,mode,in,clk,rst,sel);
 input wire [3:0]in;
 input wire clk,rst;
 input [1:0]sel;
 input [2:0]mode;
 output reg [3:0]out;
 
 always@(posedge clk)begin
 if(rst)begin
 out <= 0;
 end else begin
 case(mode)

    
  3'b000 : begin
           if(sel == 0)begin
           out <= in;
           end else begin
           out <= in << sel;
           end
    end
    
   3'b001 : begin
           if(sel == 0)begin
           out <= in;
           end else begin
           out <= in >> sel;
           end
    end 
  3'b010 : begin 
  if(sel == 0)begin
   out <= in;
   end else begin
            case(sel)
           2'b00 : out <= in;
           2'b01 : out <= {in[3] ,in[3:1]};
           2'b10 : out <= {in[3],in[3] , in[3:2]};
           2'b11 : out <= {in[3],in[3],in[3] , in[3]}; 
           endcase
    end
    end
    
   3'b011 : begin
          case(sel)
           2'b00 : out <= in;
           2'b01 : out <= {in[2:0] ,in[3]};
           2'b10 : out <= {in[1:0] , in[3:2]};
           2'b11 : out <= {in[0] , in[3:1]}; 
           endcase
          
    end
   3'b100 : begin
           
          case(sel)
           2'b00 : out <= in;
           2'b01 : out <= {in[0] , in[3:1]};
           2'b10 : out <= {in[1:0] , in[3:2]};
           2'b11 : out <= {in[2:0] , in[3]}; 
           endcase
          
    end
 
 
 
 endcase
 end 
 
 
 end
 
 endmodule
