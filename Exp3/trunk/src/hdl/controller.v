module Controller(input clk,
 				clkEn,
				rst,
				serIn,
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
				Done
				);
				
	parameter Idle = 3'b000,
	 		  red = 3'b001,
			  green = 3'b010,
		 	  black = 3'b011;
			  
	reg [2:0] ps, ns;
	
	always @(ps, serIn, Co1, Co2, CoD)begin
		case(ps)
		Idle: ns = serIn ? Idle : red;
		red: ns = Co1 ? green : red;
		green: ns = Co2 ? black : green;
		black: ns = CoD ? Idle : black;
		default ns = Idle;
		endcase
	end

	always @(ps)begin
		{Cnt1, Cnt2, CntD, ldcntD, Sh_enP, Sh_enD, SerOutValid, Done} = 8'b00000000;
		case(ps)
		Idle: Done = 1'b1;
		red: {Cnt1,Sh_enP} = 2'b11 ;
		green: {Cnt2,Sh_enD,ldcntD} = 3'b111;
		black: {CntD,SerOutValid} = 2'b11;
		endcase
	end


	always @(posedge clk, posedge rst)begin
		if (rst)
			ps <= Idle;
		else if (clkEn)
			ps <= ns;
	end
endmodule