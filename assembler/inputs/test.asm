.data
A 458
B 4948
C 44
D 44

.code
ldm r1 , 10000
out r1

.int
# code here will be executed when an interrupt occurs
dec R1
dec R2
add R3, R1, R2
rti