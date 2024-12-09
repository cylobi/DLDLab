module Counter8bit (
    input clk,
    rst,
    input[7:0] par_in
    output[7:0] reg par_out
);
  reg count;
  always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (clk)
      count = count + 1;
  end

  assign par_out = count;
endmodule

