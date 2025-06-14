//day - 1





//gate level modeling
 
module full_adder(a,b,c,sum,cout);
    input a,b,c;
    output sum,cout;
      wire first,two,three,four;
    wire one;
    
   xor(one,b,c);
   xor(sum,a,one);
   
 
   
   and(first,a,b);
   and(two,b,c);
   and(three,c,a);
   
   or(four,first,two);
   or(cout,four,three);
endmodule







//data flow modelling


module full_adder(
input wire a,b,c,
output sum , cout

);

 assign sum = a^b^c;
 assign cout = a&b | b&c | c&a ;
 
endmodule




//Behavioral Modeling

module full_adder(input wire a,b,c, output reg sum,cout);
always@(*) begin
 sum = a^b^c;
 cout = a&b | b&c | c&a ; 
 
end
endmodule



//structural modelling
module full_adder(sum,cout,a,b,c);
    input a,b,c;
    output sum,cout;
      wire first,two,three,four;
    wire one;
    
   xor(one,b,c);
   xor(sum,a,one);
   
 
   
   and(first,a,b);
   and(two,b,c);
   and(three,c,a);
   
   or(four,first,two);
   or(cout,four,three);
endmodule



module full_adder_main(sum,cout,a,b,c);
input wire a,b,c;
output wire sum,cout;
full_adder one(.sum(sum),.cout(cout),.a(a),.b(b),.c(c));
endmodule


