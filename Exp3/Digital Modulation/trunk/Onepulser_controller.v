module Onepulser_contoller(
	input clk,
	clkPB,
	rst,
	output reg clkEN
);
parameter A = 2'd0, B = 2'd1, C = 2'd2; 

reg[1:0] ps, ns;

always @(*) begin
	case (ps)
		A: ns = clkPB ? B : A;
		B: ns = C;
		C: ns = clkPB ? C : A;
	endcase
end

always @(*) begin
	clkEN = 1'b0;
	case (ps)
		B: clkEN = 1'b1;
	endcase
end

always @(posedge clk, posedge rst)
		if (rst)
			ps <= A;
		else
			ps <= ns;
	
endmodule