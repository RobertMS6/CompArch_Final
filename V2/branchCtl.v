`timescale 1ns / 1ns

module branchCtl(
    input [0:0] branch_sel, zero,
    output reg [0:0] branch
);

    always@(branch_sel or zero) begin
        branch <= branch_sel & zero;
    end

endmodule