`include "Parameter.v"
// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Verilog code for data Memory
module Data_Memory(
 input clk,
 // address input, shared by read and write port
 input [15:0]   mem_access_addr,
 
 // write port
 input [15:0]   mem_write_data,
 input mem_write,
 input mem_read,
 // read port
  output [15:0]   mem_read_data,
  output reg [`col - 1:0] memory [`row_d - 1:0]
);

//reg [`col - 1:0] memory [`row_d - 1:0];
//integer f;
  wire [2:0] ram_addr;
  assign ram_addr= mem_access_addr[2:0];
initial
 begin
   memory[0]  = 16'h1; 
   memory[1]  = 16'h2; 
   memory[2]  = 16'h1; 
   memory[3]  = 16'h2; 
   memory[4]  = 16'h1; 
   memory[5]  = 16'h2; 
   memory[6]  = 16'h1; 
   memory[7]  = 16'h2;
  `simulation_time;
 end
 
  always @(posedge clk) begin
  if (mem_write)
   memory[ram_addr] <= mem_write_data;
 end
  assign mem_read_data = (mem_read==1'b1) ? memory[ram_addr]: 16'b0; 
endmodule
