`timescale 1ns / 1ns

module controlunit (input [5:0] opcode,
                    output reg regdest, output reg jump, output reg branch, output reg memread,
                    output reg memtoreg, output reg[1:0] aluop, output reg memwrite, output reg alusrc, output reg regwrite);

  // These cases and outputs are taken from figure 4.22, P&H
  always @ (opcode) begin
    {regdest, alusrc, memtoreg, regwrite, memread, memwrite, branch, jump, aluop}<=10'b0000000000;
    case (opcode)
      6'b000000 : begin // add r-type, others are 0 by default
        regdest <= 1;
        regwrite <= 1;
        aluop <= 2'b10;
        alusrc <= 0;
        end
      6'b001000 : begin //addi
        alusrc <= 1;
        aluop <= 2'b00;
        regwrite <= 1;
        regdest <= 0;
        end
      6'b100011: begin // lw
        alusrc <= 1;
        memtoreg <= 1;
        regwrite <= 1;
        memread <= 1;
      end
      6'b101011: begin // sw
        alusrc <= 1;
	      memwrite <= 1;
      end
      6'b000100: begin // beq
        branch <= 1;
        aluop <= 2'b01;
      end
      6'b000010: begin // j
        jump <= 1;
        // all else is don't-care
      end
      6'b111111: begin
        $display("$0: 0x%h   $1:0x%h", CPU.register.regFile[0], CPU.register.regFile[1]);
        $display("$2: 0x%h   $3:0x%h", CPU.register.regFile[2], CPU.register.regFile[3]);
        $display("$4: 0x%h   $5:0x%h", CPU.register.regFile[4], CPU.register.regFile[5]);
        $display("$6: 0x%h   $7:0x%h", CPU.register.regFile[6], CPU.register.regFile[7]);
        $display("$8: 0x%h   $9:0x%h", CPU.register.regFile[8], CPU.register.regFile[9]);
        $display("$10: 0x%h   $11:0x%h", CPU.register.regFile[10], CPU.register.regFile[11]);
        $display("$12: 0x%h   $13:0x%h", CPU.register.regFile[12], CPU.register.regFile[13]);
        $display("$14: 0x%h   $15:0x%h", CPU.register.regFile[14], CPU.register.regFile[15]);
        $display("$16: 0x%h   $17:0x%h", CPU.register.regFile[16], CPU.register.regFile[17]);
        $display("$18: 0x%h   $19:0x%h", CPU.register.regFile[18], CPU.register.regFile[19]);
        $display("$20: 0x%h   $21:0x%h", CPU.register.regFile[20], CPU.register.regFile[21]);
        $display("$22: 0x%h   $23:0x%h", CPU.register.regFile[22], CPU.register.regFile[23]);
        $display("$24: 0x%h   $25:0x%h", CPU.register.regFile[24], CPU.register.regFile[25]);
        $display("$26: 0x%h   $27:0x%h", CPU.register.regFile[26], CPU.register.regFile[27]);
        $display("$28: 0x%h   $29:0x%h", CPU.register.regFile[28], CPU.register.regFile[29]);
        $display("$30: 0x%h   $31:0x%h", CPU.register.regFile[30], CPU.register.regFile[31]);
        $finish;
      end
    endcase
  end
endmodule