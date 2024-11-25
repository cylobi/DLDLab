module Datapath(
    input clk, rst, clkEn, serIn, cnt1, cnt2, cntD, ldCntD, shEn, shEnD, serCntValid, Done, 
    output reg co1, co2, coD, P0, P1, P2, P3
    output reg [6:0] SSDout
);

wire reg [1:0] portNum;
wire reg[3:0] NumData;
wire reg[3:0] Datatrans;


    PortNumShReg portnumshreg(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .serIn(serIn),
        .shEn(shEn)
        .portNum(portNum)
    );
    PortNumCnt portnumcnt(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .cnt1(cnt1)
        .co2(co2)
    );
    DataNumCnt datanumcnt(
        .clk(clk),
        .rst(rst),
        .clkEN(clkEN),
        .cnt2(cnt2),
        .co2(co2)
    );
    DataNum_shr datanum_shr(
        .clk(clk),
        .rst(rst),
        .clkEN(clkEN),
        .Sh_enD(shEnD),
        .NumData(NumData)
    );
    DataTrans_cnt datatrans_cnt(
        .clk(clk),
        .rst(rst),
        .clkEN(clkEN),
        .ldcntD(ldCntD),
        .CntD(cntD),
        .NumData(NumData),
        .CoD(coD),
        .count(Datatrans)
    );
    SSD ssd(
        .count(Datatrans),
        .SSDout(SSDout)
    );
    Mux_4_to_1 mux(
        .portNum(portNum),
        .SerIn(serIn),
        .p0(p0),
        .p1(p1),
        .p2(p2),
        .p3(p3)
    );

endmodule
