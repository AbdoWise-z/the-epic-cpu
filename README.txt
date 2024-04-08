
![Image](/Screenshot%202024-04-08%20215921.png)


sooo this is the EPIC-CPU assembler (requires JAVA 17)

What it can do:
	- we support all of the instruction written in the project document (+ extra instrcution HLT)
	- we also support having more than one data segment / code segment (on the same file / multiple files)
	- we support data segment labeling
		EX:    15. A 48
			..
			   65. ldd R1, A  # ("A" will be replace with the address of the data)
	- in case a label was repeated its address value will be the most recent one
	- you can add comments to the code using "#"
		EX:    45. ADDI R1, R2, 32   # they say 32 is a magic number :)
	- outputs will be written in "outputs" folder as :
		1. code.ecs  : this is the instruction memory
		2. data.eds  : this is the data memory
	- in case of syntax error, it will tell you where is it relative to the code segment
	- to add interrupt code use ".int" similar to ".code" and ".data"

What it can't do:
	- it can't make you breakfast :(


TO COMPILE:
	use this command : epic {file_name} {another_file_name} ...
