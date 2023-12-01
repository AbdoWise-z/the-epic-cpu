Library ieee;
use ieee.std_logic_1164.all;

entity WriteBack is 
port(
	Rdst: 	      in std_logic_vector (31 downto 0);
--	Rdst_Addr:    in std_logic_vector (2 downto 0); -- not sure
	Write_Enable: in std_logic ;
	Output      : out std_logic_vector (31 downto 0)

);
end entity WriteBack;


Architecture WriteBackArch of WriteBack is
Begin
process(Write_Enable)
begin
Output <= Rdst;
end process;
end Architecture WriteBackArch;
