module Resulator(input signBit, [7:0] XIn, output reg [8:0] YOut);

    wire [8:0] tcRes;

    TwosComplement8Bit tc8b(.a(XIn), .out(tcRes));

    always @(*) begin
        if (signBit) begin
            YOut <= (tcRes + 9'd255);
        end 
        else begin
            YOut <= {'b1, XIn}
        end
    end    

endmodule