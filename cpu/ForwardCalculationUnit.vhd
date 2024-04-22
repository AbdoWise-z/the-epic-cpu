Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ForwardCalculationUnit is
  port (
    Op1S,Op2S : in std_logic_vector(1 downto 0);
    Op1F,Op2F,Op2Source : out std_logic
  ) ;
end ForwardCalculationUnit;

architecture ForwardCalculationUnitArch of ForwardCalculationUnit is
begin
    Op1F <= '1' when Op1S = "00" else '0'; -- op1-select == Reg1
    Op2F <= '1' when Op2S = "00"
       else '1' when Op2S = "10" else '0'; -- op2-select == Reg2 || op2=select == Reg1

    Op2Source <= '1' when Op2S = "10" else '0';

end architecture ForwardCalculationUnitArch;