`timescale 1 ns / 100 ps
module tb_Lab10();

	//////////// CLOCK //////////
	logic 		          		CLOCK2_50;
	logic 		          		CLOCK3_50;
	logic 		          		CLOCK4_50;
	logic 		          		CLOCK_50;

	//////////// KEY //////////
	logic 		     [3:0]		KEY;

	//////////// SW //////////
	logic 		     [9:0]		SW;

	//////////// LED //////////
	logic		     [9:0]		LEDR;

	//////////// Seg7 //////////
	logic		     [6:0]		HEX0;
	logic		     [6:0]		HEX1;
	logic		     [6:0]		HEX2;
	logic		     [6:0]		HEX3;
	logic		     [6:0]		HEX4;
	logic		     [6:0]		HEX5;

	//////////// ADC //////////
	logic		          		ADC_CONVST;
	logic		          		ADC_DIN;
	logic 		          		ADC_DOUT;
	logic		          		ADC_SCLK;

Lab10 T1(.*);
always #10 CLOCK_50 = ~CLOCK_50;
    
initial begin
        KEY[0] = 0; CLOCK_50 = 0;
#100    KEY[0] = 1;
#1000000 ;
$stop;

end
endmodule