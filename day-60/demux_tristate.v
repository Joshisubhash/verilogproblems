
//This is used in shared buses, its works in real hardware.
 module demux_tristate(out1,out2,out3,out4,sel,in);
 
 input wire in;
 input wire [1:0]sel;
 
 output wire out1,out2,out3,out4;
 
 assign out1 = (sel == 2'b00) ? in : 1'bz;
 assign out2 = (sel == 2'b01) ? in : 1'bz;
 assign out3 = (sel == 2'b10) ? in : 1'bz;
 assign out4 = (sel == 2'b11) ? in : 1'bz;
 
 
 endmodule
