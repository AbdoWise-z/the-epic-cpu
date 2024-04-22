epic TwoOperand.asm
vsim -gui work.cpu
do reset.do
run
run
run
run
run
force -freeze sim:/cpu/INPUT 16#5 0
run
force -freeze sim:/cpu/INPUT 16#19 0
run
force -freeze sim:/cpu/INPUT 16#FFFD 0
run
noforce sim:/cpu/INPUT
force -freeze sim:/cpu/INPUT 16#F320 0
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