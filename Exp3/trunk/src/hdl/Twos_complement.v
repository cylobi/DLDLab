module Twos_complement
(
    input[5:0] a,
    output [5:0] out
);
  assign out = ~a + 6'd1;
endmodule