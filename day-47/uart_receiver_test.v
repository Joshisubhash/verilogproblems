
//correct working
`timescale 1ns / 1ps

module uart_rx_tb();
//    parameter CLK_PERIOD = 20;       // 50 MHz clock (matches receiver)
//    parameter BAUD_RATE = 115200;
//    parameter BIT_PERIOD = 1000000000 / BAUD_RATE; // 8680ns
    parameter CLK_PERIOD = 20;       // 50 MHz clock (20ns period)
parameter BAUD_RATE = 9600;      // Desired baud rate
parameter BIT_PERIOD = 1000000000 / BAUD_RATE; // 104,166ns (1/9600)
    reg clk;
    reg rst;
    reg sin;
    wire flag;
    wire [7:0] out_data;
    
    reg [7:0] test_byte = 8'hA5;
    
    uart_receiver uut (
        .clk(clk),
        .rst(rst),
        .sin(sin),
        .flag(flag),
        .out_data(out_data)
    );
    
    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        sin = 1'b1;
        #100;
        rst = 1'b0;
        #100;
        
        // Send 0xA5 (LSB first: 1-0-1-0-0-1-0-1)
        sin = 1'b0; // Start
        #BIT_PERIOD;
        
        sin = 1'b1; // bit 0
        #BIT_PERIOD;
        sin = 1'b0; // bit 1
        #BIT_PERIOD;
        sin = 1'b1; // bit 2
        #BIT_PERIOD;
        sin = 1'b0; // bit 3
        #BIT_PERIOD;
        sin = 1'b0; // bit 4
        #BIT_PERIOD;
        sin = 1'b1; // bit 5
        #BIT_PERIOD;
        sin = 1'b0; // bit 6
        #BIT_PERIOD;
        sin = 1'b1; // bit 7
        #BIT_PERIOD;
        
        sin = 1'b1; // Stop
        #(BIT_PERIOD*2);
        
        if (flag && (out_data === 8'hA5)) begin
            $display("PASS: Received %h", out_data);
        end else begin
            $display("FAIL: Expected A5, got %h", out_data);
        end
        $finish;
    end
endmodule
