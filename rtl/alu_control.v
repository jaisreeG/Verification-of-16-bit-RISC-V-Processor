module alu_control( ALU_Control, alu_op, opcode);
  output reg[2:0] ALU_Control;
 input [1:0] alu_op;
 input [3:0] opcode;
 wire [5:0] ALUControlIn;
 assign ALUControlIn = {alu_op,opcode};
 always @(ALUControlIn)
 casex (ALUControlIn)
   6'b10xxxx: ALU_Control=3'b000;
   6'b01xxxx: ALU_Control=3'b001;
   6'b000010: ALU_Control=3'b000;
   6'b000011: ALU_Control=3'b001;
   6'b000100: ALU_Control=3'b010;
   6'b000101: ALU_Control=3'b011;
   6'b000110: ALU_Control=3'b100;
   6'b000111: ALU_Control=3'b101;
   6'b001000: ALU_Control=3'b110;
   6'b001001: ALU_Control=3'b111;
  default: ALU_Control=3'b000;
  endcase
endmodule
