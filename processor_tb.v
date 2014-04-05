module processor_tb();
    reg clk;
    processor test(clk);

    always #5 clk = ~clk;
    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, test);

        #20 $finish;
    end


endmodule