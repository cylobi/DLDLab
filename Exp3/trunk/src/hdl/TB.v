module TB;


  reg clk;
  reg clkPB;
  reg rst;
  wire clkEN;

  Onepulser_contoller onepulser (
    .clk(clk), 
    .clkPB(clkPB), 
    .rst(rst), 
    .clkEN(clkEN)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  // Test 
  initial begin
    // Initial values
    clkPB = 0;
    rst = 1;  // Apply reset initially
    #10;
    rst = 0;  // Release reset

    // Test case 1: Pulse on clkPB to observe clkEN
    #30;
    clkPB = 1;
    #30;
    clkPB = 0;
    #30;

    // Test case 2: No pulse on clkPB (clkEN should stay low)
    #20;

    // Test case 3: Another pulse on clkPB to observe state changes
    clkPB = 1;
    #30;
    clkPB = 0;
    #30;

    // Test case 4: Apply reset in the middle of operation
    rst = 1;
    #30;
    rst = 0;

    // End of simulation
    #50;
    $finish;
  end

endmodule
