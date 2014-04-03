module processor(clk);
    output [31:0] instruction;
    input clk;
    output [31:0] pc;
    wire [9:0] control_logic;
    reg [5:0]opcode;
    reg regDst_sel, jump_sel, branch_sel, memRead_sel, MemtoReg_sel, MemWrite_sel, ALUsrc_sel, RegWrite_sel;
    reg [1:0] ALU_op;
    reg writeEn;
    reg [4:0] RegDst_inA, RegDest_inB;
    reg [4:0] rAddrA, rAddrB;
    output [4:0] wAddr;
    reg [31:0] wData;
    output [31:0] rDataA, rDataB;
    reg [15:0] imm;
    output [31:0] imm_extend;
    reg [31:0] ALUsrcA, ALUsrcB;
    output [31:0] ALUsrc_out;
    reg [31:0] ALU_inA, ALU_inB;
    output [31:0] ALU_out;
    output zero;
    reg [3:0]ALU_ctrl;
    reg [5:0] func_code;
    reg [31:0] MemToRegA, MemToRegB;
    wire [3:0] ALU_ctr_out;
    output [31:0] rMemData;
    output [31:0] Memto;
    reg32_32 regsister(rAddrA, rDataA, rAddrB, rDataB, wAddr, wData, writeEn, clk);
    ctrl control(opcode, control_logic);
    twoToOneMux_5 RegDst(RegDst_inA, RegDest_inB, regDst_sel, wAddr);
    twoToOneMux_32 MemtoReg(ALU_out, rMemData, MemtoReg_sel, wData);
    twoToOneMux_32 ALUsrc(rDataB, imm_extend,  ALUsrc_sel, ALUsrc_out);
    signExtend immediate(imm, imm_extend);

    ALU ALU_unit(ALU_ctrl, rDataA, ALUsrc_out, ALU_out, zero);
    ALUCtrl ALU_ctrl_unit(func_code, ALU_op, ALU_ctr_out);
    Memory data_memory(pc, instruction, ALU_out, rDataB, MemWrite_sel, Memto);
    always @(posedge clk)
    begin
        opcode = instruction[31:26];
        func_code = instruction[5:0];
        //output all control logic
        regDst_sel = control_logic[9];
        jump_sel = control_logic[8];
        branch_sel = control_logic[7];
        memRead_sel = control_logic[6];
        MemtoReg_sel = control_logic[5];
        ALU_op = control_logic[4:3];
        MemWrite_sel = control_logic[2];
        ALUsrc_sel = control_logic[1];
        RegWrite_sel = control_logic[0];


      //control logic
        rAddrA = instruction[25:21];
        rAddrB = instruction[20:16];
      //ALU instructions
        ALU_inA = rDataA;
        ALU_inB = ALUsrc_out;


        //sign extend
        imm = instruction[15:0];

        func_code = instruction[5:0];


    end


endmodule