library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity HazardDetectionUnit is
  port (
    MR , MemoryWB , Rsrc1F , Rsrc2F : in std_logic;
    MemoryRdst , Rsrc1 , Rsrc2 : in std_logic_vector(2 downto 0);
    hazard : out std_logic
  );
end entity;

architecture HazardDetectionUnit_Arch of HazardDetectionUnit is
begin
    hazard <= 
         '1' when (MR = '1' and MemoryWB = '1' and Rsrc1F = '1' and MemoryRdst = Rsrc1)
    else '1' when (MR = '1' and MemoryWB = '1' and Rsrc2F = '1' and MemoryRdst = Rsrc2)
    else '0';
    -- when we have a hazard in Rsrc1 or Rsrc2
end architecture;
