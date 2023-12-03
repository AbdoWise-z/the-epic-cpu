Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
-- memory is big endian (address 1: 31- 16 2:15 - 0)
Entity Memory is 
port( 
	WriteEnable,MemEnable,Protect,Free,Reset: in std_logic;
	datain,Address:  in std_logic_vector(31 downto 0);
	OutValue:	out std_logic_vector(31 downto 0);
	error	:       out std_logic
	
);
end Entity Memory;


Architecture Memoryarch of Memory is
Type ram_type is Array(0 to 4095) of std_logic_vector(15 downto 0);
-- Array type of 4096 word addressable == 8192 byte addressable
	Signal defaultram,ram: ram_type := (others =>(others =>('0')));

	Signal Protect_Bit: std_logic_vector(4095 downto 0) := (others =>('0')); 
begin

process(MemEnable,Reset)
FILE data_file : TEXT ;
variable line_content : line := null;
variable data_line    : std_logic_vector(15 downto 0);
variable SimAddress   : integer := 0;
begin
--todo: how to read and write
	file_open(data_file, "datamem.txt", read_mode);
	if(Rising_edge(Reset)) then
		while not EndFile (data_file) LOOP
			readline(data_file, line_content);
			read(line_content,data_line);
			defaultram(SimAddress) <= data_line;
			SimAddress := SimAddress+1;
		End Loop;
		file_close(data_file);
		ram <= defaultram;
		Protect_Bit <= (others =>('0'));
	elsif((MemEnable) ='1') then
		if((to_integer(unsigned(Address(11 downto 0))) mod 2) = 0) then
			if((WriteEnable) = '1') then
				if(Protect_Bit(to_integer(unsigned(Address(11 downto 0)))) = '1') then
					error<='1';
				else
					ram(to_integer(unsigned(Address(11 downto 0))))   <= datain(31 downto 16);
					ram(to_integer(unsigned(Address(11 downto 0))+1)) <= datain(15 downto 0);
				end if;
			elsif(Protect = '1') then
				Protect_Bit(to_integer(unsigned(Address(11 downto 0))))<= '1';
			elsif(Free = '1') then
				Protect_Bit(to_integer(unsigned(Address(11 downto 0))))<= '0';
			end if;
		else 
			error <='1';
		end if;
	end if;

end process;
	OutValue <= ram(to_integer(unsigned(Address(11 downto 0))))&ram(to_integer(unsigned(Address(11 downto 0)))+1) ;
end Architecture Memoryarch;
