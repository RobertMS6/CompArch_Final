`timescale 1ns / 1ns

module pcBranch(
input [31:0] inPC, instruction,
output reg [31:0] branchAddr
);

output [31:0] tempExt;
reg [15:0] temp1;
reg [31:0] temp2;

signExtend bTemp(temp1, tempExt);

always@*
    begin
        temp1 <= instruction[15:0];
        temp2 <= {tempExt[29:0], 2'b00};
        branchAddr <= temp2 + inPC;
    end

endmodule