`timescale 1ns/1ps

module pcJump(
input [31:0] instruction,
output reg [31:0] jumpAddr
);

always@(instruction)
    begin
        jumpAddr = {4'b0000, instruction[25:0], 2'b00};
    end

endmodule