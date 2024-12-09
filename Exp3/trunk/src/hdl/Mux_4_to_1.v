module Mux_4_to_1 (
    input [1:0] portnum,
    input  SerIn,
    output reg p0,
    output reg p1,
    output reg p2,
    output reg p3
);

    always @(*) begin
        {p0,p1,p2,p3} = 4'b0000;
        if (portnum == 2'b00) 
            assign p0 = SerIn;
        else if (portnum == 2'b01) 
            assign p1 = SerIn;
        else if (portnum == 2'b10) 
            assign p2 = SerIn;
        else if (portnum == 2'b11) 
            assign p3 = SerIn;
    end
endmodule