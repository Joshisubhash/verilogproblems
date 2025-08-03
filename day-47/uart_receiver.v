 
 module uart_receiver(flag,out_data,rst,clk,sin);
 
 input wire sin;
 input rst,clk;
 
 output reg flag;
 output reg [7:0]out_data;
 
 reg [3:0]state;
 reg [3:0] tick_count=0;
 reg [8:0]clk_count=0;
 reg tick=0;
 reg [7:0]shift_reg;
 reg [2:0]index=0;
 
 parameter sys_freq = 50000000;
 parameter baud_rate = 9600;
 parameter oversample = 16;
 
// parameter baud_div = sys_freq / (baud_rate*oversample);
  
  parameter baud_div   = (sys_freq + (baud_rate * oversample / 2)) / (baud_rate * oversample); 
 reg [2:0] sin_sync;
    
    // Input synchronization
    always @(posedge clk) begin
        sin_sync <= {sin_sync[1:0], sin};
    end
 
always@(posedge clk)begin
if(rst)begin
   state <= 0;
    flag <= 0;
    tick_count <= 0;
    clk_count <= 0;
    shift_reg <= 0;
    index <= 0;
    out_data <= 0;
end else begin
 
 if (state != 0) begin
        flag <= 1'b0;
      end
case(state)
            0: begin // IDLE
                if(!sin_sync[2]) begin
                    state <= 1;
                    tick_count <= 0;
                    clk_count <= 0;
                end
            end
            
            1: begin // START
                if(clk_count == baud_div-1) begin
                    clk_count <= 0;
                    if(tick_count == 7) begin  // Sample at midpoint
                        state <= (!sin_sync[2]) ? 2 : 0;
                    end
                    tick_count <= tick_count + 1;
                end else begin
                    clk_count <= clk_count + 1;
                end
            end
            
            2: begin // DATA
                if(clk_count == baud_div-1) begin
                    clk_count <= 0;
                    if(tick_count == 15) begin  // Sample at bit end
                    tick_count <=0 ;
                      shift_reg <= {sin_sync[2], shift_reg[7:1]};   
                        if(index == 7) begin
//                            out_data <= {shift_reg[6:0], sin_sync[2]};
                            state <= 3;
                            index <= 0;
                        end else begin
                            index <= index + 1;
                        end
                    end
                    tick_count <= tick_count + 1;
                end else begin
                    clk_count <= clk_count + 1;
                end
            end
            
            3: begin // STOP
                if(clk_count == baud_div-1) begin
                    clk_count <= 0;
                  if(tick_count == 15) begin  
                    out_data <= shift_reg;
                        flag <= (sin_sync[2] == 1'b1);
                        state <= 0;
                    end
                    tick_count <= tick_count + 1;
                end else begin
                    clk_count <= clk_count + 1;
                end
            end
        endcase
    end


end
endmodule 
