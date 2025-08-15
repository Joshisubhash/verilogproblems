
module lifo_test();

 reg push,pop;
 reg [7:0]datain;
// reg w_en,r_en;
 reg rst,clk;
 wire [7:0]out;
 wire full;
 wire empty;
 
 integer i;
lifo test(.out(out),.full(full),.empty(empty),.datain(datain),.w_en(w_en),.r_en(r_en),.rst(rst),.clk(clk)
,.push(push),.pop(pop)
); 
 
 
 initial clk =0;
 always #5 clk = ~clk;
 
 
 initial begin
    
        rst = 1;
        push = 0; pop = 0; w_en = 0; r_en = 0;
        datain = 0;
        #15 rst = 0;

        
       w_en = 1; push = 1; pop = 0;
       datain = 8'h0A; #10;
       datain = 8'h0B; #10;
       datain = 8'h0C; #10;
       datain = 8'h0D; #10;
       w_en = 0; push = 0;

  
       r_en = 1; pop = 1;
       #40;
       r_en = 0; pop = 0;
        
    w_en = 1;
     push = 1; pop = 0;
     for(i=0;i<20;i=i+1)begin
     @(posedge clk)
     datain = i;
     end
     #10;
      w_en = 0; r_en = 1; 
      push = 0; pop = 1;
      #100;
        #200 $finish;
    end

    always @(posedge clk) begin
        $display("T=%0t  | out=%h | full=%b | empty=%b", 
                  $time, out, full, empty);
  
 end
  
 endmodule
