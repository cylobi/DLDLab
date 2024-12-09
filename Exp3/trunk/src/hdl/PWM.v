module PWM (
    input clk,
    rst,
    input[7:0] par_in
    output reg par_out
);
  reg out;

  Counter8bit counter(
    .clk(clk),
    .rst(rst),
    .par_out(count)
  );

  always @(posedge clk, posedge rst) begin
    if (rst) out <= 0;
    else if (clk)
      if(par_in> count)
        par_out = 1'b1;
      else if(par_in < count)
        par_out = 1'b0;
  end
endmodule

