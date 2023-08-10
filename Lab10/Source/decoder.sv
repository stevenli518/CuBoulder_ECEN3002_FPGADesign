module decoder(
    input [3:0] birth,
    output reg [6:0] HEX
);

always @(birth)
begin
    case(birth)
        4'b0000: HEX = 7'b100_0000;    //0
        4'b0001: HEX = 7'b111_1001;    //1
        4'b0010: HEX = 7'b010_0100;    //2
        4'b0011: HEX = 7'b011_0000;    //3
        4'b0100: HEX = 7'b001_1001;    //4
        4'b0101: HEX = 7'b001_0010;    //5 
        4'b0110: HEX = 7'b000_0010;    //6
        4'b0111: HEX = 7'b111_1000;    //7
        4'b1000: HEX = 7'b000_0000;    //8
        4'b1001: HEX = 7'b001_1000;    //9
       
        default HEX= 7'b111_1111;
    endcase
    
end


endmodule