`timescale 1ns / 1ns
module TransmiterTB ();
  reg clk = 0, rst = 0, clkEn = 0, SerIn = 1;
  wire P0, P1, P2, P3, SerOutValid, Done;
  wire [6:0] SSD_Out;
  Topmodule CUT3 (
      clk,
      clkEn,
      rst,
      SerIn,
      SerOutValid,
      Done,
      P0,
      P1,
      P2,
      P3,
      SSD_Out
  );

  always #10 clk = ~clk;
  initial begin
    clkPB = 0;
    rst = 1;
    #20;
    rst = 0;

    #30;
    clkPB = 1;
    #30;
    clkPB = 0;
    #30;

    #20 SerIn = 0;

    #20 SerIn = 1;
    #20 SerIn = 0;

    #20 SerIn = 1;
    #20 SerIn = 0;
    #20 SerIn = 1;
    #20 SerIn = 0;

    // #20 SerIn = 1;
    // #20 SerIn = 1;
    // #20 SerIn = 0;
    // #20 SerIn = 0;
    // #20 SerIn = 1;
    // #20 SerIn = 1;
    // #20 SerIn = 0;

    // #20 SerIn = 1;
    // #20 SerIn = 0;
    // #20 SerIn = 1;
    // #20 SerIn = 1;
    // #20 SerIn = 0;
    // #20 SerIn = 1;
    // #20 SerIn = 0;
    // #20 SerIn = 1;
    // #20 SerIn = 1;
    // #20 SerIn = 0;
    // #20 SerIn = 1;
    // #20 SerIn = 0;
    // #20 SerIn = 0;
    // #20 SerIn = 0;
    // #20 SerIn = 0;
    // #20 SerIn = 1;

    // #20 SerIn = 0;
    // #20 SerIn = 1;


    #1000 $stop;

  end

endmodule

