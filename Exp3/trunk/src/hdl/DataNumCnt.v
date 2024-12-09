module DataNumCnt(
    input clk, rst, clkEn, cnt2,
    output co2
);
reg [1:0] cnt;

    always @(posedge clk, posedge rst) begin
        if (rst)
            cnt <= 2'b00;
        else if (clkEn && cnt2)
            cnt <= cnt + 1;
    end
    assign co2 = (cnt == 3) ? 1'b1 : 1'b0;
endmodule