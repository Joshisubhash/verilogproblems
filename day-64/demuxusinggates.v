
  module demux_using_gates(a,b,c,d,din,sel);
  
  input wire [1:0]sel;
  input wire din;
  output wire a,b,c,d;
  
  wire [1:0]sel_w;
  
  not_gate g1(.out(sel_w[1]),.in(sel[1]));
  not_gate g2(.out(sel_w[0]),.in(sel[0]));
  
  and_gate g3(.out(a),.x(sel_w[1]),.y(sel_w[0]),.din(din));
  and_gate g4(.out(b),.x(sel_w[1]),.y(sel[0]),.din(din));
  and_gate g5(.out(c),.x(sel[1]),.y(sel_w[0]),.din(din));
  and_gate g6(.out(d),.x(sel[1]),.y(sel[0]),.din(din));
  
  endmodule
  
  
  module not_gate(out,in);
  input wire in;
  output wire out;
  
 assign out = ~in;
  
  endmodule
  
  
  module and_gate(out,x,y,din);
  
  input wire x,y,din;
  output wire out;
  
  assign out = x & y & din;
  
  endmodule
  
