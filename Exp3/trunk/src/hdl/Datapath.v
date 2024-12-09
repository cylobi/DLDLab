module Datapath(
    input clk, rst, serIn, clkEn, cnt1, cnt2, cntD, ldCntD, shEn, shEnD, Done, 
    output co1, co2, coD, p0, p1, p2, p3,
    output [6:0] SSDout
);

wire [1:0] portNum;
wire [3:0] NumData;
wire [3:0] Datatrans;


    PortNumShReg portnumshreg(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .serIn(serIn),
        .shEn(shEn),
        .portNum(portNum)
    );
    PortNumCnt portnumcnt(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .cnt1(cnt1),
        .co1(co1)
    );
    DataNumCnt datanumcnt(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .cnt2(cnt2),
        .co2(co2)
    );
    DataNum_shr datanum_shr(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .serIn(serIn),
        .sh_enD(shEnD),
        .NumData(NumData)
    );
    DataTrans_cnt datatrans_cnt(
        .clk(clk),
        .rst(rst),
        .clkEn(clkEn),
        .ldcntD(ldCntD),
        .CntD(cntD),
        .NumData({NumData[2:0], serIn}),
        .CoD(coD),
        .count(Datatrans)
    );
    SSD ssd(
        .Count(Datatrans),
        .SSDout(SSDout)
    );
    Mux_4_to_1 mux(
        .portnum(portNum),
        .SerIn(serIn),
        .p0(p0),
        .p1(p1),
        .p2(p2),
        .p3(p3)
    );

endmodule
