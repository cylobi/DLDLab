module Counter8bit (
    input clk,
    rst,
    output reg [7:0] par_out
);
  always @(posedge clk, posedge rst) begin
    if (rst) par_out <= 0;
    else if (clk)
      par_out = par_out + 1;
  end

endmodule

