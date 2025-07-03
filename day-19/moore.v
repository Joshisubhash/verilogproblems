module moore_model_nonoverlapping(out,rst,clk,in);
 
 input wire clk,rst,in;
 output reg out;
 
 reg [4:0]state;
 
 always@(posedge clk)begin
 if(rst)begin
 state<=0;
 out<=0;
 end
 else begin
 case(state)
 0 : begin
     if(in == 1)begin
     out<=0;
     state<=1;
     end
     else begin
     state<=0;
     out<=0;
     end
     end
 1: begin
    if(in == 1)begin
    out<=0;
    state<=2;
    end
    else begin
    state<=0;
    out<=0;
    end
    end
 2 : begin
     if(in == 0)begin
     out<=0;
     state<=3;
     end
     else begin
     state<=1;
     out<=0;
     end
     end
 3: begin
    if(in==1)begin
    out<=0;
    state<=4;
    end
    else begin
    state<=0;
    out<=0;
    end
    end
 4: begin
    if(in==1)begin
    out<=1;
    state<=0;
    end
    else begin
    out<=0;
    state<=0;
    end
    end
 endcase
 
 end
 end
 endmodule 
 
 
 
 
 module moore_overlapiing(out,rst,clk,in);
 
 input wire in,clk,rst;
 output reg out;
 
 reg [4:0]state;
 
 always@(posedge clk)begin
 if(rst)begin
 state<=0;
 out<=0;
 end
 else begin
 case(state)
 0 : begin
     if(in == 1)begin
     out<=0;
     state<=1;
     end
     else begin
     state<=0;
     out<=0;
     end
     end
 1: begin
    if(in == 1)begin
    out<=0;
    state<=2;
    end
    else begin
    state<=0;
    out<=0;
    end
    end
 2 : begin
     if(in == 0)begin
     out<=0;
     state<=3;
     end
     else begin
     state<=2;
     out<=0;
     end
     end
 3: begin
    if(in==1)begin
    out<=0;
    state<=4;
    end
    else begin
    state<=0;
    out<=0;
    end
    end
 4: begin
    if(in==1)begin
    out<=1;
    state<=2;
    end
    else begin
    state <= 0;
    out <=0;
    end
    end
    endcase
  end
 end
 
 endmodule
