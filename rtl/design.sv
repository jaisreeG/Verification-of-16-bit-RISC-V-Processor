`include "alu.v"
`include "alu_control.v"
`include "inst_mem.v"
`include "reg_file.v"
`include "data_mem.v"
`include "control_unit.v"
`include "data_path.v"

module Risc_16_bit(
 input clk,
 input rst,
 output reg [15:0]pc_current,
  output reg [15:0]pc_next,
 output reg [15:0]mem_access_addr,
  output reg [15:0]mem_write_data,
  output reg [15:0]mem_read_data,
  output reg [`col - 1:0] memory [`row_d - 1:0],
  output reg [3:0] opcode,
  output reg[1:0] alu_op,
  output reg jump,beq,bne,mem_read,mem_write,alu_src,reg_dst,mem_to_reg,reg_write,
  output reg [15:0] alu_in1, 
  output reg  [15:0] alu_in2,
  output reg [15:0] ALU_out,
  output reg zero_flag,
  output reg [2:0] ALU_Control,
  output reg [2:0] reg_write_dest,
  output reg [2:0] reg_read_addr_1,
  output reg [15:0] reg_read_data_1,
  output reg [2:0] reg_read_addr_2,
  output reg [15:0] reg_read_data_2,
  output reg [15:0]reg_write_data,
  output reg [15:0] reg_array [7:0],
  output reg [15:0] instr,
  output reg [15:0] pc2,
  output reg [15:0] PC_j,
  output reg [15:0] PC_beq, PC_2beq,PC_2bne,PC_bne,
  output reg beq_control,
  output reg bne_control,
  output reg [12:0] jump_shift
);
//  wire jump,bne,beq,alu_src,reg_dst,mem_to_reg,reg_write;
//  wire[1:0] alu_op;
//  wire [3:0] opcode;
//  wire [15:0] reg_write_data;
 // Datapath
 Datapath_Unit DU
 (
  .clk(clk),
  .rst(rst),
  .pc_current(pc_current),
  .pc_next(pc_next),
  .mem_access_addr(mem_access_addr),
   .mem_write_data(mem_write_data),
   .mem_read_data(mem_read_data),
   .memory(memory),
   .alu_in1(alu_in1), 
   .alu_in2(alu_in2),
   .ALU_out(ALU_out),
   .zero_flag(zero_flag),
   .ALU_Control(ALU_Control),
  .jump(jump),
  .beq(beq),
  .mem_read(mem_read),
  .mem_write(mem_write),
  .alu_src(alu_src),
  .reg_dst(reg_dst),
  .mem_to_reg(mem_to_reg),
  .reg_write(reg_write),
  .bne(bne),
  .alu_op(alu_op),
  .opcode(opcode),
   .reg_write_dest(reg_write_dest),
   .reg_read_addr_1(reg_read_addr_1),
   .reg_read_data_1(reg_read_data_1),
   .reg_read_addr_2(reg_read_addr_2),
   .reg_read_data_2(reg_read_data_2),
   .reg_write_data(reg_write_data),
   .reg_array(reg_array),
   .instr(instr),
   .pc2(pc2),
   .PC_j(PC_j),
   .PC_beq(PC_beq),
   .PC_2beq(PC_2beq),
   .PC_2bne(PC_2bne),
   .PC_bne(PC_bne),
   .beq_control(beq_control),
   .bne_control(bne_control),
   .jump_shift(jump_shift)
 );
 // control unit
 Control_Unit control
 (
  .opcode(opcode),
  .reg_dst(reg_dst),
  .mem_to_reg(mem_to_reg),
  .alu_op(alu_op),
  .jump(jump),
  .bne(bne),
  .beq(beq),
  .mem_read(mem_read),
  .mem_write(mem_write),
  .alu_src(alu_src),
  .reg_write(reg_write)
 );
endmodule
