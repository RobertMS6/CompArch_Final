module jump(instruction, pc, zero, branch_sel, jump_sel, newPC);
    input [31:0] instruction, pc;
    input [0:0] zero, branch_sel, jump_sel;
    reg [0:0] branch_ctl;
    reg [15:0] instrTemp;
    reg [31:0] pcTemp, bInstrTemp, jInstrTemp;
    output [31:0] newPC;
    output [31:0] bInstr, jInstr, addrTemp;

    signExtend bTemp(instrTemp, bInstr);
    twoToOneMux_32 branchMux(pcTemp, bInstrTemp, branch_ctl, addrTemp);
    twoToOneMux_32 jumpMux(addrTemp, jInstrTemp, jump_sel, newPC);

    always @* begin
        pcTemp = pc + 4;
        instrTemp = instruction[15:0];
        bInstrTemp = (bInstr << 2) + pcTemp;
        branch_ctl = zero & branch_sel;
        jInstrTemp = {{31{jInstr[0]}}, instruction[25:0] << 2};
    end

endmodule