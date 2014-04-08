`timescale 1ns/1ps

module ALU (ALUCtrl, inA, inB, ALUResult, zero);
    input [3:0] ALUCtrl;
    input [31:0] inA;
    input [31:0] inB;
    output reg [31:0] ALUResult;
    output reg [0:0] zero;

    always @(ALUCtrl | inA | inB) begin
        case(ALUCtrl)
            4'b0010 : ALUResult = inA + inB; //add, addi, lw, sw
            4'b0110 : begin //beq
                if (inA - inB == 0) begin
                    ALUResult = 32'hXXXXXXXX;
                    zero = 1'b1;
                end else begin
                    ALUResult = 32'hXXXXXXXX;
                    zero = 1'b0;
                end
            end
            default : begin //j
                        ALUResult = 32'hXXXXXXXX;
                        zero = 1'b1;
                    end
        endcase
    end
endmodule
