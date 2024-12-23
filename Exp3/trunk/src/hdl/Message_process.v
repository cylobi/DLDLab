module Message_process (
    input clk,
    input rst,
    input [5:0] msg,
    input start,
    output reg [7:0] out_reg,
);

    wire co1, co2;

    Message_controller controller(
        .clk(clk), 
        .rst(rst),
        .start(start),
        .ld(ld),
        .cnt1(cnt1),
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
        .out(out_reg)
    );



endmodule