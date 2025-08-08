
module simple_divider(r,qt,divident,divisor,rst,clk);

input wire [3:0]divident,divisor;
input wire rst,clk;
output reg [3:0]qt,r;

reg [3:0]temp=0;
reg [4:0]new_temp=0;
reg [2:0]count=4;
reg [3:0]q;
 
reg [3:0]reg_val;
always@(posedge clk)begin
if(rst)begin
q<=0;
r<=0;
temp<=0;
count <= 4;
reg_val<=0;
 
end else begin
/*

When you write blocking (=) inside a clocked block, the synthesis tool will still produce flip-flops, but your simulation may behave differently than the actual hardware if you rely on the “instant update” behavior.

This can cause simulation–synthesis mismatches 

*/
//if(count !=0)begin
//$display("reg-%b | temp-%b | new_tem-%b | q-%b | r-%b | count-%b |",reg_val,temp,new_temp,q,r,count);
////temp <= temp << divident[count-1];
// reg_val = (reg_val <<  1) | divident[count-1];
//new_temp = reg_val[3:0] - divisor;
//if(new_temp[3] == 0)begin
//reg_val = new_temp[3:0];
//q[count-1] = 1;
//end else begin
//q[count-1] = 0;
//end

//count = count - 1'b1;
 

      if (count != 0) begin
        $display("reg=%b | temp=%b | new_temp=%b | q=%b | r=%b | count=%b", reg_val, temp, new_temp, q, r, count);

        reg_val <= (reg_val << 1) | divident[count-1];   

        if (((reg_val << 1) | divident[count-1]) >= divisor) begin
          new_temp <= ((reg_val << 1) | divident[count-1]) - divisor;
          q[count-1] <= 1'b1;
          reg_val <= ((reg_val << 1) | divident[count-1]) - divisor;
        end else begin
          new_temp <= ((reg_val << 1) | divident[count-1]);
          q[count-1] <= 1'b0;
          reg_val <= ((reg_val << 1) | divident[count-1]);
        end

        count <= count - 1'b1;
      end else begin
        r <= reg_val;  
        qt <= q; 
      end
end

end

endmodule
