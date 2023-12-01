Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Memory is 
port( 
	WriteEnable,Protect,Free: in std_logic;
	datain,Address:  in std_logic_vector(31 downto 0);
	OutValue:	out std_logic_vector(31 downto 0);
	error	:       out std_logic
	
);
end Entity Memory;


Architecture Memoryarch of Memory is
Type ram_type is Array(0 to 2047) of std_logic_vector(15 downto 0);
-- Array type of 2048 word addressable == 4096 byte addressable
	Signal ram: ram_type;
	Signal Protect_Bit: std_logic_vector(4095 downto 0); 
begin
process
begin
--todo: how to read and write
	if(rising_edge(WriteEnable)) then
		
	end if;

end process;

end Architecture Memoryarch;
