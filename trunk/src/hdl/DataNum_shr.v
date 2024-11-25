module DataNum_shr (
    input clk,
    rst,
    clkEn,
    serIn,
    sh_enD,
    output reg [3:0] NumData
);

  always @(posedge clk, posedge rst) begin
    if (rst) NumData <= 0;
    else if (clkEn && sh_enD)
      NumData <= {NumData[2:0], serIn};
  end
	
endmodule