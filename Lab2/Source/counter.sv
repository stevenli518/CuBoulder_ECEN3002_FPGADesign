module counter (
    input clock_in, reset_n,
    input [9:0] SW_input,
    input [2:1] KEY,
    output [9:0] counter
);
 logic [31:0] counter_output;
assign counter[9:0] =  counter_output[31:22];

always_ff @( posedge clock_in,negedge reset_n ) begin 
    begin
        if (reset_n == 0) 
            begin
                counter_output <= 0;
            end
        else if (KEY[1] == 0 )
            begin
                counter_output<= {SW_input,22'b0};
            end
        else if (KEY[2]==0)
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