module DDS(
    input 
    clk, 
    rst,
    output[7:0] reg Magnitude, 
);

	wire[5:0] addr , twos_out, mux6_out;
	wire[7:0] mux8_out;
	wire phase_pos;
	wire sign_bit, outn, outand;
	reg[5:0] lut [63:0];
	wire[5:0] out_rom;

	Mux_2_to_1_6bit mux6(
		.SM(phase_pos),
		.a(addr),
		.b(twos_out),
		.out(mux6_out)
	);

	Twos_complement tc(
		.a(addr),
		.out(twos_out)
	);

	assign out_rom = lut[mux6_out];

	NORmodule n(
		.a(addr),
		.out(outn)	
	);

	ANDmodule(
		.a(outn),
		.b(phase_pos),
		.out(outands)
	);

	Mux_2_to_1_8bit mux8(
		.SM(outands),
		.a(8'd1),
		.b(lut),
		.out(mux8_out)
	);

    Counter6bit cntr6b(
        .clk(clk),
        .rst(rst),
        .par_out(addr));
    

    initial begin
        $readmemb("sine.mem", Lut);
    end


endmodule