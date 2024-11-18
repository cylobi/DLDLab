module PortNumCnt(
    input clk, rst, clkEn, cnt1,
    output reg co1
);
reg [1:0] cnt;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            co1 <= 1'b0;
            cnt <= 2'b00;
        end
        else if (clkEn && cnt1) begin
            cnt == 3? co1 <= 1'b1 : cnt <= cnt + 1;
        end
        
    end

endmodule