module Pixel_G (
    input VGA_CLK,
    input reset_n,
    input [15:0]line_value, pixel_location,
    input  visible_region,
    output logic [7:0] VGA_R,VGA_G,VGA_B,
    output signed  [47:0] test
);
//`include "parameter.vh"
logic signed  test1 ;
parameter Active_Pixel =1280;
assign test = 48'hffffff333333;
assign test1 = test <<<24;
always_ff @( posedge VGA_CLK,negedge reset_n ) begin 
    if (reset_n == 0)
        begin
            VGA_R = 8'h00;  // Black
            VGA_G = 8'h00;
            VGA_B = 8'h00;
        end
    else if (visible_region && (pixel_location < (Active_Pixel/3)))begin
            VGA_R = 8'h00;  //Blue
            VGA_G = 8'h00;
            VGA_B = 8'hff;
     end
    else if (visible_region &&  (pixel_location <= (Active_Pixel*(2/3))))begin
            VGA_R = 8'hff;  //Red
            VGA_G = 8'h00;
            VGA_B = 8'h00;
    end
    else if (visible_region && ( pixel_location <= (Active_Pixel*1)))begin
            VGA_R = 8'h00;  //Green
            VGA_G = 8'hff;  
            VGA_B = 8'h00;
    end
//     else if (visible_region && pixel_location > Active_Pixel*(3/8) && pixel_location <= Active_Pixel*(4/8))begin
//             VGA_R = 8'h00;  //Blue
//             VGA_G = 8'h00;
//             VGA_B = 8'hff;
//     end
//     else if (visible_region && pixel_location > Active_Pixel*(4/8) && pixel_location <= Active_Pixel*(5/8))begin
//             VGA_R = 8'h99;  //Purple
//             VGA_G = 8'h00;
//             VGA_B = 8'h99;
//     end
//     else if (visible_region && pixel_location > Active_Pixel*(5/8) && pixel_location <= Active_Pixel*(6/8))begin
//             VGA_R = 8'h66;  //Light Green
//             VGA_G = 8'hff;
//             VGA_B = 8'h66;
//     end
//     else if (visible_region && pixel_location > Active_Pixel*(6/8) && pixel_location <= Active_Pixel*(7/8))begin
//             VGA_R = 8'hff;  //Orange
//             VGA_G = 8'h80;
//             VGA_B = 8'h00;
//     end
//     else if (visible_region && pixel_location > Active_Pixel*(7/8) && pixel_location <= Active_Pixel)begin
//             VGA_R = 8'h66;  //Cyan
//             VGA_G = 8'h00;
//             VGA_B = 8'hff;
//     end
    else begin
            VGA_R = 8'h00;
            VGA_G = 8'h00;
            VGA_B = 8'h00;
    end
end
endmodule