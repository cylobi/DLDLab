module Resulator(input signBit, [7:0] XIn, output reg [8:0] YOut);

    wire [8:0] tcRes;

    TwosComplement8Bit tc8b(.a(XIn), .out(tcRes[7:0]));

    always @(*) begin
        if (signBit) begin
            YOut <= (tcRes + 9'd255);
        end 
        else begin
            YOut <= {1'b1, XIn};
        end
    end    

endmodule