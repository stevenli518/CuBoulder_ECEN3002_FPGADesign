module Pixel_G (
    input VGA_CLK,
    input reset_n,
    input [15:0]line_value, pixel_location,
    input  visible_region,
    output logic [7:0] VGA_R,VGA_G,VGA_B

);
//`include "parameter.vh"
logic [15:0]address;
logic [23:0] q;
ROM	U4(.address,.clock(VGA_CLK),.q);
parameter Active_Pixel =1280;
assign {VGA_R, VGA_G, VGA_B} = visible_region? q:24'b0;

assign address =(pixel_location>>2) + (line_value>>2)*320;
// always_comb begin 
//     if (visible_region == 1)
//         address =(pixel_location>>2) + ((line_value>>2)*320);
//     else 
//         address = 0;
// end
    
    


endmodule