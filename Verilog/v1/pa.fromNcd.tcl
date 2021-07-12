
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name CCD -dir "E:/FPGA_Xilinx/ISE/CCD/planAhead_run_2" -part xc6slx9tqg144-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "E:/FPGA_Xilinx/ISE/CCD/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/FPGA_Xilinx/ISE/CCD} }
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "E:/FPGA_Xilinx/ISE/CCD/top.ncd"
if {[catch {read_twx -name results_1 -file "E:/FPGA_Xilinx/ISE/CCD/top.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"E:/FPGA_Xilinx/ISE/CCD/top.twx\": $eInfo"
}
