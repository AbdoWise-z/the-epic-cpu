Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
  port (
    op_code  : in std_logic_vector(4 downto 0);
    int_sig  : in std_logic_vector(3 downto 0);
    sig      : out std_logic_vector(22 downto 0)
  ) ;
end ControlUnit;


architecture ControlUnitArch of ControlUnit is
    type RG_FILE_TYPE is Array(0 to 31) of std_logic_vector(22 downto 0);
    type MG_FILE_TYPE is Array(0 to 7)  of std_logic_vector(22 downto 0);

    constant INT_SIG_TABLE: MG_FILE_TYPE := (
        "01100000000000010101000", -- RESET : Load PC , 0 (reset address)
        "00100000000001100010100", -- INT   : Push PC
        "00000000000001100011100", -- INT   : Push FR
        "01100000000000010101000", -- INT   : Load PC , 2 (int address)
        "00000000000000000000000", -- flex  : NOP
        "00000000000000000000000", -- flex  : NOP
        "00000000000000000000000", -- flex  : NOP
        "00000000000000000000000"  -- flex  : NOP
    );
     
    constant SIGNAL_TABLE : RG_FILE_TYPE := (
        "00000000000000000000000", -- 00000
        "00000000000110000000000", -- 00001
        "00000000001010000000000", -- 00010
        "00000000001110000000000", -- 00011
        "00000000010010000000000", -- 00100
        "00000001000000000000100", -- 00101
        "01000000000010000000100", -- 00110
        "10000000010110000000000", -- 00111
        "10000000011010000000000", -- 01000
        "10000000011110000000000", -- 01001
        "10000000100010000000000", -- 01010
        "10000000100110000000000", -- 01011
        "10000000101000000000000", -- 01100 
        "10001000010110000000000", -- 01101
        "10011000101110000000000", -- 01110
        "10011000110010000000000", -- 01111
        "10011000110110000000000", -- 10000
        "00000000000001100010100", -- 10001
        "00000000000011000100000", -- 10010
        "00001000000010000001000", -- 10011
        "01100000000010000101000", -- 10100
        "01110000000000000011000", -- 10101
        "00000000000000000000001", -- 10110
        "00000000000000000000010", -- 10111
        "00000100000000000000000", -- 11000
        "00000010000000000000000", -- 11001
        "00100100000001100010100", -- 11010
        "00100000000001100010100", -- 11011
        "00000000000001100011100", -- 11100
        "00000000000001010110000", -- 11101
        "00000000000001001110000", -- 11110
        "00000000000000000000000"  -- 11111
    ); 
begin

    sig <= SIGNAL_TABLE(to_integer(unsigned(op_code))) when int_sig(3) = '0' 
      else INT_SIG_TABLE(to_integer(unsigned(int_sig(2 downto 0))));

end ControlUnitArch ; -- ControlUnitArch