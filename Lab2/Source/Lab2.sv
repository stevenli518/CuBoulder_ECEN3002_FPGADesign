module Lab2 (
    input [2:0] KEY,
    input CLOCK_50,
    input [9:0] SW,
    output [9:0] LEDR
);

logic ISSP_reverse,ISSP_preload,ISSP_reset_n ;
logic [9:0] ISSP_SW;

logic ext_reset_n, reset_n;
logic reverse_combine,preload_combine;
logic [9:0]SW_input_combine;

assign  ext_reset_n = KEY[0]&ISSP_reset_n;
assign  preload_combine = KEY[1] &ISSP_preload;
assign reverse_combine = KEY[2] & ISSP_reverse;
assign SW_input_combine = SW | ISSP_SW;
reset R0 (.clock(CLOCK_50),.ext_reset_n,.pll_locked(1'b1),.reset_n) ;

counter C0 (.clock_in(CLOCK_50),.reset_n,.SW_input(SW_input_combine),.KEY({reverse_combine,preload_combine}),.counter(LEDR));

ISSP_PushB I0 (.source ({ISSP_reverse,ISSP_preload,ISSP_reset_n}),.probe(KEY[2:0]));

ISSP_SW I1(.source(ISSP_SW),.probe(SW));


endmodule