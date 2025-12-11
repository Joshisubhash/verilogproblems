
 
//**Design Spec:**

//* Inputs: `d, clk, rst` (active high async reset)
//* Output: `q`

//**Testbench Requirements:**

//* Test cases: reset active, reset release, d=0, d=1.
//* Check q updates only on `posedge clk`.
//* Insert random delays for d to test hold/propagation.
 
 
 module d_ff_tbfunction (
    input wire d,
    input wire rst,
    input wire clk,
    output wire qb,
    output reg q
);

  assign qb = ~q;

  always @(posedge clk) begin
    if (rst) begin
      q <= 1'b0;
    end else begin
      q <= d;
    end
  end
endmodule


