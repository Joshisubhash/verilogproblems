
module encoder_test();
reg [1:0] in;
wire [3:0] out;
encoder test (.in(in) , .out(out));
 initial begin 
 
 in = 2'b00;#10;
 $display("%b %b ",in,out);
 in = 2'b01;#10;
 $display("%b %b ",in,out);
 in = 2'b10;#10;
 $display("%b %b ",in,out);
 in = 2'b11;#10;
 $display("%b %b ",in,out);
 $finish;
 
 end
endmodule

