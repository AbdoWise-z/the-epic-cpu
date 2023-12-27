# all numbers in hex format
# we always start by reset signal
#if you don't handle hazards add 3 NOPs
#this is a commented line
# .ORG 500 means the following line should be added at the 500th entry in the instruction memory
#you should ignore empty lines

# Put the interrupt address in the memory

.code 
# LDM R1, 0x100  # our compiler automatically calculates the interrupt address :)
# STD R1, 0x2

in R1     #R1=30
in R2     #R2=50
in R3     #R3=100
in R4     #R4=300
in R6     #R6=FFFFFFFF 
in R7     #R7=FFFFFFFF   
Push R4   #sp=7FD, M[7FE, 7FE]=300
JMP R1 
INC R7	  # this statement shouldn't be executed,
 
#check flag fowarding  
.ORG 0x30
AND R5,R1,R5   #R5=0 , Z = 1
            #try INTERRUPT here
JZ  R2      #Jump taken, Z = 0
INC R7      #this statement shouldn't be executed

#check on flag updated on jump
.ORG 0x50
JZ R3      #Jump Not taken

#check destination forwarding
NOT R5     #R5=FFFFFFFF, Z= 0, C--> not change, N=1
INC R5     #R5=0, Z=1, C=1, N=0
in  R6     #R6=200, flag no change
JZ  R6     #jump taken, Z = 0
INC R1

#check on load use
.ORG 0x200
POP R6     #R6=300, SP=7FF
Call R6    #SP=7FD, M[7FF]=half next PC,M[7FE]=other half next PC
           #try INTERRUPT here
INC R6	   #R6=401, this statement shouldn't be executed till call returns, C--> 0, N-->0,Z-->0
NOP
NOP


.ORG 0x300
Add R3,R6,R6 #R6=400
Add R1,R2,R2 #R1=80, C->0,N=0, Z=0
ret
INC R7           #this shouldnot be executed

.ORG 0x500
NOP
NOP



.int
ADD R0,R0,R0    #N=0,Z=1,C=1
out R6
rti
