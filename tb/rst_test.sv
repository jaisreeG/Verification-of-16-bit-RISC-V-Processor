//reset_test generation
class rsttest_generate;
  virtual risc_if vif;   //virtual
  //constructor
  function new(virtual risc_if vif);  
    this.vif=vif;
  endfunction
  
  task rsttest_gen(); 
    $display("Reset_test generated at [%0t]",$time);
    #50 vif.rst=~vif.rst;
    #10 vif.rst=~vif.rst;
    $display("Reset_test trigger initiated at [%0t]",$time);
   endtask
endclass
