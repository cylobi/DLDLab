module Message_controller(
    input clk, 
    input rst,
    input start,
    input co1,
    input co2,
    output reg ld,
    output reg cnt1,
    output reg shift

);

    reg [2:0] ps,ns;

    always @(*)begin
		case(ps)
		Idle: ns = (start == 1'b1) ? Init : Idle;
		Init: ns = S1;
		S1: ns = (co1) ? S2 : S1;
		S2: ns = (co2) ? DONE : S1;
        S2: ns = Idle;
		default ns = Idle;
		endcase
	end

	always @(ps)begin
		case(ps)
		Init: ld <= 1'b1;
		S1: cnt1<= 1'b1;
		S2: shift <= 1'b1;
		endcase
	end


endmodule