module Mux_2_to_1_8bit
(
    input SM,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out
);
    assign out = (SM) ? b : a ;
endmodule