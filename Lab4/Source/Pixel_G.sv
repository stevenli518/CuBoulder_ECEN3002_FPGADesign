module Pixel_G (
    input VGA_CLK,
    input reset_n,
    input [15:0]line_value, pixel_location,
    input  visible_region,
    output logic [7:0] VGA_R,VGA_G,VGA_B

);
//`include "parameter.vh"
parameter Active_Pixel =1920;
parameter Active_Line = 1080 ;
parameter  COLOR1= 24'hff0000;//RED
parameter  COLOR2= 24'h00ff00;//GREEN
parameter  COLOR3= 24'h0000ff;//BLUE
parameter  COLOR4= 24'hffffff;//White
parameter  COLOR5= 24'hffff33;//YELLOW
parameter  COLOR6= 24'hff00ff;//Purple
parameter  COLOR7= 24'hff99cc;//Pink
parameter  COLOR8= 24'h000000;//BLACK
always_comb begin 
    if      ((line_value < Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000;  
    end
    else if ((line_value <2* Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else if ((line_value < 3*Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else if ((line_value <4* Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else if ((line_value < 5*Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else if ((line_value < 6*Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else if ((line_value <7* Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else if ((line_value < 8*Active_Line/8) && visible_region)begin
        if      ((pixel_location <   Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR8;
        else if ((pixel_location < 2*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR1;
        else if ((pixel_location < 3*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR2;
        else if ((pixel_location < 4*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR3;
        else if ((pixel_location < 5*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR4;
        else if ((pixel_location < 6*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR5;
        else if ((pixel_location < 7*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR6;
        else if ((pixel_location < 8*Active_Pixel/8) && visible_region) {VGA_R, VGA_G, VGA_B} = COLOR7;
        else    {VGA_R, VGA_G, VGA_B} = 24'h000000; 
    end
    else
        {VGA_R, VGA_G, VGA_B} = 24'h000000;   
end
endmodule