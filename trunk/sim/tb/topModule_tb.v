`timescale 1ns/1ps

module topModule_tb;
    parameter WIDTH = 32;
    parameter DEPTH = 32;
    parameter PAR_WRITE = 1;
    parameter PAR_READ = 1;
    parameter ADDR_WIDTH = $clog2(DEPTH);

    reg clk;
    reg rstn;
    reg write_en;
    reg read_en;
    reg [PAR_WRITE*WIDTH-1:0] din;
    wire [PAR_READ*WIDTH-1:0] dout;
    wire full;
    wire empty;

    topModule #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH),
        .PAR_WRITE(PAR_WRITE),
        .PAR_READ(PAR_READ),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .rstn(rstn),
        .write_en(write_en),
        .din(din),
        .read_en(read_en),
        .full(full),
        .empty(empty),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rstn = 0;
        write_en = 0;
        read_en = 0;
        din = 0;

        // start
        #10 rstn = 1;
        #10 rstn = 0;
        #10 rstn = 1;

        // #1: push
        #10 write_en = 1; din = 32'hA1A1A1A1; 
        #10 write_en = 0;

        #10 uut.dp.display_mem();

        // #2: Multi push
        #10 write_en = 1; din = 32'hB2B2B2B2;
        #10 write_en = 0;
        #10 write_en = 1; din = 32'hC3C3C3C3;
        #10 write_en = 0;

        #10 uut.dp.display_mem();

        // #3: pop
        #10 read_en = 1;
        #10 read_en = 0;

        #10 uut.dp.display_mem();

        // #4: mix push and pop
        #10 write_en = 1; din = 32'hD4D4D4D4;
        #10 read_en = 1;
        #10 write_en = 0; read_en = 0;

        #10 uut.dp.display_mem();

        // #5: push until full
        while (!full) begin
            #10 write_en = 1; din = $random;
        end
        write_en = 0;

        #10 uut.dp.display_mem();

        // #6: pop until empty
        while (!empty) begin
            #10 read_en = 1;
        end
        read_en = 0;

        #10 uut.dp.display_mem();

        // done
        #20 $stop;
    end

    initial begin
        $monitor("Time=%0t | write_en=%b, read_en=%b, din=%h | dout=%h, full=%b, empty=%b",
                 $time, write_en, read_en, din, dout, full, empty);
    end

endmodule
