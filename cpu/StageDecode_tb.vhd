library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity StageDecode_tb is
end entity;

architecture StageDecode_tbArch of StageDecode_tb is
    
    component StageDecode is
        port(
            clk , flush , reset : in std_logic;
    
            --decode stuff
            iPC : in std_logic_vector(31 downto 0);
            oPC : out std_logic_vector(31 downto 0);
            ERROR : out std_logic;
            inst : in std_logic_vector(0 to 31);
    
            DecodeValue   : out std_logic_vector(31 downto 0);
            oJumpControl  : out std_logic_vector(1 downto 0);
            oPortControl  : out std_logic;
            oALUControl   : out std_logic_vector(3 downto 0);
            oRegControl   : out std_logic_vector(7 downto 0);
            oMemControl   : out std_logic_vector(5 downto 0);
            oR1_for       : out std_logic;
            oR2_for       : out std_logic;
            oRsrc1        : out std_logic_vector(2 downto 0);
            oRsrc2        : out std_logic_vector(2 downto 0);
            oOp1          : out std_logic_vector(31 downto 0);
            oOp2          : out std_logic_vector(31 downto 0);
    
    
            --WB stuff
            iRdst  : in std_logic_vector(2 downto 0);
            iWB    : in std_logic;
            iValue : in std_logic_vector(0 to 31)
    
        );
    end component;
begin
end architecture;