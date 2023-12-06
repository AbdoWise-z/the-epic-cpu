add wave -position end  sim:/cpu/CLK
add wave -position end  sim:/cpu/RESET
add wave -position end  sim:/cpu/INPUT
add wave -position end  sim:/cpu/OUTPUT
add wave -position end  sim:/cpu/stagedecode_inst/registerfile_inst/rgFile
add wave -position end  sim:/cpu/stagefetch_inst/InternalPC
add wave -position end  sim:/cpu/stageexecute_inst/ALU_FRout
add wave -position end  sim:/cpu/stagememory_inst/memory_inst/Protect_Bit
add wave -position end  sim:/cpu/stagememory_inst/memory_inst/ram
add wave -position end  sim:/cpu/stagefetch_inst/MEM/ram
force -freeze sim:/cpu/RESET 0 0
run
force -freeze sim:/cpu/RESET 1 0
run
force -freeze sim:/cpu/RESET 0 0
force -freeze sim:/cpu/CLK 0 0, 1 {50 ps} -r 100
