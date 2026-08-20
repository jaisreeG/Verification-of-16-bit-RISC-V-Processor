class pc_test;
  virtual risc_if vif;   //virtual
  //constructor
  function new(virtual risc_if vif);  
    this.vif=vif;
  endfunction
  
  task test_pc();
    //test reset
   forever  @(posedge vif.clk)begin
      @(posedge vif.clk) begin
       if(vif.rst)begin
        if(vif.pc_current_1== 16'b0)begin
          $display("Test is passed for reset test in pc_current_1=%b, pc_next=%b [%0t]",vif.pc_current_1,vif.pc_next,$time);
        end
          else begin
            $display("Test is not passed for reset test in pc_current_1=%b,pc_next=%b [%0t]",vif.pc_current_1,vif.pc_next,$time);
          end
      end
      else begin
         if(vif.pc_current_1 ==vif.pc_next) begin
           $display("Test is passed for in pc_current_1=%b,pc_next=%b [%0t]",vif.pc_current_1,vif.pc_next,$time);
        end
          else begin
            $display("Test is not passed for reset test in pc_current_1=%b,pc_next=%b [%0t]",vif.pc_current_1,vif.pc_next,$time);
          end
      end
    end
   end
  endtask
endclass
