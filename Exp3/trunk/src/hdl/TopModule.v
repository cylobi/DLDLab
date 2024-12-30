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
    wire dds_out;
    wire pwm_in;
    wire pwm_out;

    Top_frq tf(
        .clk(clk),
        .rst(rst),
        .sel(),
        .msg(msg),
        .SW(SW[7:5]),
        .out(out_frq)
    );

    DDS dds(
        .clk(),
        .rst(rst),
        .Magnitude(dds_out)
    );

    Mux_2_to_1_8bit m8b2i1(
        .SM(),
        .a(8'd128),
        .b(dds_out),
        .out(pwm_in)
    );

    PWM pwm(
        .clk(clk),
        .rst(rst),
        .par_in(pwm_in),
        .par_out(out)
    )