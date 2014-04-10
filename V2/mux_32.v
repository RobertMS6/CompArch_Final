`timescale 1ns / 1ns

module twoToOneMux_32(
    input[31:0] inA,
    input[31:0] inB,
    input[0:0] sel,
    output reg[31:0] out
);

    always @* begin
        if (sel==1'b0) begin
            out <= inA;
        end else begin
            out <= inB;
        end
    end

endmodule