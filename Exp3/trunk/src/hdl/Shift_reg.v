module Shift_reg (
    input clk,
    input rst,
    input [7:0] in,
    input shift,
    input ld,
    output reg [7:0] out
);

  always @(posedge clk, posedge rst) begin
    if (rst) NumData <= 0;
    else if (shift)
      out <= {out[2:0], 1'b0};
    else if (ld)
      out <= in;
  end
endmodule