module reg32_32 (rAddrA, rDataA, rAddrB, rDataB, wAddr, wData, writeEn, clk);
    input [4:0] rAddrA, rAddrB, wAddr;
    input [0:0] writeEn;
    input clk;
    input [31:0] wData;
    output reg [31:0] rDataA, rDataB;

    reg [31:0] regFile [0:31];

    always @ (posedge clk) begin
        rDataA = regFile[rAddrA];
        rDataB = regFile[rAddrB];
        if (writeEn == 1'b1) begin
            regFile[wAddr] = wData;
        end
    end

endmodule