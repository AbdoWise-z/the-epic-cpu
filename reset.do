add wave -position end  sim:/cpu/CLK
add wave -position end  sim:/cpu/INPUT
add wave -position end  sim:/cpu/INT
add wave -position end  sim:/cpu/OUTPUT
add wave -position end  sim:/cpu/RESET
add wave -position end  sim:/cpu/stagedecode_inst/Registers/Registers
add wave -position end  sim:/cpu/stageexecute_inst/ALU_FRout
add wave -position end  sim:/cpu/stagefetch_inst/InternalPC
add wave -position end  sim:/cpu/stagefetch_inst/Addr
add wave -position end  sim:/cpu/stagedecode_inst/ControlSignals
add wave -position end  sim:/cpu/stagedecode_inst/inst
add wave -position end  sim:/cpu/stagedecode_inst/INT_CRT

force -freeze sim:/cpu/INT 0 0
force -freeze sim:/cpu/CLK 0 0, 1 {50 ps} -r 100
force -freeze sim:/cpu/RESET 0 0
run
force -freeze sim:/cpu/RESET 1 0
run
force -freeze sim:/cpu/RESET 0 0