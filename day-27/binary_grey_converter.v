//binary to grey real time converter
module b2g(grey,rst,clk);

input wire rst,clk;
 
output reg [3:0]grey;

reg [3:0]bin=0;

 

always@(posedge clk)begin
$display("%b",bin);
if(rst)begin
grey <= 0;
end else begin
bin <= bin + 1'b1;
grey <= {bin[3] , bin[3]^bin[2] , bin[2]^bin[1] , bin[1]^bin[0]};
 // grey <= (bin + 1 ) ^ ((bin + 1) >> 1); //same as above
end

end
endmodule


//grey to binary real time converter
 module g2b(grey_out,rst,clk);

input wire rst,clk;
 
output reg [3:0]grey_out;

reg [3:0]bin=0;
reg [3:0]grey=0;
 

always@(posedge clk)begin
$display("%b | %b | %b",bin,grey,grey_out);
if(rst)begin
grey <= 0;
end else begin
bin <= bin + 1'b1;
grey <= {bin[3] , bin[3]^bin[2] , bin[2]^bin[1] , bin[1]^bin[0]};

  
grey_out[3] = grey[3];
grey_out[2] = grey[3] ^ grey[2] ;
grey_out[1] = grey_out[2] ^ grey[1];
grey_out[0] = grey_out[1] ^ grey[0];

//grey_out[1] <= grey_out[2] ^ grey[1];  // Uses stale value of grey_out[2]
//when u apply <= assignment then there is unstable output so use blocking assignmnet here.

end

end
endmodule
