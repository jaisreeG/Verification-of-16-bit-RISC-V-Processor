module Datapath_Unit(
 input clk,
 input rst,
 output reg[15:0] pc_current,
 output reg [15:0] pc_next,
 output reg [15:0] mem_access_addr,
 output reg [15:0]mem_write_data,
 output reg [15:0] mem_read_data,
 output reg [`col - 1:0] memory [`row_d - 1:0],
 output reg [15:0] alu_in1, 
 output reg [15:0] alu_in2,
 output reg [15:0] ALU_out,
 output reg zero_flag,
 output reg [2:0] ALU_Control,
 output reg [2:0] reg_write_dest,
 output reg [2:0] reg_read_addr_1,
 output reg [15:0] reg_read_data_1,
 output reg [2:0] reg_read_addr_2,
 output reg [15:0] reg_read_data_2,
 output [15:0]reg_write_data,
 output reg [15:0] reg_array [7:0],
 output reg [15:0]instr,
 output reg [15:0] pc2,
 output reg [15:0] PC_j, PC_beq, PC_2beq,PC_2bne,PC_bne,
 output reg beq_control,
 output reg bne_control,
 output reg [12:0] jump_shift,
 input jump,beq,mem_read,mem_write,alu_src,reg_dst,mem_to_reg,reg_write,bne,
 input[1:0] alu_op,
 output[3:0] opcode
);
//  wire [15:0] pc2;
//  wire [15:0] instr;
//  wire [2:0] reg_write_dest;
//  wire [2:0] reg_read_addr_1;
//  wire [15:0] reg_read_data_1;
//  wire [2:0] reg_read_addr_2;
//  wire [15:0] reg_read_data_2;
 wire [15:0] ext_im,read_data2;
//  wire [15:0] PC_j, PC_beq, PC_2beq,PC_2bne,PC_bne;
//  wire beq_control;
//  wire bne_control;
//  wire [12:0] jump_shift;
 //setting reset for pc
  always @ (posedge clk) begin
    if(rst) begin
      pc_current <= 16'b0;
//      $display("pc_current=%b, pc_next=%b, rst=%b, time =%t",pc_current,pc_next,rst,$time);
   end
   else begin
     pc_current <= pc_next;
//      $display("pc_current=%b, pc_next=%b, rst=%b, time =%t",pc_current,pc_next,rst, $time);
   end 
  end 
  //always @(posedge clk or negedge clk) begin
   assign pc2 = pc_current + 16'd2;
   // instruction memory
  Instruction_Memory im(.pc_current(pc_current),.instr(instr));
   // jump shift left 2
   assign jump_shift = {instr[11:0],1'b0};
   // output to control unit
   assign opcode = instr[15:12];
   // multiplexer regdest
   assign reg_write_dest = (reg_dst==1'b1) ? instr[5:3] :instr[8:6];
   // register file
   assign reg_read_addr_1 = instr[11:9];
   assign reg_read_addr_2 = instr[8:6];

 // GENERAL PURPOSE REGISTERs
 GPRs reg_file
 (
  .clk(clk),
  .rst(rst),
  .reg_write(reg_write),
  .reg_write_dest(reg_write_dest),
  .reg_write_data(reg_write_data),
  .reg_read_addr_1(reg_read_addr_1),
  .reg_read_data_1(reg_read_data_1),
  .reg_read_addr_2(reg_read_addr_2),
  .reg_read_data_2(reg_read_data_2),
  .reg_array(reg_array)
 );
 // immediate extend
 assign ext_im = {{10{instr[5]}},instr[5:0]};  
 // ALU control unit
  alu_control ALU_Control_unit(.alu_op(alu_op),.opcode(opcode),.ALU_Control(ALU_Control));
 // multiplexer alu_src
 assign read_data2 = (alu_src==1'b1) ? ext_im : reg_read_data_2;
 // ALU 
  assign alu_in1=reg_read_data_1;
  assign alu_in2=read_data2;
  ALU alu_unit(.alu_in1(alu_in1),.alu_in2(alu_in2),.ALU_Control(ALU_Control),.ALU_out(ALU_out),.zero_flag(zero_flag));
 // PC beq add
 assign PC_beq = pc2 + {ext_im[14:0],1'b0};
 assign PC_bne = pc2 + {ext_im[14:0],1'b0};
 // beq control
 assign beq_control = beq & zero_flag;
 assign bne_control = bne & (~zero_flag);
 // PC_beq
 assign PC_2beq = (beq_control==1'b1) ? PC_beq : pc2;
 // PC_bne
 assign PC_2bne = (bne_control==1'b1) ? PC_bne : PC_2beq;
 // PC_j
 assign PC_j = {pc2[15:13],jump_shift};
 // PC_next
 assign pc_next = (jump == 1'b1) ? PC_j :  PC_2bne;
 
 /// Data memory
  assign mem_access_addr=ALU_out;
  assign mem_write_data=reg_read_data_2;
  
  Data_Memory dm
   (
    .clk(clk),
    .mem_access_addr(mem_access_addr),
    .mem_write_data(mem_write_data),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .memory(memory),
    .mem_read_data(mem_read_data)
   );
 
 // write back
  assign reg_write_data = (mem_to_reg == 1'b1)?  mem_read_data: ALU_out;
//    initial begin
//      $monitor("instr=%h,reg_write_data=%b,opcode=%b,pc2=%b,bne_control=%b,beq_control=%b,PC_beq=%b,PC_bne=%b,pc_j=%b,pc_next=%b, pc_current=%b,time=%t",instr,reg_write_data,opcode,pc2,bne_control,beq_control,PC_beq,PC_bne,PC_j,pc_next,pc_current,$time);
//    end
//  /*// output to control unit
//  assign opcode = instr[15:12];*/
endmodule
