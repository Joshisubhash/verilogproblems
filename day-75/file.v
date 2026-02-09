

//### **Day 6: Single-Port RAM (16x8)**

//**Design Spec:**

// Inputs: `clk, we, addr[3:0], din[7:0]`
// Output: `dout[7:0]`

//Testbench Requirements:**

// Write random values into all addresses.
// Read back values, compare with expected array in TB.
// Check reset clears memory (if implemented).

//---

module single_port_ram#(parameter n =4,m=16)(clk,rst,w_en,r_en,addr,din,dout);

input wire clk,rst;
input wire w_en,r_en;
input wire [n-1:0]addr;
input wire [n-1:0]din;
output reg [n-1:0]dout;

reg [m-1:0]mem[0:m-1];

always@(posedge clk)begin
if(rst)begin
dout <= 0;
end else begin
if(w_en && r_en == 0)begin
mem[addr] <= din;
end 
else if(r_en && w_en == 0)begin
dout <= mem[addr];
end else begin

end

end
end

endmodule
