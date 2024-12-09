module TwosComplement8Bit
(
    input[7:0] a,
    output [7:0] out
);
  assign out = ~a + 8'd1;
endmodule