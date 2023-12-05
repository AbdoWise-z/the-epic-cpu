Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

Entity InstructionMem is 
port(
	PC   : in std_logic_vector(31 downto 0);
	Reset: in std_logic;
	Error:	out std_logic;
	Instruction: out Std_logic_vector(15 downto 0)
);
end Entity InstructionMem;


Architecture InstructionMemarch of InstructionMem is
Type ram_type is Array(0 to 4095) of std_logic_vector(15 downto 0);
-- Array type of 4096 word addressable == 8192 byte addressable
	Signal ram , defRam : ram_type := (others =>(others =>('0')));
	Signal FirstLoad    : std_logic := '1';

begin
	process (Reset)
		FILE data_file        : TEXT OPEN READ_MODE IS "instructions.txt";
		variable line_content : line := null;
		variable data_line    : std_logic_vector(15 downto 0);
		variable SimAddress   : integer := 0;
		variable defaultram   : ram_type := (others =>(others =>('0')));
	begin
		if(Rising_edge(Reset)) then
			if (FirstLoad = '1') then
				FirstLoad <= '0';
				report "Loading InstMem";
				while not EndFile(data_file) LOOP
					readline(data_file, line_content);
					read(line_content,data_line);
					defaultram(SimAddress) := data_line;
					SimAddress := SimAddress + 1;
				End Loop;
				file_close(data_file);
				ram <= defaultram;
				defRam <= defaultram;
			else
				ram <= defRam;
			end if;
			report "Reset Complete";
		end if;
	end process;
	
	Instruction <= ram(to_integer(unsigned(PC(11 downto 0))));

end Architecture InstructionMemarch;
