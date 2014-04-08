`timescale 1ns / 1ns

module pcRst(
input rst, clk,
input [31:0] inPC,
output reg [31:0] outPC
);

always@(posedge clk, posedge rst)
    begin
        if(rst)
            outPC <= 31'h00001000;
        else
            outPC <= inPC;
    end

endmodule

