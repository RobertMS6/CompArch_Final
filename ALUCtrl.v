module ALUCtrl (funct, ALUop, out);
    input [5:0] funct;
    input [1:0] ALUop;
    output reg [3:0] out;

    always @(ALUop | funct) begin
        case(ALUop)
            2'b00 : out = 4'b0010; //addi, lw, sw
            2'b01 : out = 4'b0110; //beq
            2'b10 : out = 4'b0010; //add
            default : out = 4'bXXXX; //j
        endcase
    end
endmodule