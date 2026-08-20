// Run block for testbench
class run_block;
  virtual risc_if vif;
  
  // Constructor
  function new(virtual risc_if vif);
    this.vif = vif;
  endfunction
  
 task run();
  clk_generate clk_generate_h = new(vif);
  rst_generate rst_generate_h = new(vif);
  pc_test pc_test_h = new(vif);
  rsttest_generate rsttest_generate_h = new(vif);
  data_memory data_memory_h=new(vif);
  control_unit control_unit_h=new(vif);
  alu alu_h=new(vif);
  alu_control alu_control_h=new(vif);
  reg_file reg_file_h=new(vif);
  instr_memory instr_memory_h=new(vif);
   data_path data_path_h=new(vif);

  // Run all simulation processes in parallel
  fork
    clk_generate_h.clk_gen();
    rst_generate_h.rst_gen();
    pc_test_h.test_pc();
    rsttest_generate_h.rsttest_gen();
    data_memory_h.data_memory_test();
    control_unit_h.control_unit_test();
    alu_h.alu_test();
    alu_control_h.alu_run_test();
    reg_file_h.reg_file_test();
    instr_memory_h.instr_memory_test();
    data_path_h.data_path_test();
  join
  endtask
endclass
