# all numbers in hex format
# we always start by reset signal
#this is a commented line
#you should ignore empty lines

.code

in R2          #R2=0x0CDAFE19 add 0CDAFE19 in R2
in R3          #R3=0xFFFF
in R4          #R4=0xF320
LDM R1,0xF5      #R1=0xF5
PUSH R1        #SP=7FD, M[7FE, 7FF] = F5
PUSH R2        #SP=7FB,M[7FC, 7FD]=0CDAFE19
POP R1         #SP=7FD,R1=0CDAFE19
POP R2         #SP=7FF,R2=F5
STD R2,0x200   #M[200, 201]=F5
STD R1,0x202   #M[202, 203]=0CDAFE19
LDD R3,0x202   #R3=0CDAFE19
LDD R4,0x200   #R4=F5
STD R3,0xF5    #M[F5,F6]=0CDAFE19
PROTECT R4
STD R4,0xF5
LDD R5,0xF5
FREE R4
LDD R5,0xF5