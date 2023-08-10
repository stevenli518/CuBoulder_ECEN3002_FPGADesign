module clock_divider(
    input clock_in, reset_n,
    output logic clock_out
    
);

logic [23:0] clock_divider;

parameter divide_by = 0;

always_ff @(posedge clock_in,negedge reset_n)
begin
    if(~reset_n)
        begin
            clock_out = 0;
            clock_divider = 0;
        end
     else
        begin
            if(clock_divider != divide_by-1)begin
               clock_divider <= clock_divider+1; 
            end
            else begin
                clock_divider <= 0;
                clock_out = ~clock_out;
            end    
        end   
end

endmodule