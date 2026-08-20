module ALU(
  input  [15:0] alu_in1,  //src1
  input  [15:0] alu_in2,  //src2
  input  [2:0] ALU_Control, //function sel
  output reg [15:0] ALU_out,  //result 
 output zero_flag
);

always @(*)
begin 
  case(ALU_Control)
 3'b000: ALU_out = alu_in1 + alu_in2; // add
 3'b001: ALU_out = alu_in1- alu_in2; // sub
 3'b010: ALU_out = ~alu_in1;
 3'b011: ALU_out = alu_in1<<alu_in2;
 3'b100: ALU_out = alu_in1>>alu_in2;
 3'b101: ALU_out = alu_in1 & alu_in2; // and
 3'b110: ALU_out = alu_in1 |alu_in2; // or
 3'b111: begin if (alu_in1<alu_in2) ALU_out = 16'd1;
    else ALU_out = 16'd0;
    end
 default:ALU_out = alu_in1 + alu_in2; // add
 endcase
end
  assign zero_flag = (ALU_out==16'd0) ? 1'b1: 1'b0;
endmodule
