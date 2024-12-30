module Counter6Bit (
    input clk,
    rst,
    output [5:0] par_out
);
  reg [5:0] count;
  always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (clk)
      count = count + 1;
  end

  assign par_out = count;
endmodule

