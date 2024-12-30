module TopModule(
    input clk,
    input sel,
    input [4:0] msg,
    input rst,
    input init,
    input [9:0] SW,
    input mode,
    input start,
    output out
);

    wire out_frq, out_reg_mp, out_ld_frq_div;
    wire dds_out;
    wire pwm_in;
    wire pwm_out;

    Top_frq tf(
        .clk(clk),
        .rst(rst),
        .sel(out_reg_mp),
        .SW(SW[7:5]),
        .init(init)
        .out(out_frq),
        .out_ld_frq_div(out_ld_frq_div)
    );

    Message_process mp(
        .clk(out_ld_frq_div),
        .rst(rst),
        .msg(SW[4:0]),
        .start(start),
        .out_reg(out_reg_mp)
    );

    DDS dds(
        .clk(out_frq),
        .rst(rst),
        .Magnitude(dds_out)
    );

    assign mux_sel <= (out_reg_mp || sw[8])

    Mux_2_to_1_8bit m8b2i1(
        .SM(mux_sel),
        .a(8'd128),
        .b(dds_out),
        .out(pwm_in)
    );

    PWM pwm(
        .clk(clk),
        .rst(rst),
        .par_in(pwm_in),
        .par_out(out)
    );

endmodule