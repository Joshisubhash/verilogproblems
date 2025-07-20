module bcd_excess3_using_mux(exe,bcd);
input [3:0]bcd;
output reg [3:0]exe;

wire [2:0]sel = bcd[2:0]; 



always@(*)begin
if(bcd >=  10)begin
exe <= 4'bx;
end else begin
if(bcd[3]==0)begin
case(sel)
3'b000 : exe[3] <= bcd[3]; 
3'b001 : exe[3] <= bcd[3]; 
3'b010 : exe[3] <= bcd[3]; 
3'b011 : exe[3] <= bcd[3]; 
3'b100 : exe[3] <= bcd[3]; 
3'b101 : exe[3] <= ~bcd[3]; 
3'b110 : exe[3] <= ~bcd[3]; 
3'b111 : exe[3] <= ~bcd[3]; 
endcase
end else begin
case(sel)
3'b000 : exe[3] <= bcd[3]; 
3'b001 : exe[3] <= bcd[3]; 
endcase

end
 
end
end

always@(*)begin
if(bcd >= 10)begin
exe <= 4'bx;
end else begin
if(bcd[3]==0)begin
case(sel)
3'b000 : exe[2] <=  bcd[3]; 
3'b001 : exe[2] <= ~bcd[3]; 
3'b010 : exe[2] <= ~bcd[3]; 
3'b011 : exe[2] <= ~bcd[3]; 
3'b100 : exe[2] <= ~bcd[3]; 
3'b101 : exe[2] <=  bcd[3]; 
3'b110 : exe[2] <=  bcd[3]; 
3'b111 : exe[2] <=  bcd[3]; 
endcase
end else begin
case(sel)
3'b000 : exe[2] <= ~bcd[3]; 
3'b001 : exe[2] <= bcd[3]; 
endcase
end
end
end


always@(*)begin
if(bcd >= 10)begin
exe <= 4'bx;
end else begin
if(bcd[3]==0)begin
case(sel)
3'b000 : exe[1] <= ~bcd[3]; 
3'b001 : exe[1] <=  bcd[3]; 
3'b010 : exe[1] <=  bcd[3]; 
3'b011 : exe[1] <= ~bcd[3]; 
3'b100 : exe[1] <= ~bcd[3]; 
3'b101 : exe[1] <=  bcd[3]; 
3'b110 : exe[1] <=  bcd[3]; 
3'b111 : exe[1] <= ~bcd[3]; 
endcase
end else begin
case(sel)
3'b000 : exe[1] <= bcd[3]; 
3'b001 : exe[1] <= ~ bcd[3]; 
endcase
end
end
end


always@(*)begin
if(bcd >= 10)begin
exe <= 4'bx;
end else begin 
if(bcd[3]==0)begin
case(sel)
3'b000 : exe[0] <= ~bcd[3]; 
3'b001 : exe[0] <=  bcd[3]; 
3'b010 : exe[0] <= ~bcd[3]; 
3'b011 : exe[0] <=  bcd[3]; 
3'b100 : exe[0] <= ~bcd[3]; 
3'b101 : exe[0] <=  bcd[3]; 
3'b110 : exe[0] <= ~bcd[3]; 
3'b111 : exe[0] <=  bcd[3]; 
endcase
end else begin
case(sel)
3'b000 : exe[0] <= bcd[3]; 
3'b001 : exe[0] <= ~ bcd[3]; 
endcase
end
end
end

endmodule



//different approch
module bcd_to_excess3_mux (
    input [3:0] bcd,
    output reg [3:0] excess3
);

  wire [2:0] sel = bcd[2:0];    
  wire mux_group = bcd[3];     

always @(*) begin
    case (mux_group)
        1'b0: begin  
            case (sel)
                3'b000: excess3 = 4'b0011;  
                3'b001: excess3 = 4'b0100;  
                3'b010: excess3 = 4'b0101;  
                3'b011: excess3 = 4'b0110; 
                3'b100: excess3 = 4'b0111;  
                3'b101: excess3 = 4'b1000;  
                3'b110: excess3 = 4'b1001;  
                3'b111: excess3 = 4'b1010;  
            endcase
        end
        1'b1: begin  
            case (sel)
                3'b000: excess3 = 4'b1011; 
                3'b001: excess3 = 4'b1100;  
                default: excess3 = 4'b0000;  
            endcase
        end
    endcase
end

endmodule
