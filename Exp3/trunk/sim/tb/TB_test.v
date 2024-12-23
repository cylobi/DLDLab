module TB_test;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [7:0] Magnitude;

    // Instantiate the Unit Under Test (UUT)
    DDS uut (
        .clk(clk), 
        .rst(rst), 
        .Magnitude(Magnitude)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 0;

        // Wait for global reset
        #100;
                
        // Apply reset
        rst = 1;
        #10;
        rst = 0;

        // Add stimulus here
        #10000;
        $stop;
    end
    
    always #5 clk = ~clk; // Generate clock with period 10 time units

endmodule