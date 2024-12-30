module Resulator(input signBit, [7:0] XIn, output [8:0] YOut);
    assign YOut = signBit ? ~XIn + 8'd1 + 9'd255 : {signBit, XIn};

endmodule