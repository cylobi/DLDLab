module TB_test;
    reg clk;
    reg reset;
    wire [7:0] output_signal;

    // Instantiate the design under test (DUT)
    DDS dut (
        .clk(clk),
        .rst(rst),
        .Magnitude(output_signal)
    );

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Test case 1
        #20; // Wait for some time
        // Add assertions or checks here

        // Test case 2
        #20; // Wait for some time
        // Add assertions or checks here

        // Finish simulation
        #10 $finish;
    end

    always #5 clk = ~clk; // Clock generation
endmodule