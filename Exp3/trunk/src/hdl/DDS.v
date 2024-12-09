module DDS(
    input 
    clk, 
    rst,
    output[7:0] reg Magnitude, 
);

	wire[5:0] addr;
	wire phase_pos;
	wire sign_bit;

	Mux_2_to_1_6bit mux6(
		.SM(phase_pos),
		.a(addr),
		.b(),
		.out()
	);

	

    Counter6bit cntr6b(
        .clk(clk),
        .rst(rst),
        .par_out(addr));
    

    initial begin
        $readmemb("sine.mem", Lut);
    end

    always @(*)begin
		case(ps)
		T1: ns = (addr == 8'b11111111) ? T2 : T1;
		T2: ns = (addr == 8'b11111111) ? T3 : T2;
		T3: ns = (addr == 8'b11111111) ? T4 : T3;
		T4: ns = (addr == 8'b11111111) ? T1 : T4;
		default ns = T1;
		endcase
	end

	always @(ps)begin
		case(ps)
		T1: {signBit, phasePos} <= 2'b00;
		T2: {signBit, phasePos} <= 2'b01;
		T3: {signBit, phasePos} <= 2'b11;
		T4: {signBit, phasePos} <= 2'b10;
		endcase
	end


	always @(posedge clk, posedge rst)begin
		if (rst)
			ps <= T1;
		else
			ps <= ns;
	end



endmodule