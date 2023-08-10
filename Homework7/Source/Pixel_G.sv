module Pixel_G (
    input VGA_CLK,
    input reset_n,
    input [15:0]line_value, pixel_location,
    input  visible_region,
    output logic [7:0] VGA_R,VGA_G,VGA_B

);
//`include "parameter.vh"
logic [7:0]address;
logic [23:0] q;
ROM	U4(.address,.clock(VGA_CLK),.q);
parameter Active_Pixel =1280;
assign {VGA_R, VGA_G, VGA_B} = q;
always_comb begin 
    if      ((pixel_location <   Active_Pixel/8) && visible_region)
        
        address = 0 ;
    else if ((pixel_location < 2*Active_Pixel/8) && visible_region)
        
        address = 8;
    else if ((pixel_location < 3*Active_Pixel/8) && visible_region)
        
        address =16;
    else if ((pixel_location < 4*Active_Pixel/8) && visible_region)
       
        address = 24;
    else if ((pixel_location < 5*Active_Pixel/8) && visible_region)
        
        address = 32;
    else if ((pixel_location < 6*Active_Pixel/8) && visible_region)
        
        address = 40;
    else if ((pixel_location < 7*Active_Pixel/8) && visible_region)
        
        address = 48;
    else if ((pixel_location < 8*Active_Pixel/8) && visible_region)
        
        address = 56;
    else
        //{VGA_R, VGA_G, VGA_B} = 24'h000000;  
        address = 56; 
end
endmodule