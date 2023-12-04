Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCControlUnit is
    port(
        --inputs
        PCU , ZeroFlag , ExecuteWB , MemWB : in std_logic;
        Rdst , ERdst , MRdst : in std_logic_vector(2 downto 0);
        JmpType : in std_logic_vector(1 downto 0);

        --outputs
        PCSelector : out std_logic_vector(1 downto 0);
        Flush_Fetch , Flush_Decode , Flush_Execute : out std_logic
    );
end entity PCControlUnit;

architecture PCCU_ARCH of PCControlUnit is
    signal iPCSelector : std_logic_vector(1 downto 0);
begin

    iPCSelector <= "11" when PCU = '1' -- take mem value if we pop pc
    else "00" when JmpType = "00"      -- take normal pc when we dont need to jmp
                                       -- non-conditional jumps : take execute if its being forward other wise mem other wise decode
    else "01" when JmpType = "01" and Rdst = ERdst and ExecuteWB = '1' -- take ex if we can
    else "11" when JmpType = "01" and Rdst = MRdst and MemWB     = '1' -- take mem if we can
    else "10" when JmpType = "01"                                      -- otherwise take decode
                                      -- conditional jumps  (check zero flag) : take execute if its being forward other wise mem other wise decode
    else "01" when JmpType = "10" and ZeroFlag = '1' and Rdst = ERdst and ExecuteWB = '1' -- take ex if we can
    else "11" when JmpType = "10" and ZeroFlag = '1' and Rdst = MRdst and MemWB     = '1' -- take mem if we can
    else "10" when JmpType = "10" and ZeroFlag = '1'                                      -- otherwise take decode
    else "00";

    Flush_Fetch   <= '1' when PCU = '1' else '1' when iPCSelector /= "00" else '0';
    Flush_Decode  <= '1' when PCU = '1' else '0';
    Flush_Execute <= '1' when PCU = '1' else '0';

    PCSelector <= iPCSelector;

end architecture PCCU_ARCH;