epic Branch.asm
vsim -gui work.cpu
do reset.do
run
run
run
run
force -freeze sim:/cpu/INPUT 16#30 0
run
force -freeze sim:/cpu/INPUT 16#50 0
run
force -freeze sim:/cpu/INPUT 16#100 0
run
force -freeze sim:/cpu/INPUT 16#300 0
run
force -freeze sim:/cpu/INPUT 16#FFFFFFFF 0
run
run
run
run
run
run
force -freeze sim:/cpu/INT 1 0
run
force -freeze sim:/cpu/INT 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/cpu/INPUT 16#200 0
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/cpu/INT 1 0
run
force -freeze sim:/cpu/INT 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run