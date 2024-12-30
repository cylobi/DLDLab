module TopModule(
    input sel,
    input [4:0] msg,
    input rst,
    input init,
    input [8:0]sw,
    input mode,
    input start,
    output out
);

    wire out_frq, out_reg_mp;

    Top_frq tf(
        .clk(clk),
        .rst(rst),
        .sel(),
        .msg(msg),
        .SW(SW[7:5]),
        .out(out_frq)
    );

    Message_process mp(
        .clk(clk),
        .rst(rst),
        .msg(msg),
        .start(start),
        .out_reg(out_reg_mp)
    );

endmodule
