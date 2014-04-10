`timescale 1ns / 1ns

module processor_tb();
    reg clk, rst;
    integer cycles, instructions;

    processor CPU(clk, rst, cycles, instructions);

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, CPU);

        cycles = 0;
        instructions = 0;
        clk <= 1'b0;
        rst <= 1'b1;
        #10 rst <= 1'b0;
    end

    always @ (posedge clk) begin
        cycles = cycles + 1;
        instructions = instructions + 1;
    end

    always #10 clk <= ~clk;
    always #10000 $display("Cycles = %d", cycles);


endmodule
