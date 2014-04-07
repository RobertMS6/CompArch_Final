`timescale 1ns/1ps

module processor_tb();
    reg clk, rst;

    processor test(clk, rst);

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, test);

        clk = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
        #10000000 $finish;

    end

    always #10 clk = ~clk;

endmodule