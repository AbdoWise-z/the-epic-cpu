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
	Signal ram: ram_type := (others =>(others =>('0')));
begin

process(Reset)
FILE data_file : TEXT;
variable line_content : line := null;
variable data_line    : std_logic_vector(15 downto 0);
variable SimAddress   : integer := 0;
begin
	if(Rising_edge(Reset)) then
		file_open(data_file, "instructionmem.txt", read_mode);
		while not EndFile (data_file) LOOP
			readline(data_file, line_content);
			read(line_content,data_line);
			ram(SimAddress) <= data_line;
			SimAddress := SimAddress+1;
		End Loop;
		file_close(data_file);
	end if;
end process;
Instruction <= ram(to_integer(unsigned(PC(11 downto 0))));
end Architecture InstructionMemarch;
