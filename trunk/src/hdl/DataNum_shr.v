module DataNum_Shr (
    input clk,
    rst,
    clkEn,
    serIn,
    sh_enD,
    output reg [3:0] NumData
);

  always @(posedge clk, posedge rst) begin
    if (rst) NumData <= 0;
    else if (clkEn && Sh_enD)
      NumData <= {NumData[2:0], SerIn};
  end
	
endmodule