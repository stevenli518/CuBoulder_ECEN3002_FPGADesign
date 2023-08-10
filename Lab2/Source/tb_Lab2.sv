`timescale 1 ns / 100 ps
module tb_Lab2 ( 
);
    logic  [2:0] KEY;
    logic CLOCK_50;
    logic [9:0] SW;
    logic [9:0] LEDR;  


Lab2 T1 (.*);

always #10 CLOCK_50 =~CLOCK_50;

initial begin
    KEY[0] = 0;KEY[1]=1;KEY[2]=1;
    CLOCK_50 = 0;
    SW = 0;
    #20 KEY[0]=1;

    #2000 ;
    #20000 SW =10'b 0_000_111__111 ; KEY[1]=0;
    #2000 KEY[1] = 1;
    #2_000_000_0 KEY[2]=1;
    $stop;
end

endmodule