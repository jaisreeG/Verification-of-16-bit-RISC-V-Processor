`include "files.sv"
`include "interface.sv"
import tb_pkg::*; 
// `include "Parameter.v"
module test_Risc_16_bit;

 //logic reg_write_data;
  risc_if vif(); 
 // Instantiate the Unit Under Test (UUT)
 Risc_16_bit uut (
   .clk(vif.clk),
   .rst(vif.rst),
   .pc_current(vif.pc_current),
   .pc_next(vif.pc_next),
   .mem_access_addr(vif.mem_access_addr),
   .memory(vif.memory),
   .mem_write_data(vif.mem_write_data),
   .mem_read_data(vif.mem_read_data),
   .opcode(vif.opcode),
   .reg_dst(vif.reg_dst),
   .mem_to_reg(vif.mem_to_reg),
   .alu_op(vif.alu_op),
   .jump(vif.jump),
   .bne(vif.bne),
   .beq(vif.beq),
   .mem_read(vif.mem_read),
   .mem_write(vif.mem_write),
   .alu_src(vif.alu_src),
   .reg_write(vif.reg_write),
   .alu_in1(vif.alu_in1), 
   .alu_in2(vif.alu_in2),
   .ALU_out(vif.ALU_out),
   .zero_flag(vif.zero_flag),
   .ALU_Control(vif.ALU_Control),
   .reg_write_dest(vif.reg_write_dest),
   .reg_read_addr_1(vif.reg_read_addr_1),
   .reg_read_data_1(vif.reg_read_data_1),
   .reg_read_addr_2(vif.reg_read_addr_2),
   .reg_read_data_2(vif.reg_read_data_2),
   .reg_write_data(vif.reg_write_data),
   .reg_array(vif.reg_array),
   .instr(vif.instr),
   .pc2(vif.pc2),
   .PC_j(vif.PC_j),
   .PC_beq(vif.PC_beq),
   .PC_2beq(vif.PC_2beq),
   .PC_2bne(vif.PC_2bne),
   .PC_bne(vif.PC_bne),
   .beq_control(vif.beq_control),
   .bne_control(vif.bne_control),
   .jump_shift(vif.jump_shift)
 );

 initial 
  begin
   vif.clk <=1;
   vif.rst <=1;
   vif.expected_instr[0]  = 16'h0400;
   vif.expected_instr[1]  = 16'h0441;
   vif.expected_instr[2]  = 16'h2050;
   vif.expected_instr[3]  = 16'h1280;
   vif.expected_instr[4]  = 16'h3050;
   vif.expected_instr[5]  = 16'h4050;
   vif.expected_instr[6]  = 16'h5050;
   vif.expected_instr[7]  = 16'h6050;
   vif.expected_instr[8]  = 16'h7050;
   vif.expected_instr[9]  = 16'h8050;
   vif.expected_instr[10] = 16'h9050;
   vif.expected_instr[11] = 16'h2000;
   vif.expected_instr[12] = 16'hB041;
   vif.expected_instr[13] = 16'hC040;
   vif.expected_instr[14] = 16'hD000;
   //reg_write_data=16'b0;
   `simulation_time;
   $finish;
  end
  
  //run block
  initial begin
    run_block run_block_h = new(vif);
    run_block_h.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end

endmodule
