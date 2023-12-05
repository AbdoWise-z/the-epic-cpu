Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity StageFetch is
  port (
    clk , reset   : in std_logic;
    PCU , ZeroFlag , ExecuteWB , MemWB , ControllerPCSelect : in std_logic;
    Rdst , ERdst , MRdst : in std_logic_vector(2 downto 0);
    JmpType : in std_logic_vector(1 downto 0);
    DecodeValue , ExecuteValue , MemoryValue , ControllerValue : in std_logic_vector(31 downto 0);

    Error   : out std_logic;
    InstOut : out std_logic_vector(31 downto 0);
    nextPC  : out std_logic_vector(31 downto 0);
    Flush_Fetch , Flush_Decode , Flush_Execute : out std_logic
  );
end StageFetch;

architecture StageFetchArch of StageFetch is
    component PCControlUnit is
        port(
            --inputs
            PCU , ZeroFlag , ExecuteWB , MemWB : in std_logic;
            Rdst , ERdst , MRdst : in std_logic_vector(2 downto 0);
            JmpType : in std_logic_vector(1 downto 0);
    
            --outputs
            PCSelector : out std_logic_vector(1 downto 0);
            Flush_Fetch , Flush_Decode , Flush_Execute : out std_logic
        );
    end component;

    component PreDecoder is
        port (
            clk    : in std_logic;
            flush  : in std_logic;
            InstIn : in std_logic_vector(15 downto 0);
            InstOut : out std_logic_vector(31 downto 0)
        ) ;
    end component;
    
    component InstructionMem is 
    port(
	    PC   : in std_logic_vector(31 downto 0);
	    Reset: in std_logic;
	    Error:	out std_logic;
	    Instruction: out Std_logic_vector(15 downto 0)
    );
    end component;


    signal InternalPC : std_logic_vector(31 downto 0) := (others => '0');
    signal PCSelector : std_logic_vector(1 downto 0) := "00";
    signal PCCFlush   : std_logic := '0';
    signal InstIn     : std_logic_vector(15 downto 0) := (others => '0');
    signal Addr       : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_P1      : std_logic_vector(31 downto 0) := (others => '0');

begin
    Addr <= InternalPC when PCSelector = "00"
      else ExecuteValue when PCSelector = "01"
      else DecodeValue when PCSelector = "10"
      else MemoryValue when PCSelector = "11";
	
    PC_P1 <= std_logic_vector(unsigned(Addr) + 1);
	
    PCCU : PCControlUnit  port map(PCU , ZeroFlag , ExecuteWB , MemWB , Rdst , ERdst , MRdst , JmpType , PCSelector , PCCFlush , Flush_Decode , Flush_Execute);
    PD   : PreDecoder     port map(clk , PCCFlush , InstIn , InstOut);
    MEM  : InstructionMem port map(PC => Addr , Reset => reset , Error => Error , Instruction => InstIn);
	
    process(clk)
    begin
        if (clk'event and clk = '1') then
            InternalPC <= PC_P1;
            nextPC <= PC_P1;
        end if;
        -- InstOut is already clk latched so no need to latch it again
    end process;

    Flush_Fetch <= PCCFlush;

end StageFetchArch ;