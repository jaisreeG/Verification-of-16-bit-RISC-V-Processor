//reset generation
class rst_generate;
  virtual risc_if vif;   //virtual
  //constructor
  function new(virtual risc_if vif);  
    this.vif=vif;
  endfunction
  
  task rst_gen(); 
    $display("Reset generated at [%0t]",$time);
    #10vif.rst=~vif.rst;
    $display("Reset trigger initiated at [%0t]",$time);
   endtask
endclass
