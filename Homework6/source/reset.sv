module reset (clock, ext_reset_n, lock, reset_n);
input clock, ext_reset_n, lock;
output logic reset_n;

logic q0, q1;
logic asynch_reset_n;

assign asynch_reset_n  = ext_reset_n & lock;

always_ff @ (posedge clock, negedge asynch_reset_n)
    if (asynch_reset_n == 1'b0)
        begin
            q0 <= 1'b0;
            q1 <= 1'b0;
            reset_n <= 1'b0;
        end
    else
        begin
            q0 <= 1'b1;
            q1 <= q0;
            reset_n <= q1;
        end 

endmodule