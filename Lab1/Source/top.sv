module top (
    input [3:0] KEY,
    input CLOCK_50,
    input [9:0] SW,
    output [9:0] LEDR
);
logic reset_n ;
//logic clock_out;

assign reset_n= KEY[0];

//clock_divider  #(5_000_000) F5hz (.reset_n(reset_n),.clock_in(CLOCK_50),.clock_out(clock_out));
counter C0 (.clock_in(CLOCK_50),.reset_n(reset_n),.SW_input(SW),.KEY(KEY),.counter(LEDR));


endmodule