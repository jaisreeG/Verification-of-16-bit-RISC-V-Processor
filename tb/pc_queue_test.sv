class pc_test;
  virtual risc_if vif;

  function new(virtual risc_if vif);  
    this.vif = vif;
  endfunction

  task test_pc();
    int cycle = 0;
    logic [15:0] prev_pc_next; // change width according to your PC signal

      forever @(posedge vif.clk) begin
      // Collect current values
      #1 vif.pc_current_queue.push_back(vif.pc_current);
       vif.pc_next_queue.push_back(vif.pc_next);
      if(vif.rst) begin
        prev_pc_next = 16'b0010;
        if(vif.pc_current !== 16'b0) begin
          $display("PC FAIL: mismatch at pc_current = %0h not equal to zero ,pc_current_queue=%p,vif.pc_next_queue=%p", 
   vif.pc_current,vif.pc_current_queue,vif.pc_next_queue);
        end else begin
          $display("PC PASS @ %t: pc_current = %0h matches zero pc_current_queue=%p,vif.pc_next_queue=%p",$time,
                   vif.pc_current,vif.pc_current_queue,vif.pc_next_queue);
        end
      end
     else begin
      // Start comparing from 2nd cycle onward
       #1 if (cycle >= 0) begin
        if (vif.pc_current !== prev_pc_next) begin
          $display("PC FAIL: mismatch at pc_current = %0h, previous pc_next = %0h,pc_current_queue=%p,vif.pc_next_queue=%p", 
   vif.pc_current, prev_pc_next,vif.pc_current_queue,vif.pc_next_queue);
        end else begin
          $display("PC PASS @ %t: pc_current = %0h matches previous pc_next = %0hpc_current_queue=%p,vif.pc_next_queue=%p", $time,
                   vif.pc_current, prev_pc_next,vif.pc_current_queue,vif.pc_next_queue);
        end
      end

      // Update previous pc_next for next cycle's comparison
      prev_pc_next = vif.pc_next;
      cycle++;
    end
    end
  endtask
endclass



