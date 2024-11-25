module DataNumCnt(
    input clk, rst, clkEn, cnt2,
    output reg co2
);
reg [1:0] cnt;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            co2 <= 1'b0;
            cnt <= 2'b00;
        end
        else if (clkEn && cnt2) begin
            if (cnt == 3) begin 
                co2 <= 1'b1;
            end else begin
                cnt <= cnt + 1;
            end
        end
        
    end
endmodule