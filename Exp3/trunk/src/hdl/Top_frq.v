module Top_frq(
    input clk,
    input rst,
    input sel,
    input [4:0] msg,
    input [2:0] SW,
    input init,
    output out,
    output out_ld_frq_div
);

    wire out_ld_frq , out_frq;

    ld_frq_div ld_frq(
        .clk(clk),
        .rst(rst),
        .SW(SW),
        .ld(init),
        .co(out_ld_frq)
    );

    frq_div frq(
        .clk(clk),
        .rst(rst),
        .SW(SW),
        .ld(init),
        .co(out_frq)
    );

    Mux_2_to_1_1bit mux1(
        .sel(sel),
        .a(out_ld_frq),
        .b(out_frq),
        .out(out_mux)
    );

    assign out = out_mux;
    assign out_ld_frq_div = out_ld_frq;


endmodule