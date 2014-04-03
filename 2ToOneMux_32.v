module twoToOneMux_32 (inA, inB, sel, out);

    // I/O Definitions
    input [31:0] inA;
    input [31:0] inB;
    input [0:0] sel;
    output [31:0] out;

    wire inA, inB, sel;
    reg out;

    // Select logic
    // 0 for inA, 1 for inB
    always @* begin
        if (sel==1'b0) begin
            out = inA;
        end else begin
            out = inB;
        end
    end
endmodule