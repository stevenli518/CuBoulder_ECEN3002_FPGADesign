
module VTC (
    input VGA_CLK,
    input reset_n,
    output VGA_HS,  VGA_VS,
    output [15:0]line_value, pixel_location,
    output visible_region,
    output VGA_BLANK_N, //tied High
    output VGA_SYNC_N   //tie low
);
`include "parameter.vh"
// Video period: Active_region + Front_Porch + Sync + Back_Porch 
logic [15:0]pixel_counter;
logic [15:0]line_counter;
logic H_visible,V_visible;

assign VGA_SYNC_N = 1'b0;
assign VGA_BLANK_N = 1'b1;

assign VGA_HS = (pixel_counter > Active_Pixel + H_Front_P-1'b1) & (pixel_counter<= Active_Pixel + H_Front_P + H_Sync_W);
assign VGA_VS = (line_counter > Active_Line + V_Front_P-1'b1) & (line_counter <= Active_Line + V_Front_P + V_Sync_W);

assign line_value = line_counter;
assign pixel_location = pixel_counter;

//assign H_visible = (pixel_counter > H_Back_P + H_Sync_W) && (pixel_counter < (Total_Pixels -1'b1 - H_Front_P))?1'b1:1'b0;
assign H_visible = ((pixel_counter >= 0) && (pixel_counter <Active_Pixel-1'b1))?1'b1:1'b0;
//assign V_visible =(line_counter > H_Back_P + H_Sync_W) && (line_counter < (Total_lines -1'b1 - V_Front_P))? 1'b1:1'b0;
assign V_visible = ((line_counter >= 0) && (line_counter < Active_Line -1'b1))?1'b1:1'b0;
assign visible_region = H_visible && V_visible;

always @(posedge VGA_CLK,negedge reset_n) begin
    if (reset_n == 0) begin
        pixel_counter <= 0;
        line_counter <=0;
    end
    else begin
        if (line_counter == Total_lines-1'b1 & pixel_counter == Total_Pixels-1'b1 )begin
            pixel_counter <= 0;
            line_counter <=0;
        end
        else if (pixel_counter == Total_Pixels-1'b1 )  begin
            if (line_counter < Total_lines-1'b1) begin
                 pixel_counter <=0;
                line_counter <= line_counter+1;
            end
           
        end
        else begin
            pixel_counter <= pixel_counter + 1'b1;
        end
    end
end
    
endmodule