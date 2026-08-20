class control_unit;
  virtual risc_if vif;

  function new(virtual risc_if vif);  
    this.vif = vif;
  endfunction

  task control_unit_test();
    #1 forever @(posedge vif.clk) begin
      case (vif.opcode)
        4'b0000: begin
          $display("CONTROL_UNIT Operation: opcode (0000)");
          if (vif.reg_dst == 1'b0 && vif.alu_src==1'b1 && vif.mem_to_reg==1'b1 && vif.reg_write==1'b1 && vif.mem_read==1'b1 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b10 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        4'b0001: begin  
          $display("CONTROL_UNIT Operation: opcode (0001)");
          if (vif.reg_dst == 1'b0 && vif.alu_src==1'b1 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b0 && vif.mem_read==1'b0 && vif.mem_write==1'b1 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b10 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        4'b0010: begin  
          $display("CONTROL_UNIT Operation: opcode (0010)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        4'b0011: begin 
          $display("CONTROL_UNIT Operation: opcode (0011)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        4'b0100: begin
          $display("CONTROL_UNIT Operation: opcode (0100)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        4'b0101: begin 
          $display("CONTROL_UNIT Operation: opcode (0100)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

       4'b0110: begin  
         $display("CONTROL_UNIT Operation: opcode (0110)");
         if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        4'b0111: begin  
          $display("CONTROL_UNIT Operation: opcode (0111)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end
        
        4'b1000: begin 
          $display("CONTROL_UNIT Operation: opcode (1000)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end
        
        4'b1001: begin 
          $display("CONTROL_UNIT Operation: opcode (1001)");
          if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end
        
        4'b1011: begin 
          $display("CONTROL_UNIT Operation: opcode (1011");
          if (vif.reg_dst == 1'b0 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b0 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b1 && vif.bne== 1'b0 && vif.alu_op == 2'b01 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end
        
        4'b1100: begin  
          $display("CONTROL_UNIT Operation: opcode (1100)");
          if (vif.reg_dst == 1'b0 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b0 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b1 && vif.alu_op == 2'b01 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end
        
        4'b1101: begin  
          $display("CONTROL_UNIT Operation: opcode (1101)");
          if (vif.reg_dst == 1'b0 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b0 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b1)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end

        default: begin
            $display("CONTROL_UNIT Operation: default case");
            if (vif.reg_dst == 1'b1 && vif.alu_src==1'b0 && vif.mem_to_reg==1'b0 && vif.reg_write==1'b1 && vif.mem_read==1'b0 && vif.mem_write==1'b0 && vif.beq==1'b0 && vif.bne== 1'b0 && vif.alu_op == 2'b00 && vif.jump == 1'b0)begin
            $display("CONTROL_UNIT Passed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
          else begin
            $display("CONTROL_UNIT Failed @ %t:reg_dst = %b; alu_src = %b; mem_to_reg = %b; reg_write = %b; mem_read = %b; mem_write = %b; beq = %b; bne = %b; alu_op =%b;jump = %b",$time,vif.reg_dst,vif.alu_src, vif.mem_to_reg,vif.reg_write,vif.mem_read, vif.mem_write,vif.beq,vif.bne, vif.alu_op,vif.jump);
          end
        end
      endcase

      $display("-- CONTROL_UNIT ENDS--\n");
    end
  endtask
endclass
    
