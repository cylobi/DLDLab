module Shift_reg (
    input clk,
    input rst,
    input [4:0] in,
    input shift,
    input ld,
    output reg [8:0] out
);

  always @(posedge clk, posedge rst) begin
    if (rst) out <= 8'b0;
    else if (shift)
      out <= {out[7:0], 1'b0};
    else if (ld)
      out <= {3'b0101,in};
  end

endmodule