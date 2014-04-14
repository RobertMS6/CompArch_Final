`timescale 1ns / 1ns

module reg_file(readReg1, readReg2, writeReg, writeData, regWrite, clk, rst, readData1, readData2);
  /*  input [4:0] readReg1, readReg2, writeReg,
    input [31:0] writeData,
    input regWrite, clk, rst,
    output reg [31:0] readData1, readData2
);
*/ input [4:0] readReg1, readReg2, writeReg;
    input [31:0] writeData;
    input regWrite, clk, rst;
    output reg [31:0] readData1, readData2;
    reg [31:0] regFile [31:0];
    output [31:0] reg0;
    output [31:0] reg1;
    output [31:0] reg2;
    output [31:0] reg3;
    output [31:0] reg4;
    output [31:0] reg5;
    output [31:0] reg6;
    output [31:0] reg7;
    output [31:0] reg8;
    output [31:0] reg9;
    output [31:0] reg10;
    output [31:0] reg11;
    output [31:0] reg12;
    output [31:0] reg13;
    output [31:0] reg14;
    output [31:0] reg15;
    output [31:0] reg16;
    output [31:0] reg17;
    output [31:0] reg18;
    output [31:0] reg19;
    output [31:0] reg20;
    output [31:0] reg21;
    output [31:0] reg22;
    output [31:0] reg23;
    output [31:0] reg24;
    output [31:0] reg25;
    output [31:0] reg26;
    output [31:0] reg27;
    output [31:0] reg28;
    output [31:0] reg29;
    output [31:0] reg30;
    output [31:0] reg31;

    assign reg0 = regFile[0];
    assign reg1 = regFile[1];
    assign reg2 = regFile[2];
    assign reg3 = regFile[3];
    assign reg4 = regFile[4];
    assign reg5 = regFile[5];
    assign reg6 = regFile[6];
    assign reg7 = regFile[7];
    assign reg8 = regFile[8];
    assign reg9 = regFile[9];
    assign reg10 = regFile[10];
    assign reg11 = regFile[11];
    assign reg12 = regFile[12];
    assign reg13 = regFile[13];
    assign reg14 = regFile[14];
    assign reg15 = regFile[15];
    assign reg16 = regFile[16];
    assign reg17 = regFile[17];
    assign reg18 = regFile[18];
    assign reg19 = regFile[19];
    assign reg20 = regFile[20];
    assign reg21 = regFile[21];
    assign reg22 = regFile[22];
    assign reg23 = regFile[23];
    assign reg24 = regFile[24];
    assign reg25 = regFile[25];
    assign reg26 = regFile[26];
    assign reg27 = regFile[27];
    assign reg28 = regFile[28];
    assign reg29 = regFile[29];
    assign reg30 = regFile[30];
    assign reg31 = regFile[31];

    always@(posedge rst) begin
        regFile[0] <= 0;
        regFile[1] <= 0;
        regFile[2] <= 0;
        regFile[3] <= 0;
        regFile[4] <= 0;
        regFile[5] <= 0;
        regFile[6] <= 0;
        regFile[7] <= 0;
        regFile[8] <= 0;
        regFile[9] <= 0;
        regFile[10] <= 0;
        regFile[11] <= 0;
        regFile[12] <= 0;
        regFile[13] <= 0;
        regFile[14] <= 0;
        regFile[15] <= 0;
        regFile[16] <= 0;
        regFile[17] <= 0;
        regFile[18] <= 0;
        regFile[19] <= 0;
        regFile[20] <= 0;
        regFile[21] <= 0;
        regFile[22] <= 0;
        regFile[23] <= 0;
        regFile[24] <= 0;
        regFile[25] <= 0;
        regFile[26] <= 0;
        regFile[27] <= 0;
        regFile[28] <= 0;
        regFile[29] <= 0;
        regFile[30] <= 0;
        regFile[31] <= 0;
    end

    always@(readReg1 or readReg2) begin
    	 readData1 <= regFile[readReg1];
    	 readData2 <= regFile[readReg2];
    end

    always@(posedge clk) begin
    	if(regWrite)
    		regFile[writeReg] <= writeData;
    end

endmodule