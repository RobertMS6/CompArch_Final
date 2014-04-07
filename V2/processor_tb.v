`timescale 1ns/1ps

module processor_tb();
    reg clk, rst;

    processor CPU(clk, rst);

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, CPU);

        clk = 1'b0;
        rst = 1'b1;
        #1 rst = 1'b0;
        #1000 $finish;

    end

    always #10 clk = ~clk;

endmodule
