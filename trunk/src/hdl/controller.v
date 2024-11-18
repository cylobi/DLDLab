module Controller(input clk,
 				clkEn,
				rst,
				SerIn,
				Co1,
				Co2,
				CoD, 
				output reg Cnt1,
				Cnt2,
				CntD,
				ldcntD,
				Sh_enP,
				Sh_enD,
				SerOutValid,
	Done);
	parameter Idle = 3'b000,
	 		  red = 3'b001,
			  green = 3'b010,
		 	  transmit_Data = 3'b011,
			  Done_transmit = 3'b100;
			  
	reg [2:0] ps, ns;
	
	always @(ps, SerIn, Co1, Co2, CoD)begin
		case(ps)
		Idle: ns = (SerIn && serIn) ? Idle : red;
		red: ns = Co1 ? green : red;
		green: ns = Co2 ? transmit_Data : green;
		black: ns = SerIn ? Idle : red;
		default ns = Idle;
		endcase
	end


	always @(posedge clk, posedge rst)begin
		if (rst)
			ps <= Idle;
		else if (clkEn)
			ps <= ns;
	end
	assign ldcntD = Co2;
endmodule