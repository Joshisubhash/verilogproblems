
  module fifo_test();
    reg push, pop;
    reg [7:0] datain;
    reg rst, clk;
    wire [7:0] out;
    wire full, empty;

    fifo uut (.out(out), .full(full), .empty(empty), .datain(datain), .rst(rst), .clk(clk), .push(push), .pop(pop));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        push = 0;
        pop = 0;
        datain = 0;
        #20;
        rst = 0;

        // Push 4 values
        push = 1;@(posedge clk);
        datain = 8'h0A; @(posedge clk);
        datain = 8'h0B; @(posedge clk);
        datain = 8'h0C; @(posedge clk);
        datain = 8'h0D; @(posedge clk);
        push = 0;

        // Pop values
      
        repeat(4) begin
          pop = 1;
            @(posedge clk);
              pop = 0;
            $display("Time=%0t OUT=%h FULL=%b EMPTY=%b", $time, out, full, empty);
        end
         

        #20 $finish;
    end
endmodule
