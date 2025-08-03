
module sync_fifo_test();

         
reg clk;
 reg  rst;            
 reg  data_in;        
 reg  w_en,r_en;      
 wire empty,full;     
 wire data_out;   
 
 sync_fifo test (.clk(clk),.rst(rst),.data_in(data_in),.w_en(w_en),.r_en(r_en),.empty(empty),.full(full),.data_out(data_out));


initial clk= 0;
always #5 clk = ~clk;
 integer i;
 initial begin

 
      rst = 1;
        w_en = 0;
        r_en = 0;
        data_in = 0;

        #10 rst = 0; // Release reset after 10 ns

        // Test 1: Write 10 values
        $display("---- Writing 10 values ----");
        for (i = 0; i < 15; i = i + 1) begin
            @(posedge clk);
            data_in = i % 2;  
            w_en = 1; 
            #1;
            $display("Write cycle %0d: din = %b, full = %b, empty = %b", i, data_in, full, empty);
        end
    w_en=0;
        // Test 2: Read 10 values
        $display("---- Reading 10 values ----");
        for (i = 0; i < 15; i = i + 1) begin
            @(posedge clk);
            r_en = 1; 
            #1;
            $display("Read cycle %0d: dout = %b, full = %b, empty = %b", i, data_out, full, empty);
        end
        
        
      
        $display("---- Simulation Complete ----");
        $finish;
  
  
       
  $finish;
 end
 
 
 endmodule
