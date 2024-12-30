module Message_process (
    input clk,
    input rst,
    input [4:0] msg,
    input start,
    output [8:0] out_reg,
    output out_main
);

    wire co1, co2, cnt1, cnt2;

    Message_controller controller(
        .clk(clk), 
        .rst(rst),
        .start(start),
        .co1(co1),
        .co2(co2),
        .ld(ld),
        .cnt1(cnt1),
        .cnt2(cnt2),
        .shift(shift)
    );


    Counter10bit conunt10(
        .clk(clk),
        .rst(rst),
        .cnt(cnt1),
        .co(co1)
    );
    Counter4bit count4(
        .clk(clk),
        .rst(rst),
        .cnt(cnt2),
        .co(co2)
    );

    Shift_reg shreg(
        .clk(clk),
        .rst(rst),
        .in(msg),
        .shift(shift),
        .ld(ld),
        .out(out_reg),
        .out_main(out_main)
    );

endmodule