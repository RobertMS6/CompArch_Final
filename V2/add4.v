`timescale 1ns / 1ns

module add4(
input [31:0] inA,
output reg [31:0] outA
);

always@(inA)
    begin
        outA <= inA + 4;
    end
endmodule