
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Homework9(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR
);

assign LEDR[8] = 1'b0;

//=======================================================
//  REG/WIRE declarations
//=======================================================
PIO U1 (.clk_clk(CLOCK_50),.pio_0_ec_export(LEDR[7:0]),.pio_1_ec_export(LEDR[9]),.pio_2_ec_export(SW));


//=======================================================
//  Structural coding
//=======================================================



endmodule
