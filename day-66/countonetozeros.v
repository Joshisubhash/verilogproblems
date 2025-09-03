  
module countoneanndzeros(equal,out1,out0,in,clk,rst);  

input wire [31:0]in;
input wire clk,rst;

output reg out1,out0,equal;

always@(posedge clk)begin
if(rst)begin
out1 <=0;
out0 <=0;
end else begin
if(in[0] == in[31])begin
equal <= 1;
out0 <= 0;
out1 <= 0;
end else if(in[0]==0 && in[31] == 1)begin
out0 <= 1;
out1 <= 0;
equal <= 0;
end else if(in[0] == 1 && in[31] == 0)begin
out1 <= 1;
out0 <= 0;
equal <= 0;
end 

end 

end
 
endmodule

//𝐌𝐞𝐭𝐡𝐨𝐝2(𝐎𝐩𝐭𝐢𝐦𝐚𝐥 𝐬𝐨𝐥𝐮𝐭𝐢𝐨𝐧):-
//• The idea here is for every 0 to 1 transition, there is a 1 to 0 transition that cancels out. 
//• So, we need to record the first bit in the stream and track the current bit in the stream.
//• 𝐈𝐟 𝐭𝐡𝐞 𝐟𝐢𝐫𝐬𝐭 𝐛𝐢𝐭 𝐢𝐧 𝐭𝐡𝐞 𝐬𝐭𝐫𝐞𝐚𝐦 𝐢𝐬 0 𝐚𝐧𝐝 𝐭𝐡𝐞 𝐜𝐮𝐫𝐫𝐞𝐧𝐭 𝐛𝐢𝐭 𝐢𝐬 𝐚𝐥𝐬𝐨 0. In between, no matter how many transitions between 0 to 1 or 1 to 0 happened. Those will be equal. Since, every 0 to 1 transition will be followed by 1 to 0 immediately next bit or over next couple of bits.
//• 𝐈𝐟 𝐭𝐡𝐞 𝐟𝐢𝐫𝐬𝐭 𝐛𝐢𝐭 𝐢𝐧 𝐭𝐡𝐞 𝐬𝐭𝐫𝐞𝐚𝐦 𝐢𝐬 0 𝐚𝐧𝐝 𝐭𝐡𝐞 𝐜𝐮𝐫𝐫𝐞𝐧𝐭 𝐛𝐢𝐭 𝐢𝐬 1. That means at last there is a 0 to 1 transition happend. But, after that 1 to 0 didnt happen. So, in this case 0 to 1 transitions are more.
//• 𝐈𝐟 𝐭𝐡𝐞 𝐟𝐢𝐫𝐬𝐭 𝐛𝐢𝐭 𝐢𝐧 𝐭𝐡𝐞 𝐬𝐭𝐫𝐞𝐚𝐦 𝐢𝐬 1 𝐚𝐧𝐝 𝐭𝐡𝐞 𝐜𝐮𝐫𝐫𝐞𝐧𝐭 𝐛𝐢𝐭 𝐢𝐬 𝐚𝐥𝐬𝐨 1. In between, no matter how many transitions between 1 to 0 or 0 to 1 happens. Those will be same.
//• 𝐈𝐟 𝐭𝐡𝐞 𝐟𝐢𝐫𝐬𝐭 𝐛𝐢𝐭 𝐢𝐧 𝐭𝐡𝐞 𝐬𝐭𝐫𝐞𝐚𝐦 𝐢𝐬 1 𝐚𝐧𝐝 𝐭𝐡𝐞 𝐜𝐮𝐫𝐫𝐞𝐧𝐭 𝐛𝐢𝐭 𝐢𝐬 0. That means at last there is a 1 to 0 transition happend. But, after that 0 to 1 didnt happen. So, in this case 1 to 0 transition is more.

