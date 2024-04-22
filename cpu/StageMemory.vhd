Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StageMemory is
  port (
    clk , flush , reset : in std_logic;
    iPC : in std_logic_vector(31 downto 0);
    oPC : out std_logic_vector(31 downto 0);
    ERROR : out std_logic;

    -- Register Control In
    iWB , iPCU : in std_logic;
    iRdst : in std_logic_vector(2 downto 0);
    iSPO  : in std_logic_vector(1 downto 0);

    -- Register Control out
    oWB , oPCU : out std_logic;
    oRdst : out std_logic_vector(2 downto 0);

    -- Memory inputs
    iMR , iMW , i_F , i_P : in std_logic;
    
    -- inputs
    Addr  : in std_logic_vector(31 downto 0);
    Value : in std_logic_vector(31 downto 0);

    -- Outputs
    oValue    : out std_logic_vector(31 downto 0);
    oMemValue : out std_logic_vector(31 downto 0)
  ) ;
end StageMemory;

architecture StageMemoryArch of StageMemory is
    component Memory is 
        port( 
	        WriteEnable , MemEnable , Protect , Free , Reset: in std_logic;
	        datain , Address:  in std_logic_vector(31 downto 0);
	        OutValue:	out std_logic_vector(31 downto 0);
	        error	:       out std_logic
        );
    end component;

    signal err  : std_logic;

    signal fMR  : std_logic := '0'; 
    signal fMW  : std_logic := '0'; 
    signal fP   : std_logic := '0'; 
    signal fF   : std_logic := '0'; 
    signal fWB  : std_logic := '0'; 
    signal fPCU : std_logic := '0'; 
    signal fSPO : std_logic_vector(1 downto 0) := (others => '0');
    signal sAddr : std_logic_vector(31 downto 0) := (others => '0');

    signal sValue    : std_logic_vector(31 downto 0);
    signal sMemValue : std_logic_vector(31 downto 0);

    signal SP          : std_logic_vector(31 downto 0) := "00000000000000000000111111111110";
    signal SP_P2    : std_logic_vector(31 downto 0) := (others => '0');
    signal SP_M2    : std_logic_vector(31 downto 0) := (others => '0');
    
    signal SP_DEFAULT : std_logic_vector(31 downto 0) := "00000000000000000000111111111110";
begin
    ----- flush ------
    fMR                <= iMR               when flush = '0' else '0';
    fMW                <= iMW               when flush = '0' else '0';
    fF                 <= i_F               when flush = '0' else '0';
    fP                 <= i_P               when flush = '0' else '0';
    fWB                <= iWB               when flush = '0' else '0';
    fPCU               <= iPCU              when flush = '0' else '0';
    fSPO               <= iSPO              when flush = '0' else (others => '0');

    memory_inst: Memory
    port map (
      WriteEnable => fMW,
      MemEnable   => clk,
      Protect     => fP,
      Free        => fF,
      Reset       => Reset,
      datain      => Value,
      Address     => sAddr,
      OutValue    => sMemValue,
      error       => err
    );

    SP_P2     <= std_logic_vector(unsigned(SP) + 2);
    SP_M2     <= std_logic_vector(unsigned(SP) - 2);
    sAddr     <= Addr  when fSPO(1) = '0' 
            else SP_M2 when fSPO(0) = '1' --push
            else SP    ; --push
    
    sValue    <= Value when fMR     = '0' else sMemValue;
    oMemValue <= sMemValue;

    process(clk)
    begin
        if (clk'event and clk = '1') then
            if (reset = '1') then
                SP <= SP_DEFAULT;
            else
                if (fSPO(1) = '1') then
                    if (fSPO(0) = '1') then
                        SP <= SP_M2;
                    else
                        SP <= SP_P2;
                    end if;
                end if;
                oRdst   <= iRdst;
                oWB     <= fWB;
                oPCU    <= fPCU;
                oValue  <= sValue;
                oPC     <= iPC;
                ERROR   <= err and fMR;
            end if;
        end if;

    end process ;


end architecture;