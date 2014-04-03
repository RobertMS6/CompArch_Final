module jump(instruction, pc, zero, branch_sel, jump_sel);
    input [31:0] instruction, pc;
    input [0:0] zero, branch_sel, jump_sel, branch_ctl;
    reg [15:0] instrTemp;
    reg [31:0] newPC;
    wire [31:0] pcTemp, bInstr, jInstr, addrTemp;

    always @(pc) begin
        pcTemp = pc + 4;
        instrTemp = instruction[15:0];
        signExtend bTemp(instrTemp, bInstr);
        bInstr = bInstr * 4;
        bInstr = bInstr + pcTemp;
        branch_ctl = zero & branch_sel;
        twoToOneMux_32 branchMux(pcTemp, bInstr, branch_ctl, addrTemp);

        jInstr = instruction[25:0] * 4;
        jInstr = {{31{jInstr[0]}}, jInstr[27:0]};
        twoToOneMux_32 jumpMux(addrTemp, jInstr, jump_sel, newPC);
    end

endmodule