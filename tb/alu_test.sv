class alu;
  virtual risc_if vif;

  // Constructor
  function new(virtual risc_if vif);  
    this.vif = vif;
  endfunction

  //ALU
  task alu_test();
    $display("------- Starting ALU----------");

    #1 forever @(posedge vif.clk) begin
      case (vif.ALU_Control)
        3'b000: begin 
          $display("ALU Operation: ADD (000)");
          if (vif.ALU_out == vif.alu_in1+ vif.alu_in2)
            $display("ALU: ADD Passed @ %t Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 + vif.alu_in2);
          else
            $display("ALU: ADD Failed @ %t . Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 + vif.alu_in2);
        end

        3'b001: begin  
          $display("ALU Operation: SUB (001)");
          if (vif.ALU_out == vif.alu_in1 - vif.alu_in2)
            $display("ALU: SUB Passed @ %t Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 - vif.alu_in2);
          else
            $display("ALU: SUB Failed @ %t . Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 - vif.alu_in2);
        end

        3'b010: begin 
          $display("ALU Operation: NOT (010)");
          if (vif.ALU_out == ~vif.alu_in1)
            $display("ALU: NOT Passed @ %t alu_in1: %0d, ALU-out=%d",$time, vif.alu_in1,vif.ALU_out);
          else
            $display("ALU: NOT Failed @ %t. Got: %0d, Expected: %0d",$time, vif.ALU_out, ~vif.alu_in1);
        end

        3'b011: begin  // LEFT SHIFT
          $display("ALU Operation: LEFT SHIFT (011)");
          if (vif.ALU_out == vif.alu_in1 << vif.alu_in2)
            $display("ALU: LEFT SHIFT Passed @ %t : Got: %0d, Expected: %d",$time, vif.ALU_out, vif.alu_in1<< vif.alu_in2);
          else
            $display("ALU: LEFT SHIFT Failed @ %t. Got: %0d, Expected: %d",$time,vif.ALU_out, vif.alu_in1<< vif.alu_in2);
        end

        3'b100: begin  // RIGHT SHIFT
          $display("ALU Operation: RIGHT SHIFT (100)");
          if (vif.ALU_out == vif.alu_in1 >> vif.alu_in2)
            $display("ALU: RIGHT SHIFT Passed @ %t. Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 >> vif.alu_in2);
          else
            $display("ALU: RIGHT SHIFT Failed @ %t. Got: %0d, Expected: %d",$time, vif.ALU_out, vif.alu_in1 >> vif.alu_in2);
        end

        3'b101: begin  // AND
          $display("ALU Operation: AND (101)");
          if (vif.ALU_out== (vif.alu_in1 & vif.alu_in2))
            $display("ALU: AND Passed @ %t. Got: %d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 & vif.alu_in2);
          else
            $display("ALU: AND Failed @ %t. Got: %d, Expected: %d",$time, vif.ALU_out, vif.alu_in1 & vif.alu_in2);
        end

        3'b110: begin  // OR
          $display("ALU Operation: OR (110)");
          if (vif.ALU_out == (vif.alu_in1 | vif.alu_in2))
            $display("ALU: OR Passed @ %t. Got: %d, Expected: %d",$time, vif.ALU_out, vif.alu_in1 | vif.alu_in2);
          else
            $display("ALU: OR Failed @ %t. Got: %d, Expected: %d",$time, vif.ALU_out, vif.alu_in1 | vif.alu_in2);
        end

        3'b111: begin  // LESSER
          $display("ALU Operation: LESSER (111)");
          if ((vif.alu_in1 < vif.alu_in2 && vif.ALU_out == 16'b1) ||
              (vif.alu_in1 >= vif.alu_in2 && vif.ALU_out == 16'b0))
            $display("ALU: LESSER Passed @ %t. alu_in1 = %0d, alu_in2 = %0d, result = %d", $time,vif.alu_in1, vif.alu_in2, vif.ALU_out);
          else
            $display("ALU: LESSER Failed @ %t. alu_in1 = %0d, alu_in2 = %0d, result = %0d", $time,vif.alu_in1, vif.alu_in2, vif.ALU_out);
        end

        default: begin
          if (vif.ALU_out == vif.alu_in1 + vif.alu_in2)
            $display("ALU: ADD Passed @ %t. Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 + vif.alu_in2);
          else
            $display("ALU: ADD Failed @ %t. Got: %0d, Expected: %0d",$time, vif.ALU_out, vif.alu_in1 + vif.alu_in2);
        end
      endcase
      if(vif.ALU_out==16'b0 && vif.zero_flag) begin
        $display("zero_flag set @ %t: zero=%b, ALU_out=%b",$time,vif.zero_flag,vif.ALU_out);
      end
      else if (vif.ALU_out==16'b0 && !vif.zero_flag)  begin
        $display(" zero_flag must be set @ %t: zero=%b, ALU_out=%b",$time,vif.zero_flag,vif.ALU_out);
      end
      else if(vif.ALU_out!=16'b0 && !vif.zero_flag)begin
        $display("zero_flag not set @ %t: zero=%b, ALU_out=%b",$time,vif.zero_flag,vif.ALU_out);
      end
      else begin
        $display("zero_flag must not set @ %t: zero=%b, ALU_out=%b ",$time,vif.zero_flag,vif.ALU_out);
      end
      $display("-- ALU ENDS--\n");
    end
  endtask
endclass
