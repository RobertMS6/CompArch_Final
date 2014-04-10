`timescale 1ns / 1ns

module processor(
    input clk,
    input rst,
    input [31:0] cycles,
    input [31:0] instructions
);
    //Intermediate Wires
    wire [31:0] inPC, outPC, outPCadd, outPCbranch, outPCjump, pcTemp, wData, rDataA, rDataB, immExtended, ALUSrc_out, ALU_out, memory_out;
    wire [15:0] imm;
    wire [5:0] opcode, func_code;
    wire [4:0] rAddrA, rAddrB, wAddr, wAddrMux;
    wire [3:0] ALUctrl_op;
    wire [0:0] zero;
    wire [31:0] instruction;

    //Control Logic Lines
    wire regDst_sel;
    wire jump_sel;
    wire branch_sel;
    wire memRead_sel;
    wire MemtoReg_sel;
    wire [1:0] ALU_op;
    wire MemWrite_sel;
    wire ALUsrc_sel;
    wire RegWrite_sel;

    //Instruction Breakdown
    assign opcode = instruction[31:26];
    assign rAddrA = instruction[25:21];
    assign rAddrB = instruction[20:16];
    assign wAddr = instruction[15:11];
    assign imm = instruction[15:0];
    assign func_code = instruction[5:0];

    //Program Counter/Branch/Jump Logic
    pcRst PC(rst, clk, inPC, outPC);
    add4 nextPC(outPC, outPCadd);
    pcBranch branchPC(outPCadd, instruction, outPCbranch);
    pcJump jumpPC(instruction, outPCjump);
    branchCtl branchCtl_2mux(branch_sel, zero, branch_ctl);
    twoToOneMux_32 pcMux1(outPCadd, outPCbranch, branch_ctl, pcTemp);
    twoToOneMux_32 pcMux2(pcTemp, outPCjump, jump_sel, inPC);

    //Processing Logic
    controlunit control_logic(opcode, regDst_sel, jump_sel, branch_sel, memRead_sel, MemtoReg_sel, ALU_op,  MemWrite_sel, ALUsrc_sel, RegWrite_sel);
    twoToOneMux_5 writeMux(rAddrB, wAddr, regDst_sel, wAddrMux);
    signExtend immediate(imm, immExtended);
    twoToOneMux_32 ALUSrc(rDataB, immExtended, ALUsrc_sel, ALUSrc_out);
    alu_control ALUctrl(ALU_op, func_code, ALUctrl_op);
    reg_file register(rAddrA, rAddrB, wAddrMux, wData, RegWrite_sel, clk, rst, rDataA, rDataB);
    alu ALU_unit(rDataA, ALUSrc_out, ALUctrl_op, ALU_out, zero);
    Memory memory_unit(outPC, instruction, ALU_out, rDataB, memRead_sel, MemWrite_sel, memory_out);
    twoToOneMux_32 memtoReg_mux(ALU_out, memory_out, MemtoReg_sel, wData);

endmodule
