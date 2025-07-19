module bcd_counter(out,cout,a,b,cin);

input wire [3:0]a,b;
input wire cin;
output wire [3:0]out;
output wire cout;


wire [4:0]mid;
 
assign mid = a + b + cin;
assign cout = mid > 9 ? 1 : 0;
assign out = mid > 9 ? mid[3:0] + 6 : mid[3:0];
// assign cout = mid > 9 ? 1 : 0;

always@(*) begin
 $display("%b + %b + %b = %b(mid) , %b(cout) , %b(out)",a,b,cin,mid,cout,out);
end

endmodule


