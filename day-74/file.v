


//### **Day 4: 3-State FSM**

//**Design Spec:**

//* States: `S0 → S1 → S2 → S0`
//* Inputs: `clk, rst`
//* Output: `state[1:0]`

//**Testbench Requirements:**

//* Apply clock and reset.
//* Verify all state transitions.
//* Self-check: maintain an `expected_state` variable in TB.

module threestatefsm(out,clk,rst,in);
input wire in;
input wire clk,rst;

output reg [1:0]out;


parameter [1:0] s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0] state;

always@(posedge clk)begin
if(rst)begin
out <= 0;
state <= 0;
end else begin
if(in == 1)begin
case(state)
2'b00 : begin
        out <= s0; 
        state <= 2'b01;
        end
2'b01 : begin          
        out <= s1;     
         state <= 2'b10;
        end             
2'b10 : begin          
       out <= s2;     
       state <= 2'b00;
       end            
endcase

end

end

end

endmodule
