
`timescale 1 ns / 100 ps
module tb_Lab7();
    logic [2:0] KEY;
    logic CLOCK_50;
    logic		          		VGA_BLANK_N;
	logic		     [7:0]		VGA_B;
	logic		          		VGA_CLK;
	logic		     [7:0]		VGA_G;
	logic		          		VGA_HS;
	logic		     [7:0]		VGA_R;
	logic		          		VGA_SYNC_N;
	logic		          		VGA_VS;

Lab7 T1(.*);
always #10 CLOCK_50 = ~CLOCK_50;
    
initial begin
        KEY[0] = 0; CLOCK_50 = 0;
#100    KEY[0] = 1;
#17669999 ;
$stop;

end
endmodule