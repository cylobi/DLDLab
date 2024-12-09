module Mux_2_to_1 
(
    input SM,
    input [5:0] a,
    input [5:0] b,
    output [5:0] out
);
    assign out = (SM) ? b : a ;
endmodule