`timescale 1ns / 1ns

module processor_tb();
    reg clk, rst;
    integer cycles;

    processor CPU(clk, rst);

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, CPU);

        cycles = 0;
        clk <= 1'b0;
        rst <= 1'b1;
        #10 rst <= 1'b0;
    end

    always @ (posedge clk) begin
        cycles = cycles + 1;
    end

    always #10 clk <= ~clk;

endmodule
