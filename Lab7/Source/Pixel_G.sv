module Pixel_G (
    input VGA_CLK,
    input reset_n,
    input [15:0]line_value, pixel_location,
    input  visible_region,
    output logic [7:0] VGA_R,VGA_G,VGA_B

);
//`include "parameter.vh"
logic [17:0]address;
logic [11:0] q;
ROM	U4(.address,.clock(VGA_CLK),.q);
parameter Active_Pixel =1280;
//assign {VGA_R, VGA_G, VGA_B} = visible_region? q:12'b0;
assign VGA_R[7:4] = visible_region?q[11:8]:4'b0;
assign VGA_G[7:4] = visible_region?q[7:4]:4'b0;
assign VGA_B[7:4] = visible_region?q[3:0]:4'b0;
assign address =(pixel_location>>1) + (line_value>>1)*640;

    
    


endmodule