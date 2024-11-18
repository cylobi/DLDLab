module Datapath(
    input clk, rst, clkEn, serIn, cnt1, cnt2, cntD, ldCntD, shEn, shEnD, serCntValid, Done, 
    output reg co1, co2, coD
);

wire reg [1:0] portNum;


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

    



endmodule
