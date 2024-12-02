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
    #20 rst = 1;
    #20 rst = 0;
    #20 clkEn = 1;

    #10 SerIn = 0;

    #10 SerIn = 1;
    #10 SerIn = 1;

    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 0;

    #10 SerIn = 1;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 1;
    #10 SerIn = 0;

    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 1;

    #50 SerIn = 0;
    #50 SerIn = 1;


    #100 $stop;

  end

endmodule

