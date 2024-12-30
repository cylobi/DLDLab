module Counter10bit (
    input clk,
    input rst,
    input cnt,
    output reg co
);
  reg [9:0] count;
  always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (cnt)
      count = count + 1;
  end

  assign co = (count == 10'b1111111111) ? 1'b1 : 1'b0;
endmodule

