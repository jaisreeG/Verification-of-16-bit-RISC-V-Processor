class alu_control;

  // Virtual interface handle
  virtual risc_if vif;

  // Constructor
  function new(virtual risc_if vif);
    this.vif = vif;
  endfunction

  task alu_control_input_generate_test();
    logic [5:0] control_in;
    //logic [2:0] expected_ALU_Cnt;can't call in different tasks at same class so i called it in interface...bcz the value assigned to it is in one task and comparing happening in another task.

   #1 forever @(posedge vif.clk) begin
      control_in = {vif.alu_op, vif.opcode};

      if (vif.alu_op == 2'b10) begin
        vif.expected_ALU_Cnt = 3'b000;
      end
      else if (vif.alu_op == 2'b01) begin
        vif.expected_ALU_Cnt = 3'b001;
      end
      else if (control_in == 6'b000010) begin
        vif.expected_ALU_Cnt = 3'b000;
      end
      else if (control_in == 6'b000011) begin
        vif.expected_ALU_Cnt = 3'b001;
      end
      else if (control_in == 6'b000100) begin
        vif.expected_ALU_Cnt = 3'b010;
      end
      else if (control_in == 6'b000101) begin
        vif.expected_ALU_Cnt = 3'b011;
      end
      else if (control_in == 6'b000110) begin
        vif.expected_ALU_Cnt = 3'b100;
      end
      else if (control_in == 6'b000111) begin
        vif.expected_ALU_Cnt = 3'b101;
      end
      else if (control_in == 6'b001000) begin
        vif.expected_ALU_Cnt = 3'b110;
      end
      else if (control_in == 6'b001001) begin
        vif.expected_ALU_Cnt = 3'b111;
      end
      else begin
        vif.expected_ALU_Cnt = 3'b000;
      end
    end
  endtask
  task alu_control_compare_test();
    #1 forever @(posedge vif.clk) begin
      if (vif.ALU_Control !== vif.expected_ALU_Cnt) begin
        $display("ALU_CONTROL FAIL @ %t : ALUOp=%b Opcode=%b, Got ALU_Cnt=%b ,Expected=%b",
                  $time, vif.alu_op, vif.opcode, vif.ALU_Control, vif.expected_ALU_Cnt);
      end
      else begin
        $display("ALU_CONTROL PASS @ %t: ALUOp=%b Opcode=%b , ALU_Cnt=%b",
                  $time, vif.alu_op, vif.opcode, vif.ALU_Control);
      end
    end
  endtask
  task alu_run_test();
    fork
      alu_control_input_generate_test();
      alu_control_compare_test();
    join
  endtask
endclass
