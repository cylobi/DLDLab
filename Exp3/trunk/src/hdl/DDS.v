module DDS(
    input 
    clk, 
    rst,
    output reg [7:0] Magnitude 
);

	wire[5:0] addr , twos_out, mux6_out;
	wire[7:0] mux8_out;
	wire phase_pos;
	wire sign_bit, nor_out, and_out;
	reg[5:0] lut [63:0];
	wire[5:0] out_rom;
	wire phasePos;

	initial begin
        $readmemb("sine.mem", Lut);
    end

	SineController controller(
		.clk(clk),
		.rst(rst),
		.signBit(sign_bit),
		.phase_pos(phasePos),
		.addr(addr)
	);

	Twos_complement tc(
		.a(addr),
		.out(twos_out)
	);

	Mux_2_to_1_6bit mux6(
		.SM(phase_pos),
		.a(addr),
		.b(twos_out),
		.out(mux6_out)
	);

	assign out_rom = lut[mux6_out];

	NORmodule nor_(
		.a(addr),
		.out(nor_out)	
	);

	ANDmodule and_(
		.a(nor_out),
		.b(phase_pos),
		.out(and_out)
	);

	Mux_2_to_1_8bit mux8(
		.SM(and_out),
		.a(8'd1),
		.b(lut),
		.out(mux8_out)
	);
    
	Resulator res(
		.sign_bit(sign_bit),
		.XIn(mux8_out),
		.YOut(Magnitude)
	);


endmodule