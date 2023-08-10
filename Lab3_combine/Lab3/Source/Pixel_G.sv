module Pixel_G (
    input VGA_CLK,
    input reset_n,
    input [15:0]line_value, pixel_location,
    input  visible_region,
    output logic [7:0] VGA_R,VGA_G,VGA_B

);
//`include "parameter.vh"
parameter Active_Pixel =1280;

always_comb begin 
    if      ((pixel_location <   Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'hff0000;//Red
    else if ((pixel_location < 2*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'h00ff00;//Green
    else if ((pixel_location < 3*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'h0000ff;//Blue
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'hffffff;//White
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'h000000;//Black
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'hffff33;//yellow
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'hff00ff;//light purple
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region)
        {VGA_R, VGA_G, VGA_B} = 24'hff99cc;//pink
    else
        {VGA_R, VGA_G, VGA_B} = 24'h000000;   
end
endmodule