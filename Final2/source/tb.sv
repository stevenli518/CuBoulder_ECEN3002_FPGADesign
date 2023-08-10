`timescale 1 ns / 100 ps
module tb();

logic CLOCK_50;
logic [1:0] KEY;
logic [9:0] LEDR;
logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX0;

Final_3002 DUT (.*);
always #10 CLOCK_50 =~CLOCK_50;
initial begin
    CLOCK_50 = 1'b1;  
    KEY = 2'b00;
    #20 KEY = 2'b11;
    #2_000_000_0 $stop;
end

endmodule
