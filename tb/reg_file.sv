class reg_file;

  virtual risc_if vif;
  // Constructor
  function new(virtual risc_if vif);
    this.vif = vif;
  endfunction
 //ok
  task reg_file_test();
    $display("------Reg start-----");
   forever @(posedge vif.clk) begin 
      if (vif.reg_read_data_1 != vif.reg_array[vif.reg_read_addr_1]) begin
          $display("REG_FILE FAIL @ %t: reg_read_data_1 mismatch. Reg[%0d] Expected = %0d, Got = %0d",$time,
                    vif.reg_read_addr_1, vif.reg_array[vif.reg_read_addr_1], vif.reg_read_data_1);
        end
        else begin
          $display("REG_FILE PASS @ %t: reg_read_data_1 match. Reg[%0d] = %0d",$time, 
                    vif.reg_read_addr_1, vif.reg_read_data_1);
        end
        if (vif.reg_read_data_2 != vif.reg_array[vif.reg_read_addr_2])begin
          $display("REG_FILE FAIL @ %t : reg_read_data_2 mismatch. Reg[%0d] Expected = %0d, Got = %0d",$time,
                    vif.reg_read_addr_2, vif.reg_array[vif.reg_read_addr_2], vif.reg_read_data_2);
        end
        else begin
          $display("REG_FILE PASS @ %t: reg_read_data_2 match. Reg[%0d] = %0d",$time,vif.reg_read_addr_2, vif.reg_read_data_2);
        end
      if (vif.rst) begin
         @(posedge vif.clk);
        if (vif.reg_read_data_1 == 16'd0)
          $display("REG_FILE PASS: reg_read_data_1 reset to 0 @ %t",$time);
        else
          $display("REG_FILE FAIL: reg_read_data_1 not reset. Got = %0d @ %t ", vif.reg_read_data_1,$time);

        if (vif.reg_read_data_2 == 16'd0)
          $display("REG_FILE PASS: reg_read_data_2 reset to 0 @ %t",$time);
        else
          $display("REG_FILE FAIL: reg_read_data_2 not reset. Got = %0d @ %t", vif.reg_read_data_2,$time);
      end
      else begin
        if (vif.reg_write) begin
        logic [2:0] expected_addr = vif.reg_write_dest ;
        logic [15:0] expected_data = vif.reg_write_data;

  // Wait for 1 full clock to let DUT commit the write
        @(posedge vif.clk);

        if (vif.reg_array[expected_addr] == expected_data) begin
          $display("REG_FILE PASS: memory[%0d]=%0d, mem_write_data=%b, mem_write=%d @ %t",
              expected_addr, vif.reg_array[expected_addr], expected_data, vif.mem_write, $time);
          end else begin
            $display("REG_FILE FAIL: memory[%0d]=%0d, mem_write_data=%b, mem_write=%d @ %t",
              expected_addr, vif.reg_array[expected_addr], expected_data, vif.mem_write, $time);
          end
         end
      end
      $display("-----Reg end -----");
    end

  endtask
endclass
