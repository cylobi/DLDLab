module PWM (
    input clk,
    rst,
    input[7:0] par_in,
    output par_out
);
  Counter8bit counter(
    .clk(clk),
    .rst(rst),
    .par_out(count)
  );

  assign par_out = (par_in > count) ? 1'b1 : 1'b0;
endmodule

