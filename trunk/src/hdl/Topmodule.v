module Topmodule(
	input clk, clkEn, rst, SerIn, 
	output SerCntValid, Done, P0, P1, P2, P3,
	output [6:0] SSD_Out);

	wire Co1, Co2, CoD, Cnt1, Cnt2, CntD, ldcntD, Sh_enP, Sh_enD;

	Controller C(.clk(clk), .clkEn(clkEn), .rst(rst), .serIn(SerIn), .Co1(Co1), .Co2(Co2), .Cod(CoD), .Cnt1(Cnt1), .Cnt2(Cnt2), .CntD(CntD), .ldcntD(ldcntD),
			 .Sh_enP(Sh_enP), .sh_enD(Sh_enD), .SerOutValid(SerCntValid), .Done(Done));

	Datapath D(.clk(clk), .clkEn(clkEn), .rst(rst), .serIn(SerIn), .cnt1(Cnt1), .cnt2(Cnt2), .cntD(CntD), .ldcntD(ldcntD), .shEn(Sh_enP), .shEnD(Sh_enD), 
			.serCntValid(serCntValid), .Done(Done), .co1(Co1), .co2(Co2), .coD(CoD), .p0(P0), .p1(P1), .p2(P2), .p3(P3), .SSDout(SSD_Out));
endmodule