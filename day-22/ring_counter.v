
//strutral model

module ring_counter(q,clk,rst);

 
input wire clk,rst;
output reg [3:0]q;

wire q3d2,q2d1,q1d0,q0d3;

wire q3,q2,q1,q0;

d_ff one(.q(q3d2),.d(q0d3),.clk(clk),.rst(rst),.ini(1'b1) );
d_ff two(.q(q2d1),.d(q3d2),.clk(clk),.rst(rst) ,.ini(1'b0));
d_ff thr(.q(q1d0),.d(q2d1),.clk(clk),.rst(rst),.ini(1'b0));
d_ff fou(.q(q0d3),.d(q1d0),.clk(clk),.rst(rst),.ini(1'b0) );

 assign q3 = q3d2;
 assign q2 = q2d1;
 assign q1 = q1d0;
 assign q0 = q0d3;


always@(posedge clk)begin
$display("%b | %b | %b | %b ", q[3],q[2],q[1],q[0]);

if(rst)begin
q <=4'b1000;
end
else begin
 
q[3]<=q3;
q[2]<=q2;
q[1]<=q1;
q[0]<=q0;
 
 
end

end
endmodule


module d_ff(q,d,clk,rst,ini);

input wire d,clk,rst,ini;
output reg q;

always@(posedge clk)begin
if(rst)begin
q <= ini;
end
else begin
q <= d;
end


end

endmodule

 
 //behaviroal model
module ring_counter(q,d,clk,rst);

input wire d,clk,rst;
output reg [3:0]q;

always@(posedge clk)begin

if(rst)begin
q<=d;

end
else begin
//q <= {q[2:0],q[3]};
q <= {q[0],q[3:1]};

end

end
endmodule

