
module threestatefsm_test();

reg in;
reg rst,clk;

wire [1:0]out;

threestatefsm test(.in(in),.rst(rst),.clk(clk),.out(out));

parameter [1:0] s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0]expected_out;
reg [1:0]state;


always@(posedge clk)begin
if(rst)begin
expected_out <= 0;
state <= 0;
end else begin
if(in == 1)begin
case(state)
2'b00 : begin
       expected_out <= s0; 
        state <= 2'b01;
        end
2'b01 : begin          
        expected_out <= s1;     
         state <= 2'b10;
        end             
2'b10 : begin          
     expected_out <= s2;     
       state <= 2'b00;
       end            
endcase

end

end

end

initial clk=0;
always #5 clk= ~clk;



initial begin
rst = 1;
#20;
rst = 0;

//#1 
in = 1;
repeat (4) @(posedge clk);
//#1 
in = 0;
repeat (3) @(posedge clk);

//#1;
in = 1;
//#1 
rst =1;
repeat (2) @(posedge clk);
//#1 
rst = 0;
#100;
 
 $finish;

end
 

always@(posedge clk)begin
if(out != expected_out)begin
$display("%d | %d",out,expected_out);
end
end

endmodule
 
