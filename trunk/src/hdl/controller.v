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
<<<<<<< HEAD
	Done);
				
=======
				Done);

>>>>>>> 8ccefbfe8bc01f6b3b06a24cbf3755af2f7f5709
	parameter Idle = 3'b000,
	 		  red = 3'b001,
			  green = 3'b010,
		 	  black = 3'b011;
			  
	reg [2:0] ps, ns;
	
	always @(ps, SerIn, Co1, Co2, CoD)begin
		case(ps)
		Idle: ns = SerIn ? Idle : red;
		red: ns = Co1 ? green : red;
		green: ns = Co2 ? black : green;
		black: ns = coD ? Idle : red;
		default ns = Idle;
		endcase
	end

	always @(ps)begin
		{Cnt1, Cnt2, CntD, ldcntD, Sh_enP, Sh_enD, SerOutValid, Done} = 8'b00000000;
		case(ps)
		Idle: ;
		red: {Cnt1,Sh_enP} = 2'b11 ;
		green: {Cnt2,Sh_enD} = 2'b11;
		black: {CntD,SerOutValid} = 2'b11;
		Done_transmit: Done = 1'b1;
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