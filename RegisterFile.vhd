Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- write on falling edge
-- decodes on rising edge
entity RegisterFile is
  port (
    clk              : in std_logic;
    Rsrc1,Rsrc2,Rdst : in std_logic_vector(2 downto 0);
    WB               : in std_logic;
    Value            : in std_logic_vector(31 downto 0);
    Rout1,Rout2      : out std_logic_vector(31 downto 0)
  ) ;
end RegisterFile;


architecture RegisterFileArch of RegisterFile is
    signal out1 , out2 : std_logic_vector(31 downto 0);
    type RG_FILE_TYPE is Array(0 to 7) of std_logic_vector(31 downto 0);
    signal rgFile : RG_FILE_TYPE := (others => (others => '0'));
begin
    Rout1 <= out1;
    Rout2 <= out2;

    process (clk)
    begin
        if (clk = '0' and clk'event and WB = '1') then
            rgFile(to_integer(unsigned(Rdst))) <= Value;
        end if;
    end process;

    out1 <= rgFile(to_integer(unsigned(Rsrc1)));
    out2 <= rgFile(to_integer(unsigned(Rsrc2)));

end RegisterFileArch ; -- RegisterFileArch

