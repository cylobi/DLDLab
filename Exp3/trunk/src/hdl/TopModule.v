module TopModule(
    input clk,
    input sel,
    input rst,
    input init,
    input [9:0] SW,
    input mode,
    input start,
    output [7:0] out
);

    wire out_frq, out_reg_mp, out_ld_frq_div;
    wire [7:0] dds_out;
    wire [7:0] pwm_in;
    wire [7:0] pwm_out;
    wire [8:0] tmp;

    Top_frq tf(
        .clk(clk),
        .rst(rst),
        .sel(out_reg_mp),
        .SW(SW[7:5]),
        .init(init),
        .out(out_frq),
        .out_ld_frq_div(out_ld_frq_div)
    );

    Message_process mp(
        .clk(out_ld_frq_div),
        .rst(rst),
        .msg(SW[4:0]),
        .start(start),
        .out_reg(tmp),
        .out_main(out_reg_mp)
    );

    DDS dds(
        .clk(out_frq),
        .rst(rst),
        .Magnitude(dds_out)
    );

    assign mux_sel = (out_reg_mp || SW[8]);

    Mux_2_to_1_8bit m8b2i1(
        .SM(mux_sel),
        .a(8'd128),
        .b(dds_out),
        .out(out)
    );
/*
    PWM pwm(
        .clk(clk),
        .rst(rst),
        .par_in(pwm_in),
        .par_out(out)
    );*/

endmodule