class data_path;
  virtual risc_if vif;
  function new(virtual risc_if vif); 
    this.vif = vif;
  endfunction
  
  task data_path_test();
    logic expected_bne_control;
    logic expected_beq_control;
    logic expected_PC_j;
    #1 forever @(posedge vif.clk) begin
      expected_bne_control = vif.bne & (~vif.zero_flag);
      expected_beq_control = vif.beq & vif.zero_flag;
      expected_PC_j={vif.pc2[15:13],vif.jump_shift};
  //1
    if( expected_beq_control == vif.beq_control) begin
      $display("beq_control correctly assigned: beq_control:%0d, expected_beq_control:%0d",vif.beq_control,expected_beq_control);
      if(expected_beq_control) begin       
        if(vif.PC_2beq == vif.PC_beq) begin
          $display("PC_2beq correctly assigned @ %t: Pc_2beq=%0d,PC_beq=%0d",$time,vif.PC_2beq,vif.PC_beq);
        end
        else begin
          $display("PC_2beq  not correctly assigned @ %t: Pc_2beq=%0d,PC_beq=%0d",$time,vif.PC_2beq,vif.PC_beq);
        end
      end
      else begin
        if(vif.PC_2beq == vif.pc2) begin
          $display("PC_2beq correctly assigned @ %t: Pc_2beq=%0d,pc2=%0d",$time,vif.PC_2beq,vif.pc2);
        end
        else begin
          $display("PC_2beq not correctly assigned @ %t: Pc_2beq=%0d,pc2=%0d",$time,vif.PC_2beq,vif.pc2);
        end
      end
    end
    else begin
        $display("beq control not correctly assigned  @ %t: beq_control:%0d, expected_beq_control:%d",$time,vif.beq_control,expected_beq_control);
    end
    
    //2
    if( vif.bne_control == expected_bne_control) begin
      $display("bne control correctly assigned @ %t: bne_control:%0d, expected_bne_control:%0d",$time,vif.bne_control,expected_bne_control);
      //if(bne_control) begin
      if(expected_bne_control)begin
        if(vif.PC_2bne == vif.PC_bne ) begin
          $display("PC_2bne correctly assigned @ %t:PC_2bne:%0d,PC_bne:%0d",$time,vif.PC_2bne,vif.PC_bne);
        end
        else begin
          $display("PC_2bne not correctly assigned @ %t:PC_2bne:%0d,PC_bne:%0d ",$time,vif.PC_2bne,vif.PC_bne);
        end
      end
      else begin
        if(vif.PC_2bne == vif.PC_2beq) begin
          $display("PC_2bne correctly assigned @ %t:PC_2bne:%0d,PC_2beq:%0d ",$time,vif.PC_2bne,vif.PC_2beq);
        end
        else begin
          $display("PC_2bne not correctly assigned  @ %t:PC_2bne:%0d,PC_bne:%0d ",$time,vif.PC_2bne,vif.PC_2beq);
        end
      end
    end
   else begin
       $display("bne control FAIL @ %t: bne_control:%0d, expected_bne_control:%0d",$time,vif.bne_control,expected_bne_control);
   end 
    
    if(vif.jump)begin
      if(vif.pc_next == vif.PC_j ) begin
        $display("pc_next correctly assigned @ %t:PC_2bne:%0d,PC_bne:%0d",$time,vif.pc_next ,vif.PC_j);
        end
        else begin
          $display("pc_next not correctly assigned @ %t:pc_next:%0d,PC_j:%0d ",$time,vif.pc_next,vif.PC_j);
        end
      end
     else begin
       if(vif.pc_next == vif.PC_2bne ) begin
         $display("pc_next correctly assigned @ %t:PC_2bne:%0d,PC_bne:%0d",$time,vif.pc_next ,vif.PC_2bne);
        end
        else begin
          $display("pc_next not correctly assigned @ %t:pc_next:%0d,PC_j:%0d ",$time,vif.pc_next,vif.PC_2bne);
        end
      end
    end
  endtask
endclass
