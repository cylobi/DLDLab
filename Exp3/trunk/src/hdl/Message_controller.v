module Message_controller(
    input clk, 
    input rst,
    input start,
    input co1,
    input co2,
    output reg ld,
    output reg cnt1,
    output reg cnt2,
    output reg shift

);

    parameter [2:0] Idle = 000 , Init = 001 ,  S1 = 010 , S2 = 011 , DONE = 100;  

    reg [2:0] ps,ns;

    always @(*)begin
        ns = Idle;
		case(ps)
		    Idle: ns = (start == 1'b1) ? Init : Idle;
		    Init: ns = S1;
		    S1: ns = (co1) ? S2 : S1;
		    S2: ns = (co2) ? DONE : S1;
            DONE: ns = Idle;
		    default: ns = Idle;
		endcase
	end

	always @(ps)begin
        {ld,cnt1,shift, cnt2} = 4'b0;
		case(ps)
		    Init: ld <= 1'b1;
		    S1: cnt1<= 1'b1;
		    S2: {shift,cnt2} = 2'b11;
		endcase
	end


    always @(posedge clk or posedge rst) begin
        if(rst)
            ps <= Idle;
        else
            ps <= ns;
    end

endmodule