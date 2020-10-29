set projDir "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/vivado"
set projName "16BIT_ALU_CHECKOFF"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/au_top_0.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/reset_conditioner_1.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/button_conditioner_2.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/edge_detector_3.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/fsm_COMBINE_4.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/multi_seven_seg_5.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/pipeline_6.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/fsm_MANUAL_7.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/fsm_AUTO_8.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/counter_9.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/seven_seg_10.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/decoder_11.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/alu16bit_12.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/counter_13.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/adder16bit_14.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/shifter16bit_15.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/compare16bit_16.v" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/verilog/bool16bit_17.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/work/constraint/custom.xdc" "C:/Users/darry/Documents/alchitry/16BIT_ALU_CHECKOFF/constraint/forBR.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
