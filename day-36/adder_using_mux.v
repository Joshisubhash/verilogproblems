module full_adder_using_mux(sum,cout,a,b,cin);

input wire a,b,cin;
output reg sum,cout;

always@(*)begin
if(a==b)begin
sum = cin;
cout = b;
end else begin
sum = ~cin;
cout = ~sum;
end
end
endmodule
