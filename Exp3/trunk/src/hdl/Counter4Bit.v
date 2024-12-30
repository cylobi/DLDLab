module Counter4bit (
    input clk,
    input rst,
    input cnt,
    output reg co
);
  reg [3:0] count;
  always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (cnt)
      count = count + 1;
  end

  assign co = (count == 4'd9) ? 1'b1 : 1'b0;
endmodule

