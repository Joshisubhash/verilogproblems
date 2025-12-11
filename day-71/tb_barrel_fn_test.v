 
    module barrel_shifter_tbfunction_test();
    
    reg [3:0]in;
    reg  [2:0]mode;
    reg [1:0]sel;
    reg clk,rst;
    
    wire [3:0]out;
   integer i,j,k;
   barrel_shifter_tbfunction test(.out(out),.in(in),.mode(mode),.sel(sel),.clk(clk),.rst(rst));
   
   reg [3:0]expected;
   initial clk = 0;
   always #5 clk = ~clk;
   
   
   initial begin
   rst = 1;
   #25;
   rst = 0;
   
//   in = 4'b1010;
//   mode = 3'd0;
//   sel = 2'b00; #10;
//   sel = 2'b01; #10;
//   sel = 2'b10; #10;
//   sel = 2'b11; #10;
   
//   in = 4'b0101;
//    mode = 3'd1;
//   sel = 2'b00; #10;
//   sel = 2'b01; #10;
//   sel = 2'b10; #10;
//   sel = 2'b11; #10;
   
//   in = 4'b1100;
//   mode = 3'd2;
//   sel = 2'b00; #10;
//   sel = 2'b01; #10;
//   sel = 2'b10; #10;
//   sel = 2'b11; #10;
   
//   in = 1101;
//    mode = 3'd3;
//   sel = 2'b00; #10;
//   sel = 2'b01; #10;
//   sel = 2'b10; #10;
//   sel = 2'b11; #10;
   
//   in = 4'b1001;
//    mode = 3'd4;
//   sel = 2'b00; #10;
//   sel = 2'b01; #10;
//   sel = 2'b10; #10;
//   sel = 2'b11; #10;
   
   
   
   for(i=0;i<15;i=i+1)begin 
      for(j=0;j<5;j=j+1)begin 
        for(k=0;k<4;k=k+1)begin
         in = i;
         sel = k;
         mode = j;
         #10;
         end
         
 case(mode)

    
  3'b000 : begin
           if(sel == 0)begin
           expected = in;
           end else begin
           expected = in << sel;
           end
    end
    
   3'b001 : begin
           if(sel == 0)begin
           expected = in;
           end else begin
           expected = in >> sel;
           end
    end 
  3'b010 : begin 
  if(sel == 0)begin
   expected <= in;
   end else begin
            case(sel)
           2'b00 : expected = in;
           2'b01 : expected = {in[3] ,in[3:1]};
           2'b10 : expected = {in[3],in[3] , in[3:2]};
           2'b11 : expected = {in[3],in[3],in[3] , in[3]}; 
           endcase
    end
    end
    
   3'b011 : begin
          case(sel)
           2'b00 : expected  = in;
           2'b01 : expected  = {in[2:0] ,in[3]};
           2'b10 : expected  = {in[1:0] , in[3:2]};
           2'b11 : expected  = {in[0] , in[3:1]}; 
           endcase
          
    end
   3'b100 : begin
           
          case(sel)
           2'b00 : expected  = in;
           2'b01 : expected  = {in[0] , in[3:1]};
           2'b10 : expected  = {in[1:0] , in[3:2]};
           2'b11 : expected  = {in[2:0] , in[3]}; 
           endcase
          
    end
 
 
 
 endcase
 
    if(out != expected)begin
   $display("expected - %d | %d | %d | %d",$time , expected,in ,sel,mode);
   $display("actual - %d | %d | %d | %d",$time , out,in ,sel,mode);
   end
   
   
          
      end
   
   end
   $finish;
   end
   endmodule
   
