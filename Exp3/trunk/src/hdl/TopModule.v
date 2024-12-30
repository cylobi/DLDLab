module TopModule(
    input sel,
    input [4:0] msg,
    input rst,
    input init,
    input [8:0]sw,
    input mode,
    output out
);

    wire out_frq;

    Top_frq tf(
        .clk(clk),
        .rst(rst),
        .sel(),
        .msg(msg),
        .SW(SW[7:5]),
        .out(out_frq)
    );

endmodule
