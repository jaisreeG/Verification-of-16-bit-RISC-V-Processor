class clk_generate;
  virtual risc_if vif;   //virtual  
  //constructor
  function new(virtual risc_if vif);  
    this.vif=vif;
  endfunction
  
    task clk_gen();
      $display("Clock generation initated at:[%0t]",$time);
      forever #5 vif.clk=~vif.clk;
      $display("Clock generation completed at:[%0t]",$time);
    endtask
endclass
