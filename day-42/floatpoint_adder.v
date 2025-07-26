

module fp(out,a,b,clk,rst);

input wire [9:0]a,b;
input wire clk,rst;
output reg [9:0]out;

reg sign_a,sign_b;
reg [3:0]exp_a;
reg [3:0]exp_b;
reg [5:0]man_a;
reg [5:0]man_b;

reg [5:0]last_man_a;
reg [5:0]last_man_b;
reg [5:0]sum;
reg [5:0]sum_man;
reg co;

reg [3:0]diff_exp_a;
reg [3:0]diff_exp_b;
reg [3:0]com_diff;

reg [4:0]com;


reg out_sign;
reg [3:0]out_exp;
reg [4:0]out_man;

reg flag;
reg [3:0]count=0;

reg [3:0]state;
reg [3:0]prevstate;

integer i;
always@(posedge clk)begin
if(rst)begin
state <= 0;
end else begin
case(state)
0 : begin
       $display("0st state");
        sign_a <= a[9];
        sign_b <= b[9];
        exp_a = a[8:5];
        exp_b = b[8:5];
        man_a[4:0] = a[4:0];
        man_b[4:0] = b[4:0];
        
       diff_exp_a = exp_a - 7;
       diff_exp_b = exp_b - 7;
        
        man_a[5] = 1;
        man_b[5] = 1; 
       
       flag = 1;
        $display("%b | %b | %b | %b | %b |%b",exp_a,exp_b,man_a,man_b,diff_exp_a,diff_exp_b);
        if(flag)begin
        state <= 1;
        flag=0;
        end
        end
1 :   begin
       $display("1st state");
       if(diff_exp_a > diff_exp_b)begin
       com = diff_exp_a - diff_exp_b;
       com_diff = diff_exp_a; 
       last_man_b = man_b >> com;
       last_man_a = man_a;
       flag=1; 
       $display("%b | %b |%b |%b",com,com_diff,last_man_a,last_man_b);
       end else if(diff_exp_a < diff_exp_b)begin
       com = diff_exp_a - diff_exp_b;
       com_diff = diff_exp_b; 
       last_man_a = man_a >> com;
       last_man_b = man_b;
       flag=1; 
        $display("%b | %b |%b |%b",com,com_diff,last_man_a,last_man_b);
       end else begin
       com_diff = diff_exp_b;
       last_man_a = man_a;
       last_man_b = man_b;
       flag=1;
               $display("%b | %b |%b ",com_diff,last_man_a,last_man_b);
       end
       if(flag)begin
       state <= 2;
       prevstate<=1;
       flag=0;
       end

     end
 2 : begin
    $display("2nd state");
    flag=0;
    if(sign_a==sign_b)begin
     {co,sum} = last_man_a + last_man_b;
     if(co)begin
      com_diff = com_diff +1;
      sum_man = {co,sum[5:1]};
      flag = 1;
      end else  begin
      sum_man = sum;
      flag=1;
      end
      end 
      
      
      
      
      
      else begin
      if(last_man_a > last_man_b)begin
      if(prevstate == 1)begin
      out_sign <= sign_a;
       sum = last_man_a - last_man_b;
       sum_man = sum;
       end 
       if(sum_man[5] == 0)begin
       state <= 5;
       end else begin
       com_diff = com_diff - count;
       state <= 3;
       end 
   
        $display("count-%b | com_diff-%b | sum_man-%b | sum-%b",count,com_diff,sum_man,sum); 
      end 
     
      else if(last_man_a < last_man_b)begin
      if(prevstate == 1)begin
      out_sign <= sign_b;
      sum =   last_man_b - last_man_a;
      sum_man = sum;
      end else begin 
     if(sum_man[5] == 0)begin
       state <= 5;
       end else begin
       com_diff = com_diff - count;
       state <= 3;
       end

        $display("count-%b | com_diff-%b | sum_man-%b |sum-%b",count,com_diff,sum_man,sum); 
       end
      end
      
      else begin
      out_sign = 0;
      out_exp=0;
      out_man=0;
      state = 4;
      
      end
      end
      $display("%b | %b | %b |%b ",sum,co,com_diff,sum_man);
      if(flag)begin
      state = 3;
      flag=0;
      end
     end
 3 :  begin
    $display("3rd state");
      if(sign_a == sign_b)begin
      out_sign = sign_a;
      out_exp = com_diff + 7;
      out_man = sum_man[4:0];
      flag=1;
      end else begin 
      out_exp = com_diff + 7;
      out_man = sum_man[4:0];
      flag=1;
      end
      $display("%b | %b | %b | %b" , sum[5],out_sign,out_exp,out_man);
      if(flag)begin
      state = 4;
      flag=0;
      end
   end
4 : begin
      $display("4th state");
     out = {out_sign,out_exp,out_man};
     $display("%b",out);
     end
     
 5 : begin 
     $display("5th state");
     if (count!=6 && sum_man[5]!=1) begin
    sum_man <= sum << 1;
    count = count + 1;
    $display("%b |%b | %b",sum_man,count,sum);
  end else begin
    prevstate<=5;
    state <= 2; // Move to next state
  end
  end 
endcase
end
end
endmodule

