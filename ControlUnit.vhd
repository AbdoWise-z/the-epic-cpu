Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
  port (
    op_code  : in std_logic_vector(4 downto 0);
    int_sig  : in std_logic_vector(3 downto 0);
    sig      : out std_logic_vector(24 downto 0)
  ) ;
end ControlUnit;


architecture ControlUnitArch of ControlUnit is
    type RG_FILE_TYPE is Array(0 to 31) of std_logic_vector(24 downto 0);
    type MG_FILE_TYPE is Array(0 to 7)  of std_logic_vector(24 downto 0);

    constant INT_SIG_TABLE: MG_FILE_TYPE := (
        "0001100000000000010101000", -- RESET : Load PC , 0 (reset address)
        "0000100000000001100010100", -- INT   : Push PC
        "0000000000000001100011100", -- INT   : Push FR
        "0001100000000000010101000", -- INT   : Load PC , 2 (int address)
        "0000000000000000000000000", -- flex  : NOP
        "0000000000000000000000000", -- flex  : NOP
        "0000000000000000000000000", -- flex  : NOP
        "0000000000000000000000000"  -- flex  : NOP
    );
     
    constant SIGNAL_TABLE : RG_FILE_TYPE := (
        "0000000000000000000000000", --00000 NOP
        "1000000000000110000000000", --00001 NOT
        "1000000000001010000000000", --00010 NEG
        "1000000000001110000000000", --00011 INC
        "1000000000010010000000000", --00100 DEC
        "1000000001000000000000100", --00101 OUT
        "0001000000000010000000100", --00110 IN
        "1110000000010110000000000", --00111 ADD
        "1110000000011010000000000", --01000 SUB
        "1110000000011110000000000", --01001 AND
        "1110000000100010000000000", --01010 OR
        "1110000000100110000000000", --01011 XOR
        "1110000000101000000000000", --01100 CMP
        "1010001000010110000000000", --01101 ADD
        "1000011000101110000000000", --01110 BIT
        "1000011000110010000000000", --01111 RCL
        "1000011000110110000000000", --10000 RCR
        "1000000000000001100010100", --10001 PUSH
        "0000000000000011000100000", --10010 POP
        "0000001000000010000001000", --10011 LDM
        "0001100000000010000101000", --10100 LDD
        "0101110000000000000011000", --10101 STD
        "1000000000000000000000001", --10110 PROTECT
        "1000000000000000000000010", --10111 FREE
        "1000000100111000000000000", --11000 JZ
        "1000000010000000000000000", --11001 JMP
        "1000100010000001100010100", --11010 CALL
        "0000100000000001100010100", --11011 PUSH-PC
        "0000000000000001100011100", --11100 PUSH-FR       (HLT)
        "0000000000000001010110000", --11101 POP-PC        (RET)
        "0000000000000001001110000", --11110 POP-FR        (RTI)
        "1110000000111110000000000"  --11111 NON-FR XOR    (SWAP)
        ); 
begin

    sig <= SIGNAL_TABLE(to_integer(unsigned(op_code))) when int_sig(3) = '0' 
      else INT_SIG_TABLE(to_integer(unsigned(int_sig(2 downto 0))));

end ControlUnitArch ; -- ControlUnitArch