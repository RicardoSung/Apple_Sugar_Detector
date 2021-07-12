
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name CCD -dir "E:/FPGA_Xilinx/ISE/CCD/planAhead_run_1" -part xc6slx9tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/FPGA_Xilinx/ISE/CCD/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/FPGA_Xilinx/ISE/CCD} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
