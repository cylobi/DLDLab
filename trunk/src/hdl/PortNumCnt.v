module PortNumCnt(
    input clk, rst, clkEn, cnt1,
    output co1
);
reg [1:0] cnt;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            cnt <= 2'b00;
        end
        else if (clkEn && cnt1)
            cnt <= cnt + 1;
    end
    assign co1 = (cnt == 1) ? 1'b1 : 1'b0;

endmodule