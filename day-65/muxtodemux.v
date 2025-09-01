

  module mux_to_demux(a,b,c,d,out1,out2,out3,out4,sel);
  
  input wire a,b,c,d;
  input wire [1:0]sel;
  
  output wire out1,out2,out3,out4;
  
  wire midwire;
  
  mux one(.out(midwire),.a(a),.b(b),.c(c),.d(d),.sel(sel));
  demux two(.in(midwire),.a(out1),.b(out2),.c(out3),.d(out4),.sel(sel));
  
  
  endmodule
  
  
  
  module mux(out,a,b,c,d,sel);
  input a,b,c,d;
  input [1:0]sel;
  
  output wire out;
  

//  assign  out= (sel == 2'b00) ?  a : 0; 
//  assign  out= (sel == 2'b01) ? b : 0; 
//  assign  out= (sel == 2'b10) ? c : 0; 
//  assign  out= (sel == 2'b11) ? d : 0;
// in Verilog, a wire cannot have multiple drivers unless you are intentionally modeling tri-state bus.
//Here, only the last assign will effectively remain valid, so your mux won’t work correctly.
  
  
  assign out = (sel == 2'b00) ? a : 
              (sel == 2'b01) ? b :
              (sel == 2'b10) ? c :
                               d ;
                   
  
  endmodule
  
  
   module demux(in,a,b,c,d,sel);
  output a,b,c,d;
  input [1:0]sel;
  
  input wire in;
  
  assign  a = (sel == 2'b00) ? in : 0; 
  assign  b = (sel == 2'b01) ? in : 0; 
  assign  c = (sel == 2'b10) ? in : 0; 
  assign  d = (sel == 2'b11) ? in : 0; 
  
  
  endmodule
