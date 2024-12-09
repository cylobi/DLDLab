module PWM (
    input clk,
    rst,
    inc,
    input[7:0] par_in
    output reg par_out
);
  reg count;
  always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (clk)
      count = count + 1;
    else if(par_in> count)
      par_out = 1'b1;
    else if(par_in < count)
      par_out = 1'b0;

  end
endmodule

