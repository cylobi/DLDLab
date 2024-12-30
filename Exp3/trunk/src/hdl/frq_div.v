module frq_div (
    input clk,
    input rst,
    input SW[2:0],
    input ld,
    output reg co
);
  reg [8:0] count;
  always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (ld)
        count = {0'b1, SW, 5'b0};
    else if (clk)
      count = count + 1;
  end

  assign co = (count == 9'b111111111) ? 1'b1 : 1'b0;
endmodule