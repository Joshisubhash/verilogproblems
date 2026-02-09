
//**Design Spec:**

//* Inputs: `clk, rst`
//* Output: `count[3:0]` (counts 0→9 then wraps).

//**Testbench Requirements:**

//* Verify sequence: 0 → 1 → … → 9 → 0.
//* Test reset in middle of count.
//* Run for at least 30 cycles.

//---

module mod_10counter_tbfunction(out,rst,clk);
input wire rst,clk;
output reg [3:0]out;

always@(posedge clk)begin
if(rst)begin
out <= 0;
end else begin
out <= out + 1'b1;
if(out == 9)begin
out <= 0;
end
end

end
 
endmodule


