

 module fp_test();
 
 reg [9:0]a,b;
 reg clk,rst;
 wire [9:0]out;
 
 
 
 fp test(.a(a),.b(b),.clk(clk),.rst(rst),.out(out));
 
 initial clk=0;
 always #5 clk = ~clk;
 
 initial begin
 rst = 1;
    a = 10'b0100101100; b = 10'b0100011000; #30;  
    rst=0;
    #100;
    
    rst=1;
    a = 10'b1100101100; b = 10'b0100101100; #30;  
    rst=0;
    #100;
    
    rst=1;
    a = 10'b0100110000; b = 10'b0100010000; #30;  
    rst=0;
    #100;
    
    rst=1;
    a = 10'b1100110000; b = 10'b0100010000; #30;  
    rst=0;
    #100;
    
    rst=1;
    a = 10'b0101101111; b = 10'b0101101111; #30; 
    rst=0;
    #100;
 
    $finish;
    end
 endmodule
