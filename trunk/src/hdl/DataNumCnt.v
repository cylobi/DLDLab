module DataNumCnt(
    input clk, rst, clkEn, cnt1,
    output reg co2
);
reg [1:0] cnt;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            co2 <= 1'b0;
            cnt <= 2'b00;
        end
        else if (clkEn && cnt2) begin
            cnt == 3? co2 <= 1'b1 : cnt <= cnt + 1;
        end
        
    end
endmodule