


// sr latch behavioral  modelling
module latch(q,qb,s,r);
input wire s,r;
output reg q;
output wire qb;
 
assign qb = ~q;
 
always@(*)begin
if(!s & !r)begin
q <= 1'bx;
end
else if(!s & r)begin
q <= 1;
end
else if(s & !r)begin
q <= 0;
end
else begin
q <= q;
end
end
endmodule


//sr latch gate level modelling
module sr_latch_nand (
   input wire s,  // active-low set
   input wire r,  // active-low reset
   output wire q,
   output wire qb
);

assign q    = ~(s & qb);
assign qb = ~(r & q);

endmodule


//wrong gate level modelling , which causes the combinational loop
// module latch(q,qb,s,r);
// input wire s,r;
// output wire q,qb; 
// assign q = s |~ qb;
// assign qb = r |~ q;
// endmodule

//D latch behavioral modelling
module latch(q,qb,e,d);
input wire d,e;
output reg q,qb;

always@(*)begin
if(e)begin
q = d;
qb = ~q;
end
end
endmodule



//D latch gate level modelling
module latch(q,qb,e,d);

input wire e,d;
output wire q,qb;

wire o,t;

assign o = ~(d & e);
assign t = ~(o & e);

assign q = ~(o & qb);
assign qb = ~(t & q);


endmodule
