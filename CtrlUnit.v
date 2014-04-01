module ctrl (opcode, out);
    input [5:0] opcode;
    output reg [9:0] out;

    always @(opcode) begin
        casex(opcode)
            6'b000000 : out = 10'b1000010001; //add
            6'b001000 : out = 10'b0000000011; //addi
            6'b000100 : out = 10'bX010X01000; //beq
            6'b000010 : out = 10'bX100XXX0X0; //j
            6'b100011 : out = 10'b0001100011; //lw
            6'b101011 : out = 10'bX000X00110; //sw
        endcase
    end
endmodule