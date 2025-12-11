   //day-72
//**Design Spec:**

//* Inputs: `d, clk, rst` (active high async reset)
//* Output: `q`

//**Testbench Requirements:**

//* Test cases: reset active, reset release, d=0, d=1.
//* Check q updates only on `posedge clk`.
//* Insert random delays for d to test hold/propagation.

module d_ff_tbfunction_test();
 
  reg d;
  wire q, qb;
  reg rst, clk;
 
  reg testq;
  wire testqb;  
  d_ff_tbfunction dut_instance (
      .d(d),
      .q(q),
      .qb(qb),
      .rst(rst),
      .clk(clk)
  );
 
  assign testqb = ~testq;

  always @(posedge clk) begin
    if (rst) begin
      testq <= 1'b0;
    end else begin
      testq <= d;
    end
  end
 
  initial clk = 1'b0;
  always #5 clk = ~clk;
initial begin
  d = 0;
  testq = 0;
end

 
  initial begin
    $display("Time\tD\tRST\tExpected Q\tActual Q");
    $monitor("%d\t%b\t%b\t%b\t\t%b", $time, d, rst, testq, q);
 
    rst = 1'b1;  
    #20;
    rst = 1'b0;  
//here these #1 is most important part , without this testq at rst=0, it will be x
    @(posedge clk) #1d = 1'b1;
    @(posedge clk) #1d = 1'b0;
    @(posedge clk) #1d = 1'b1;
    @(posedge clk) #1d = 1'b0;
    @(posedge clk) #1d = 1'b1;
    @(posedge clk) #1d = 1'b0;
    
    #20;
    $finish;
  end
 
  always @(posedge clk) begin
    if (q !== testq) begin
      $display("Mismatch detected at time %0d", $time);
      $display("  Expected Q: %b, Actual Q: %b", testq, q);
    end
  end
endmodule

