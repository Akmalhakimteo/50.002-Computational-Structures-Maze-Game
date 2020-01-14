set projDir "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/planAhead"
set projName "Maze"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/mojo_top_0.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/reset_conditioner_1.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/multi_seven_seg_2.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/multi_dec_ctr_3.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/beta_4.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/counter_5.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/edge_detector_6.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/buttoncon_7.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/edge_detector_6.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/buttoncon_7.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/edge_detector_6.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/buttoncon_7.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/edge_detector_6.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/buttoncon_7.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/edge_detector_6.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/buttoncon_7.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/maze_map_rom_16.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/regfile_17.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/counter_18.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/seven_seg_19.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/decoder_20.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/decimal_counter_21.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/alu16bit_22.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/edge_detector_6.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/counter_5.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/fsm_controller_25.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/maze_map_rom_16.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/regfile_17.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/pipline_28.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/pipline_28.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/pipline_28.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/pipline_28.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/pipline_28.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/adder_33.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/boolean_34.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/compare_35.v" "C:/Users/akmal/Downloads/Maze_new/Maze_new/work/verilog/shift_36.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/akmal/Downloads/Maze_new/Maze_new/constraint/LEDpins.ucf" "C:/Users/akmal/Downloads/mojo-ide-B1.3.6-windows/mojo-ide-B1.3.6/library/components/io_shield.ucf" "C:/Users/akmal/Downloads/mojo-ide-B1.3.6-windows/mojo-ide-B1.3.6/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
