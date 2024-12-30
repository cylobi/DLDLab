`timescale 1ns / 1ps

module tb_Message_process;

    // Inputs
    reg clk;
    reg rst;
    reg [4:0] msg;
    reg start;

    // Outputs
    wire [7:0] out_reg;

    Message_process uut (
        .clk(clk),
        .rst(rst),
        .msg(msg),
        .start(start),
        .out_reg(out_reg)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        start = 0;
        msg = 5'b00000;

        // Apply reset
        #10;
        rst = 1;
        #10;
        rst = 0;
        #20;
        msg = 5'b01010; 
        start = 1;
        #10;
        start = 0;

        #1000000;

        msg = 5'b10011;
        start = 1;
        #10;
        start = 0;

        #100;

        #10;
        rst = 1;

        #50;
  
        $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0dns, rst: %b, msg: %b, start: %b, out_reg: %h", 
                  $time, rst, msg, start, out_reg);
    end

endmodule