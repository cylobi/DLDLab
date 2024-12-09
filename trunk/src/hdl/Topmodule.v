module Topmodule(
	input clk, clkPB, rst, SerIn, 
	output SerOutValid, Done, P0, P1, P2, P3,
	output [6:0] SSD_Out);

	wire Co1, Co2, CoD, Cnt1, Cnt2, CntD, ldcntD, Sh_enP, Sh_enD;

	Controller C(.clk(clk), .clkEn(clkEn), .rst(rst), .serIn(SerIn), .Co1(Co1), .Co2(Co2), .CoD(CoD), .Cnt1(Cnt1), 
			.Cnt2(Cnt2), .CntD(CntD), .ldcntD(ldcntD), .Sh_enP(Sh_enP), .Sh_enD(Sh_enD), .SerOutValid(SerOutValid), .Done(Done));

	Datapath D(.clk(clk), .clkEn(clkEn), .rst(rst), .serIn(SerIn), .cnt1(Cnt1), .cnt2(Cnt2), .cntD(CntD), .ldCntD(ldcntD),
			 .shEn(Sh_enP), .shEnD(Sh_enD), .Done(Done), .co1(Co1), .co2(Co2), .coD(CoD), .p0(P0), .p1(P1), .p2(P2), .p3(P3), .SSDout(SSD_Out));

	Onepulser_contoller OC(.clk(clk), .clkPB(clkPB), .rst(rst), .clkEN(clkEn))
endmodule