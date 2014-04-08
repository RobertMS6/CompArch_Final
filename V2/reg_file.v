`timescale 1ns / 1ns

module reg_file(
input [4:0] readReg1, readReg2, writeReg,
input [31:0] writeData,
input regWrite, clk, rst,
output reg [31:0] readData1, readData2
);

reg [31:0] regFile [31:0];

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