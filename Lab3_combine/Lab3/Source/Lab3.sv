module Lab3 (
    input CLOCK_50,
	input [2:0] KEY,
    output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS

);

logic reset_n, visible_region,locked,ext_reset_n;
logic [15:0] line_value, pixel_location ;

assign ext_reset_n = KEY[0];

VTC U0(.VGA_CLK(VGA_CLK),.reset_n(reset_n),.VGA_HS(VGA_HS),.VGA_VS(VGA_VS),.line_value(line_value),.pixel_location(pixel_location),.visible_region(visible_region),.VGA_BLANK_N(VGA_BLANK_N),.VGA_SYNC_N(VGA_SYNC_N));
video_pll U1 (.refclk(CLOCK_50),.rst(1'b0),.outclk_0(VGA_CLK),.locked);
reset U2 (.reset_n,.clock(CLOCK_50),.ext_reset_n,.pll_locked(1'b1));
Pixel_G U3(.*);
//Pixel_G U3 (.VGA_CLK(VGA_CLK),.reset_n(reset_n),.line_value(line_value),.pixel_location(pixel_location),.visible_region(visible_region),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));
endmodule