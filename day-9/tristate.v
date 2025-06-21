module tri_state(
input wire a,b,c,d,
input wire s0,s1,e,
output reg ao,bo,co,do

);

reg ae,be,ce,de;

always@(*) begin

 if(e) begin
  if(s0 == 0 && s1 == 0)begin
   ae <= 1;
   be <= 0;
   ce <= 0;
   de <= 0;
   end
   else if(s0 == 0 && s1 ==1)begin
    be <= 1;
    ae <= 0;
    ce <= 0;
    de <= 0; 
   end
   else if(s0 == 1 && s1 == 0)begin
   ce <= 1;
   ae <= 0;
   be <= 0;
   de <= 0;
   end
   else if(s0 == 1 && s1 == 1)begin
   de <= 1;
   ae <= 0;
   be <= 0;
   ce <= 0;
   end
 
 end
 
 
 else begin
  ao = 1'bz;
  bo = 1'bz;
  co = 1'bz;
  do = 1'bz;

 end
 
 
  ao = ae ? a : 1'bz;
  bo = be ? b : 1'bz;
  co = ce ? c : 1'bz;
  do = de ? d : 1'bz;
 
end

endmodule


//chat-gpt modified
/*
module tri_state(
    input wire a, b, c, d,
    input wire s0, s1, e,
    output wire ao, bo, co, do
);

    wire [1:0] sel = {s1, s0};

    assign ao = (e && sel == 2'b00) ? a : 1'bz;
    assign bo = (e && sel == 2'b01) ? b : 1'bz;
    assign co = (e && sel == 2'b10) ? c : 1'bz;
    assign do = (e && sel == 2'b11) ? d : 1'bz;

endmodule
*/
