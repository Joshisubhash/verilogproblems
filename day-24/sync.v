module sync(synout,ff1,ff2,asynin,clka,clkb,rst);

input wire clka,clkb,asynin,rst;
output reg synout;


output reg ff1,ff2;

always@(posedge clkb)begin
if(rst)begin
synout <= 0;
ff1<=0;
ff2<=0;
end else begin
ff1 <= asynin;
ff2 <= ff1;
synout <= ff2;
end

end
endmodule
