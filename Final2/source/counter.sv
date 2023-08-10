module counter (input clk, reset_n, output [9:0] q);

logic [27:0] count;

always_ff @ (posedge clk, negedge reset_n)
    if (reset_n == 1'b0)
        count <= 0;
    else
        count <= count + 1'b1;

assign q = count [27:18];

endmodule