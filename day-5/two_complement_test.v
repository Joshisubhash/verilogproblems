
module two_complement_test();

reg [3:0]a,b;
wire [4:0]val;
wire signed_flag;


two_complement test(
.a(a),
.b(b),
.val(val),
.signed_flag(signed_flag)
 

);

 
initial begin 
 
 
     a = 4'b0000; b = 4'b0000; #10;
     $display("%b  %b  %b  ", a, b, val);
                                             
    a = 4'b0001; b = 4'b0001; #10          
          $display("%b  %b  %b  ", a, b, val);
                                             
    a = 4'b0101; b = 4'b0011; #10            
      $display("%b  %b  %b  ", a, b, val);
                                             
    a = 4'b1111; b = 4'b0001; #10             
          $display("%b  %b  %b  ", a, b, val);
      
    a = 4'b1111; b = 4'b1111; #10            
        $display("%b  %b  %b  ", a, b, val);
                                             
    a = 4'b1111; b = 4'b1111; #10            
           $display("%b  %b  %b  ", a, b, val);
                                             
    a = 4'b1010; b = 4'b0101; #10            
         $display("%b  %b  %b  ", a, b, val);
                                             
    a = 4'b0011; b = 4'b0101; #10             
        $display("%b  %b  %b  ", a, b, val);                                  
    $finish;
end
endmodule
































module two_complement_test();

reg [3:0]a,b;
reg mode;

wire [4:0]s_val,u_val;

two_complement test(
.a(a),
.b(b),
 
.mode(mode),
.s_val(s_val),
.u_val(u_val)

);

 
initial begin 
 
   mode = 1 ;
       a = 4'b0000; b = 4'b0000; #10;
         $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b0001; b = 4'b0001; #10          
      $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b0101; b = 4'b0011; #10            
   $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1111; b = 4'b0001; #10             
      $display("%b  %b  %b %b", a, b, s_val , u_val);
      
    a = 4'b1111; b = 4'b1111; #10            
      $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1111; b = 4'b1111; #10            
        $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1010; b = 4'b0101; #10            
       $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b0011; b = 4'b0101; #10             
       $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
                                             
     mode = 0;                            
                                             
                                             
        a = 4'b0000; b = 4'b0000; #10         
       $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b0001; b = 4'b0001; #10             
       $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b0101; b = 4'b0011; #10            
       $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1111; b = 4'b0001; #10            
      $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1111; b = 4'b1111; #10             
    $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1111; b = 4'b1111; #10             
   $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b1010; b = 4'b0101; #10             
   $display("%b  %b  %b %b", a, b, s_val , u_val);
                                             
    a = 4'b0011; b = 4'b0101; #10              
     $display("%b  %b  %b %b", a, b, s_val , u_val);
     
    
    $finish;
   

end
endmodule






