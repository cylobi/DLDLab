module Mux_2_to_1_1bit
(
    input sel,
    input a,
    input b,
    output out
);
    assign out = (sel) ? b : a ;
endmodule