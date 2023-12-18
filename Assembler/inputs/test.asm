.data
A 458
B 4948
C 44
D 44

.code
# the code blow is just a simple loop that
# loops until R1 = R3 {R3=30}
ldm R2,12
ldm R5,0x10
ldm R7,0b1111001101
ldm R8,0b110
ldm R4,8
ldm R1,15
ldm R3,30
ldd R3,0x7978
inc R1  # R2 = address of this instruction
cmp R1,R3
jz R2
jmp R4
hlt

.int
# code here will be executed when an interrupt occurs
dec R1
dec R2
add R3, R1, R2
rti