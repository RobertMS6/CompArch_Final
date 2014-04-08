`timescale 1ns / 1ns

module processor_tb();
    reg clk, rst;

    processor CPU(clk, rst);

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, CPU);

        clk <= 1'b0;
        rst <= 1'b1;
        #10 rst <= 1'b0;
    end

    always #10 clk <= ~clk;

endmodule
