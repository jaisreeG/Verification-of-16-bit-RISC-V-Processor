`include "Parameter.v"
// Verilog code for RISC Processor 
// Verilog code for Instruction Memory
module Instruction_Memory(
  input[15:0] pc_current,
  output[15:0] instr
);

 reg [`col - 1:0] memory [`row_i - 1:0];
 wire [3 : 0] rom_addr = pc_current[4 : 1];
 initial
 begin
  //$readmemb("./test/test.prog", memory,0,14);
   memory[0]  = 16'h0400; // load R0 <- Mem(R2 + 0)
   memory[1]  = 16'h0441; // load R1 <- Mem(R2 + 1)
   memory[2]  = 16'h2050; // Add R2 <- R0 + R1
   memory[3]  = 16'h1280; // Store Mem(R1 + 0) <- R2
   memory[4]  = 16'h3050; // Sub R2 <- R0 - R1
   memory[5]  = 16'h4050; // Invert R2 <- !R0
   memory[6]  = 16'h5050; // Logical shift left R2 <- R0 << R1
   memory[7]  = 16'h6050; // Logical shift right R2 <- R0 >> R1
   memory[8]  = 16'h7050; // AND R2 <- R0 AND R1
   memory[9]  = 16'h8050; // OR R2 <- R0 OR R1
   memory[10] = 16'h9050; // SLT R2 <- 1 if R0 < R1
   memory[11] = 16'h2000; // Add R0 <- R0 + R0
   memory[12] = 16'hB041; // BEQ if R0 == R1
   memory[13] = 16'hC040; // BNE if R0 != R1
   memory[14] = 16'hD000; // Possibly HALT or custom instruction

 end
  assign instr= memory[rom_addr];
//   initial begin
//     $monitor("instruction =%b\n, rom_addr=%d, time = %t",memory[rom_addr],rom_addr, $time);
//   end

endmodule
