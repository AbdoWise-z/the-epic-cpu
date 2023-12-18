library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity ForwardingUnit is
  port (
    R1Forwardable,R2Forwardable,MemoryWB,ExecuteWB : in std_logic;
    Rsrc1,Rsrc2,MemoryRdst,ExecuteRdst   : in std_logic_vector(2 downto 0);
    Op1Selector,Op2Selector : out std_logic_vector(1 downto 0)
  );
end entity;

architecture ForwardingUnit_ARCH of ForwardingUnit is
begin
    Op1Selector <= 
         "00" when R1Forwardable = '0'
    else "01" when (ExecuteWB = '1' and ExecuteRdst = Rsrc1)
    else "10" when (MemoryWB  = '1' and MemoryRdst  = Rsrc1)
    else "00";

    Op2Selector <= 
         "00" when R2Forwardable = '0'
    else "01" when (ExecuteWB = '1' and ExecuteRdst = Rsrc2)
    else "10" when (MemoryWB  = '1' and MemoryRdst  = Rsrc2)
    else "00";
end architecture;
