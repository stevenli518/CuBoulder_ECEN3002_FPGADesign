module counter (
    input clock_in, reset_n,
    input [9:0] SW_input,
    input reverse_combine, preload_combine,
    output [9:0] counter
);
 logic [32:0] counter_output;
assign counter[9:0] =  counter_output[32:23];
always_ff @( posedge clock_in,negedge reset_n ) begin 
    begin
        if (reset_n == 0) 
            begin
                counter_output <= 0;
            end
        else if (preload_combine== 0 )
            begin
                counter_output<= {SW_input,23'b0};
            end
        else if (reverse_combine == 0)
            begin
                counter_output<= counter_output-1;
            end
        else    
            begin
                counter_output <= counter_output +1;            
            end
    end
end

endmodule