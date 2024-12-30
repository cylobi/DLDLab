`timescale 1ns / 1ps

module TB;
    // Inputs
    reg clk;
    reg sel;
    reg rst;
    reg init;
    reg [9:0] SW;
    reg mode;
    reg start;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    TopModule uut (
        .clk(clk),
        .sel(sel),
        .rst(rst),
        .init(init),
        .SW(SW),
        .mode(mode),
        .start(start),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        sel = 0;
        rst = 1;
        init = 0;
        SW = 0;
        mode = 0;
        start = 0;

        // Reset sequence
        #10 rst = 0;
        #10 rst = 1;

        // Test case 1: Initialize system
        init = 1;
        #20 init = 0;

        // Test case 2: Send a message
        msg = 10'b1000110101;
        start = 1;
        #10 start = 0;

        // Test case 3: Change switch values
        SW = 10'b1001101101;
        #20;

        // Test case 4: Change mode and sel
        mode = 1;
        sel = 1;
        #20;

        // Additional test cases...

        // Finish simulation
        #100;
        $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %t | clk: %b | sel: %b | msg: %b | rst: %b | init: %b | SW: %b | mode: %b | start: %b | out: %b", 
                 $time, clk, sel, rst, init, SW, mode, start, out);
    end

endmodule
