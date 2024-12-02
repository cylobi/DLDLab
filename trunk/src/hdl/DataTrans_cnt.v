module DataTrans_cnt(
  input clk,
    clkEn,
    rst,
    ldcntD,
    CntD,
  input [3:0] NumData,
	output CoD,
  output reg [3:0] count);
 

	always@(posedge clk, posedge rst)begin
		if (rst)
			count <= 4'b1111;
		else if(clkEn && ldcntD)
				  count <= NumData;
		else if(CntD)
			count = count - 1'b1;
	end
	assign CoD = (count == 4'b0001) ? 1'b1 : 1'b0;
endmodule