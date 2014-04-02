module processor(instruction);
    input [31:0] instruction;
    wire [9:0] control_logic;
    reg [5:0]opcode;
    reg regDst_sel, jump_sel, branch_sel, memRead_sel, MemtoReg_sel, MemWrite_sel, ALUsrc_sel, RegWrite_sel;
    reg [1:0] ALU_op;
    reg clk, writeEn;
    reg [4:0] RegDst_inA, RegDest_inB;
    wire [4:0] RegDst_out;
    reg [4:0] rAddrA, rAddrB, wAddr;
    reg [31:0] wData;
    wire [31:0] rDataA, rDataB;
    reg [15:0] imm;
    wire [31:0] imm_extend;
    reg [31:0] ALUsrcA, ALUsrcB;
    wire [31:0] ALUsrc_out;
    reg [31:0] ALU_inA, ALU_inB;
    wire [31:0] ALU_out;
    wire zero;
    reg [3:0]ALU_ctrl;
    reg [5:0] func_code;
    reg [31:0] MemToRegA, MemToRegB;
    wire [31:0] MemtoReg_Out;
    wire [31:0] read_data; //data from data memory
    wire [3:0] ALU_ctr_out;
    reg32_32 regsister(rAddrA, rDataA, rAddrB, rDataB, wAddr, wData, writeEn, clk);
    ctrl control(opcode, control_logic);
    twoToOneMux_5 RegDst(RegDst_inA, RegDest_inB, regDst_sel, RegDst_out);
    twoToOneMux_32 MemtoReg(MemToRegA, MemToRegB, MemtoReg_sel, MemtoReg_Out);
    twoToOneMux_32 ALUsrc(ALUsrcA, ALUsrcB,  ALUsrc_sel, ALUsrc_out);
    signExtend immediate(imm, imm_extend);

    ALU ALU_unit(ALU_ctrl, ALU_inA, ALU_inB, ALU_out, zero);
    ALUCtrl ALU_ctrl_unit(func_code, ALU_op, ALU_ctr_out);
    Memory data_memory()
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
        wAddr = RegDst_out;
      //ALU instructions
        ALU_inA = rDataA;
        ALU_inB = ALUsrc_out;

        //memtoreg
        MemToRegA = read_data;
        MemToRegB = ALU_out;


//        write_addA = instruction[20:16];
//        write_addB = instruction[15:11];

        //ALU
//        ALUsrc_sel = control_logic[1];


    end

    always #5 clk = ~clk;

endmodule