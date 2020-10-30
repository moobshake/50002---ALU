/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module fsm_AUTO_8 (
    input clk,
    input rst,
    input [1:0] button,
    input [23:0] in,
    output reg [15:0] aluOut,
    output reg [31:0] displayOUT,
    output reg [5:0] opOUT,
    output reg inputMode
  );
  
  
  
  reg [15:0] M_first_d, M_first_q = 1'h0;
  reg [15:0] M_second_d, M_second_q = 1'h0;
  reg [5:0] M_opcode_d, M_opcode_q = 1'h0;
  reg [15:0] M_result_d, M_result_q = 1'h0;
  reg [0:0] M_z_d, M_z_q = 1'h0;
  reg [0:0] M_v_d, M_v_q = 1'h0;
  reg [0:0] M_n_d, M_n_q = 1'h0;
  reg [31:0] M_display_d, M_display_q = 1'h0;
  reg [0:0] M_inputModeStore_d, M_inputModeStore_q = 1'h0;
  localparam MANUAL_brain = 2'd0;
  localparam IDLE_brain = 2'd1;
  localparam TESTAUTO_brain = 2'd2;
  localparam TESTAUTOINPUT_brain = 2'd3;
  
  reg [1:0] M_brain_d, M_brain_q = MANUAL_brain;
  localparam ADD_autoBrain = 4'd0;
  localparam SUB_autoBrain = 4'd1;
  localparam AND_autoBrain = 4'd2;
  localparam OR_autoBrain = 4'd3;
  localparam XOR_autoBrain = 4'd4;
  localparam ALDR_autoBrain = 4'd5;
  localparam SHL_autoBrain = 4'd6;
  localparam SHR_autoBrain = 4'd7;
  localparam SRA_autoBrain = 4'd8;
  localparam CMPEQ_autoBrain = 4'd9;
  localparam CMPLT_autoBrain = 4'd10;
  localparam CMPLE_autoBrain = 4'd11;
  
  reg [3:0] M_autoBrain_d, M_autoBrain_q = ADD_autoBrain;
  localparam INPUTA_autoInputBrain = 2'd0;
  localparam INPUTB_autoInputBrain = 2'd1;
  localparam RUN_autoInputBrain = 2'd2;
  
  reg [1:0] M_autoInputBrain_d, M_autoInputBrain_q = INPUTA_autoInputBrain;
  
  wire [16-1:0] M_alu_out;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu16bit_12 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  localparam ADDOP = 6'h00;
  
  localparam ADDTESTA = 16'h0001;
  
  localparam ADDTESTB = 16'h0001;
  
  localparam ADDCORRECT = 16'h0002;
  
  localparam ADDCORRECTZVN = 3'h0;
  
  localparam SUBOP = 6'h01;
  
  localparam SUBTESTA = 16'h0003;
  
  localparam SUBTESTB = 16'h0002;
  
  localparam SUBCORRECT = 16'h0001;
  
  localparam SUBCORRECTZVN = 3'h0;
  
  localparam ANDOP = 6'h18;
  
  localparam ANDTESTA = 16'h65c5;
  
  localparam ANDTESTB = 16'h1553;
  
  localparam ANDCORRECT = 16'h0541;
  
  localparam ANDCORRECTZVN = 3'h0;
  
  localparam OROP = 6'h1e;
  
  localparam ORTESTA = 16'h65c5;
  
  localparam ORTESTB = 16'h1553;
  
  localparam ORCORRECT = 16'h75d7;
  
  localparam ORCORRECTZVN = 3'h0;
  
  localparam XOROP = 6'h16;
  
  localparam XORTESTA = 16'h65c5;
  
  localparam XORTESTB = 16'h1553;
  
  localparam XORCORRECT = 16'h7091;
  
  localparam XORCORRECTZVN = 3'h0;
  
  localparam ALDROP = 6'h1a;
  
  localparam ALDRTESTA = 16'h65c5;
  
  localparam ALDRTESTB = 16'h1553;
  
  localparam ALDRCORRECT = 16'h65c5;
  
  localparam ALDRCORRECTZVN = 3'h0;
  
  localparam SHLOP = 6'h20;
  
  localparam SHLTESTA = 16'h0203;
  
  localparam SHLTESTB = 16'h0207;
  
  localparam SHLCORRECT = 16'h0002;
  
  localparam SHLCORRECTZVN = 3'h0;
  
  localparam SHROP = 6'h21;
  
  localparam SHRTESTA = 16'h8000;
  
  localparam SHRTESTB = 16'h0001;
  
  localparam SHRCORRECT = 16'h0002;
  
  localparam SHRCORRECTZVN = 3'h0;
  
  localparam SRAOP = 6'h23;
  
  localparam SRATESTA = 16'h000c;
  
  localparam SRATESTB = 16'h0001;
  
  localparam SRACORRECT = 16'h0002;
  
  localparam SRACORRECTZVN = 3'h0;
  
  localparam CMPEQOP = 6'h33;
  
  localparam CMPEQTESTA = 16'h0203;
  
  localparam CMPEQTESTB = 16'h0207;
  
  localparam CMPEQCORRECT = 16'h0002;
  
  localparam CMPEQCORRECTZVN = 3'h0;
  
  localparam CMPLTOP = 6'h35;
  
  localparam CMPLTTESTA = 16'h8000;
  
  localparam CMPLTTESTB = 16'h0001;
  
  localparam CMPLTCORRECT = 16'h0002;
  
  localparam CMPLTCORRECTZVN = 3'h0;
  
  localparam CMPLEOP = 6'h37;
  
  localparam CMPLETESTA = 16'h000c;
  
  localparam CMPLETESTB = 16'h0001;
  
  localparam CMPLECORRECT = 16'h0002;
  
  localparam CMPLECORRECTZVN = 3'h0;
  
  localparam SLOWCLOCK_SIZE = 5'h1c;
  
  wire [28-1:0] M_slowClock_value;
  counter_13 slowClock (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock_value)
  );
  
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_3 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  
  always @* begin
    M_autoInputBrain_d = M_autoInputBrain_q;
    M_brain_d = M_brain_q;
    M_autoBrain_d = M_autoBrain_q;
    M_result_d = M_result_q;
    M_v_d = M_v_q;
    M_inputModeStore_d = M_inputModeStore_q;
    M_display_d = M_display_q;
    M_z_d = M_z_q;
    M_opcode_d = M_opcode_q;
    M_n_d = M_n_q;
    M_first_d = M_first_q;
    M_second_d = M_second_q;
    
    M_slowClockEdge_in = M_slowClock_value[27+0-:1];
    aluOut = M_result_q;
    displayOUT = M_display_q;
    opOUT = M_opcode_q;
    M_alu_a = M_first_q;
    M_alu_b = M_second_q;
    M_alu_alufn = M_opcode_q;
    aluOut = M_result_q;
    M_z_d = M_alu_z;
    M_v_d = M_alu_v;
    M_n_d = M_alu_n;
    inputMode = M_inputModeStore_q;
    
    case (M_brain_q)
      MANUAL_brain: begin
        if (button[0+0-:1]) begin
          M_brain_d = IDLE_brain;
        end else begin
          M_inputModeStore_d = 1'h0;
          M_brain_d = MANUAL_brain;
        end
      end
      IDLE_brain: begin
        M_inputModeStore_d = in[16+7+0-:1];
        if (button[1+0-:1] && in[16+7+0-:1]) begin
          M_brain_d = TESTAUTOINPUT_brain;
        end else begin
          if (button[1+0-:1]) begin
            M_brain_d = TESTAUTO_brain;
          end else begin
            if (button[0+0-:1]) begin
              M_brain_d = MANUAL_brain;
            end else begin
              M_display_d = 32'h0b111200;
              M_result_d = 16'hffff;
              M_opcode_d = 6'h3f;
              M_brain_d = IDLE_brain;
            end
          end
        end
      end
      TESTAUTOINPUT_brain: begin
        M_inputModeStore_d = in[16+7+0-:1];
        if (button[1+0-:1] && in[16+7+0-:1] == 1'h0) begin
          M_autoInputBrain_d = INPUTA_autoInputBrain;
          M_autoBrain_d = ADD_autoBrain;
          M_brain_d = IDLE_brain;
        end else begin
          if (button[0+0-:1]) begin
            M_autoInputBrain_d = INPUTA_autoInputBrain;
            M_autoBrain_d = ADD_autoBrain;
            M_brain_d = MANUAL_brain;
          end else begin
            M_brain_d = TESTAUTOINPUT_brain;
            
            case (M_autoInputBrain_q)
              INPUTA_autoInputBrain: begin
                if (button[1+0-:1]) begin
                  M_first_d[0+7-:8] = in[0+7-:8];
                  M_first_d[8+7-:8] = in[8+7-:8];
                  M_autoInputBrain_d = INPUTB_autoInputBrain;
                end else begin
                  M_result_d[0+7-:8] = in[0+7-:8];
                  M_result_d[8+7-:8] = in[8+7-:8];
                  M_display_d = 32'h0b0e140b;
                  M_autoInputBrain_d = INPUTA_autoInputBrain;
                end
              end
              INPUTB_autoInputBrain: begin
                if (button[1+0-:1]) begin
                  M_second_d[0+7-:8] = in[0+7-:8];
                  M_second_d[8+7-:8] = in[8+7-:8];
                  M_autoInputBrain_d = RUN_autoInputBrain;
                end else begin
                  M_result_d[0+7-:8] = in[0+7-:8];
                  M_result_d[8+7-:8] = in[8+7-:8];
                  M_display_d = 32'h0b0e1410;
                  M_autoInputBrain_d = INPUTB_autoInputBrain;
                end
              end
              RUN_autoInputBrain: begin
                if (button[1+0-:1]) begin
                  M_autoBrain_d = ADD_autoBrain;
                  M_first_d[0+15-:16] = 1'h0;
                  M_second_d[0+15-:16] = 1'h0;
                  M_opcode_d[0+5-:6] = 1'h0;
                  M_z_d = 1'h0;
                  M_v_d = 1'h0;
                  M_n_d = 1'h0;
                  M_autoInputBrain_d = INPUTA_autoInputBrain;
                end else begin
                  M_display_d[24+7-:8] = 8'h15;
                  M_display_d[16+7-:8] = M_z_q;
                  M_display_d[8+7-:8] = M_v_q;
                  M_display_d[0+7-:8] = M_n_q;
                  M_result_d = M_alu_out;
                  M_autoInputBrain_d = RUN_autoInputBrain;
                  
                  case (M_autoBrain_q)
                    ADD_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = SUB_autoBrain;
                      end else begin
                        M_opcode_d = 6'h00;
                        M_autoBrain_d = ADD_autoBrain;
                      end
                    end
                    SUB_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = AND_autoBrain;
                      end else begin
                        M_opcode_d = 6'h01;
                        M_autoBrain_d = SUB_autoBrain;
                      end
                    end
                    AND_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = OR_autoBrain;
                      end else begin
                        M_opcode_d = 6'h18;
                        M_autoBrain_d = AND_autoBrain;
                      end
                    end
                    OR_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = XOR_autoBrain;
                      end else begin
                        M_opcode_d = 6'h1e;
                        M_autoBrain_d = OR_autoBrain;
                      end
                    end
                    XOR_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = ALDR_autoBrain;
                      end else begin
                        M_opcode_d = 6'h16;
                        M_autoBrain_d = XOR_autoBrain;
                      end
                    end
                    ALDR_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = SHL_autoBrain;
                      end else begin
                        M_opcode_d = 6'h1a;
                        M_autoBrain_d = ALDR_autoBrain;
                      end
                    end
                    SHL_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = SHR_autoBrain;
                      end else begin
                        M_opcode_d = 6'h20;
                        M_autoBrain_d = SHL_autoBrain;
                      end
                    end
                    SHR_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = SRA_autoBrain;
                      end else begin
                        M_opcode_d = 6'h21;
                        M_autoBrain_d = SHR_autoBrain;
                      end
                    end
                    SRA_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = CMPEQ_autoBrain;
                      end else begin
                        M_opcode_d = 6'h23;
                        M_autoBrain_d = SRA_autoBrain;
                      end
                    end
                    CMPEQ_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = CMPLT_autoBrain;
                      end else begin
                        M_opcode_d = 6'h33;
                        M_autoBrain_d = CMPEQ_autoBrain;
                      end
                    end
                    CMPLT_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = CMPLE_autoBrain;
                      end else begin
                        M_opcode_d = 6'h35;
                        M_autoBrain_d = CMPLT_autoBrain;
                      end
                    end
                    CMPLE_autoBrain: begin
                      if (M_slowClockEdge_out == 1'h1) begin
                        M_autoBrain_d = ADD_autoBrain;
                      end else begin
                        M_opcode_d = 6'h37;
                        M_autoBrain_d = CMPLE_autoBrain;
                      end
                    end
                  endcase
                end
              end
            endcase
          end
        end
      end
      TESTAUTO_brain: begin
        M_inputModeStore_d = in[16+7+0-:1];
        if (button[1+0-:1]) begin
          M_autoBrain_d = ADD_autoBrain;
          M_brain_d = IDLE_brain;
        end else begin
          if (button[0+0-:1]) begin
            M_autoBrain_d = ADD_autoBrain;
            M_brain_d = MANUAL_brain;
          end else begin
            M_brain_d = TESTAUTO_brain;
            M_display_d[16+7-:8] = M_z_q;
            M_display_d[8+7-:8] = M_v_q;
            M_display_d[0+7-:8] = M_n_q;
            M_result_d = M_alu_out;
            
            case (M_autoBrain_q)
              ADD_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = SUB_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == ADDCORRECTZVN[2+0-:1] && M_v_q == ADDCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h0001;
                  M_second_d = 16'h0001;
                  M_opcode_d = 6'h00;
                  M_autoBrain_d = ADD_autoBrain;
                end
              end
              SUB_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = AND_autoBrain;
                end else begin
                  if (M_result_q == 16'h0001 && M_z_q == SUBCORRECTZVN[2+0-:1] && M_v_q == SUBCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h0003;
                  M_second_d = 16'h0002;
                  M_opcode_d = 6'h01;
                  M_autoBrain_d = SUB_autoBrain;
                end
              end
              AND_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = OR_autoBrain;
                end else begin
                  if (M_result_q == 16'h0541 && M_z_q == ANDCORRECTZVN[2+0-:1] && M_v_q == ANDCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h65c5;
                  M_second_d = 16'h1553;
                  M_opcode_d = 6'h18;
                  M_autoBrain_d = AND_autoBrain;
                end
              end
              OR_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = XOR_autoBrain;
                end else begin
                  if (M_result_q == 16'h75d7 && M_z_q == ORCORRECTZVN[2+0-:1] && M_v_q == ORCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h65c5;
                  M_second_d = 16'h1553;
                  M_opcode_d = 6'h1e;
                  M_autoBrain_d = OR_autoBrain;
                end
              end
              XOR_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = ALDR_autoBrain;
                end else begin
                  if (M_result_q == 16'h7091 && M_z_q == XORCORRECTZVN[2+0-:1] && M_v_q == XORCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h65c5;
                  M_second_d = 16'h1553;
                  M_opcode_d = 6'h16;
                  M_autoBrain_d = XOR_autoBrain;
                end
              end
              ALDR_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = SHL_autoBrain;
                end else begin
                  if (M_result_q == 16'h65c5 && M_z_q == ALDRCORRECTZVN[2+0-:1] && M_v_q == ALDRCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h65c5;
                  M_second_d = 16'h1553;
                  M_opcode_d = 6'h1a;
                  M_autoBrain_d = ALDR_autoBrain;
                end
              end
              SHL_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = SHR_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == SHLCORRECTZVN[2+0-:1] && M_v_q == SHLCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h0203;
                  M_second_d = 16'h0207;
                  M_opcode_d = 6'h20;
                  M_autoBrain_d = SHL_autoBrain;
                end
              end
              SHR_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = SRA_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == SHRCORRECTZVN[2+0-:1] && M_v_q == SHRCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h8000;
                  M_second_d = 16'h0001;
                  M_opcode_d = 6'h21;
                  M_autoBrain_d = SHR_autoBrain;
                end
              end
              SRA_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = CMPEQ_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == SRACORRECTZVN[2+0-:1] && M_v_q == SRACORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h000c;
                  M_second_d = 16'h0001;
                  M_opcode_d = 6'h23;
                  M_autoBrain_d = SRA_autoBrain;
                end
              end
              CMPEQ_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = CMPLT_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == CMPEQCORRECTZVN[2+0-:1] && M_v_q == CMPEQCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h0203;
                  M_second_d = 16'h0207;
                  M_opcode_d = 6'h33;
                  M_autoBrain_d = CMPEQ_autoBrain;
                end
              end
              CMPLT_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = CMPLE_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == CMPLTCORRECTZVN[2+0-:1] && M_v_q == CMPLTCORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h8000;
                  M_second_d = 16'h0001;
                  M_opcode_d = 6'h35;
                  M_autoBrain_d = CMPLT_autoBrain;
                end
              end
              CMPLE_autoBrain: begin
                if (M_slowClockEdge_out == 1'h1) begin
                  M_autoBrain_d = ADD_autoBrain;
                end else begin
                  if (M_result_q == 16'h0002 && M_z_q == CMPLECORRECTZVN[2+0-:1] && M_v_q == CMPLECORRECTZVN[1+0-:1] && M_n_q == 1'h0) begin
                    M_display_d[24+7-:8] = 8'h0a;
                  end else begin
                    M_display_d[24+7-:8] = 8'h0d;
                  end
                  M_first_d = 16'h000c;
                  M_second_d = 16'h0001;
                  M_opcode_d = 6'h37;
                  M_autoBrain_d = CMPLE_autoBrain;
                end
              end
            endcase
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_brain_q <= M_brain_d;
    M_autoBrain_q <= M_autoBrain_d;
    M_autoInputBrain_q <= M_autoInputBrain_d;
    
    if (rst == 1'b1) begin
      M_first_q <= 1'h0;
      M_second_q <= 1'h0;
      M_opcode_q <= 1'h0;
      M_result_q <= 1'h0;
      M_z_q <= 1'h0;
      M_v_q <= 1'h0;
      M_n_q <= 1'h0;
      M_display_q <= 1'h0;
      M_inputModeStore_q <= 1'h0;
    end else begin
      M_first_q <= M_first_d;
      M_second_q <= M_second_d;
      M_opcode_q <= M_opcode_d;
      M_result_q <= M_result_d;
      M_z_q <= M_z_d;
      M_v_q <= M_v_d;
      M_n_q <= M_n_d;
      M_display_q <= M_display_d;
      M_inputModeStore_q <= M_inputModeStore_d;
    end
  end
  
endmodule
