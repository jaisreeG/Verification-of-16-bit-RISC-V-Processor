class instr_memory;

  // Virtual interface
  virtual risc_if vif;
  //logic [15:0] expected_instr [0:14];

  // Constructor
  function new(virtual risc_if vif);
    this.vif = vif;
  endfunction
  
  task instr_memory_test();
    logic [3:0] rom_addr;
    $display("\n--- Starting Instruction Memory Verification ---");
    #1 forever @(posedge vif.clk) begin
      rom_addr=vif.pc_current[4:1]; 
      if (vif.instr== vif.expected_instr[rom_addr]) begin
        $display("INSTR FAIL: ROM_ADDR=%0d, PC=%b: Got = %h, Expected = %h @ %t",
                 rom_addr, vif.pc_current, vif.instr, vif.expected_instr[rom_addr],$time);
      end else begin
        $display("INSTR PASS: ROM_ADDR=%0d , PC=%b: Instruction = %h @ %t",
                  rom_addr, vif.pc_current, vif.instr,$time);
      end
      $display("--- Instruction Memory Verification Ends ---\n");
    end
  endtask
endclass
