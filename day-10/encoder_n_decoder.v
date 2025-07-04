//behavioral model 
module decoder(out ,in);
input wire [1:0]in;
output reg [3:0]out;

always@(*)begin
 case(in)
 2'b00 : out <= 4'b0001;
 2'b01 : out <= 4'b0010;
 2'b10 : out <= 4'b0100;
 2'b11 : out <= 4'b1000;
 endcase
end
endmodule

//4:16 decoder using 2:4 decoder

//strutural model
module decoder(out ,in ,e);
input wire [1:0]in;
input wire e;
output reg [3:0]out;



always@(*)begin
if(e)begin
 case(in)
 2'b00 : out <= 4'b0001;
 2'b01 : out <= 4'b0010;
 2'b10 : out <= 4'b0100;
 2'b11 : out <= 4'b1000;
 endcase
 end
 else out <= 4'b0000;
 

end
endmodule



 
 module main(out,in,e);
 
input wire [3:0] in;
input wire e;
output wire [15:0] out;

  wire [3:0] cdout;


decoder one(.out(cdout[3:0]), .in(in[3:2]), .e(e));
initial begin
$display("Input: %b, Output: %b", in[3:2], cdout);
end
decoder two(.out(out[3:0])  ,.in(in[1:0]), .e(cdout[0]) );
decoder three(.out(out[7:4]), .in(in[1:0]) , .e(cdout[1]));
decoder four(.out(out[11:8]), .in(in[1:0]) , .e(cdout[2]));
decoder five(.out(out[15:12]), .in(in[1:0]) , .e(cdout[3]));
 


endmodule


