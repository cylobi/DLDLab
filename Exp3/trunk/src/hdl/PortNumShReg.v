module PortNumShReg(
    input clk, rst, clkEn, serIn, shEn,
    output reg [1:0] portNum
);

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            portNum <= 2'b00;
        end
        else if (clkEn && shEn) begin
            portNum <= {portNum[0], serIn};
        end
        
    end

endmodule
