class data_memory;
  virtual risc_if vif;

  function new(virtual risc_if vif);  
    this.vif = vif;
  endfunction

  task data_memory_test();
    logic [2:0] ram_addr;
    #1 forever @(posedge vif.clk) begin
      ram_addr=vif.mem_access_addr[2:0];
      if (vif.mem_write) begin
  logic [2:0] expected_addr = ram_addr;
  logic [15:0] expected_data = vif.mem_write_data;

  // Wait for 1 full clock to let DUT commit the write
        @(posedge vif.clk);

          if (vif.memory[expected_addr] == expected_data) begin
    $display("DATA MEMORY PASSED: memory[%0d]=%0d, mem_write_data=%b, mem_write=%d @ %t",
              expected_addr, vif.memory[expected_addr], expected_data, vif.mem_write, $time);
          end else begin
    $display("DATA MEMORY FAILED: memory[%0d]=%0d, mem_write_data=%b, mem_write=%d @ %t",
              expected_addr, vif.memory[expected_addr], expected_data, vif.mem_write, $time);
          end
         end
    else begin
      if(vif.mem_read && !vif.mem_write)begin
        if(vif.mem_read_data==vif.memory[ram_addr])begin
          $display("DATA MEMORY PASSED: memory[%d]=%d,mem_read_data=%b,mem_read=%d @ %t",ram_addr,vif.memory[ram_addr],vif.mem_read_data,vif.mem_read,$time);
        end 
      end
      else if(!vif.mem_read && !vif.mem_write)begin
        if(vif.mem_read_data==16'b0)begin
          $display("DATA MEMORY PASSED: memory[%d]=%d,mem_read_data=%b,mem_read=%d @ %t",ram_addr,vif.memory[ram_addr],vif.mem_read_data,vif.mem_read,$time);
        end
      end
      else begin
        $display("DATA MEMORY FAILED: memory[%d]=%d,mem_read_data=%b, mem_write_data=%b @ %t",ram_addr,vif.memory[ram_addr],vif.mem_read_data,vif.mem_write_data,$time);
      end
    end  
    end
  endtask
endclass
        
        
        
