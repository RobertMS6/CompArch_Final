`timescale 1ns/1ps

module jump(instruction, pc, zero, branch_sel, jump_sel, rst, newPC);
    input [31:0] instruction, pc;
    input [0:0] zero, branch_sel, jump_sel, rst;
    reg [0:0] branch_ctl;
    reg [15:0] instrTemp;
    reg [31:0] pcTemp, bInstrTemp, jInstrTemp;
    output reg [31:0] newPC;
    output [31:0] bInstr, jInstr, addrTemp, newPCTemp;

    signExtend bTemp(instrTemp, bInstr);
    twoToOneMux_32 branchMux(pcTemp, bInstrTemp, branch_ctl, addrTemp);
    twoToOneMux_32 jumpMux(addrTemp, jInstrTemp, jump_sel, newPCTemp);

    always @* begin
        if (rst == 1'b1) begin
            newPC = 32'h00001000;
        end else begin
            pcTemp = pc + 4;
            instrTemp = instruction[15:0];
            bInstrTemp = (bInstr << 2) + pcTemp;
            branch_ctl = zero & branch_sel;
            jInstrTemp = {4'b0000, instruction[25:0], 2'b00};
            newPC = newPCTemp;
        end
    end

endmodule