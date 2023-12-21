library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity CPU is
  port (
    -- document ports
    INPUT : in std_logic_vector(31 downto 0);
    OUTPUT : out std_logic_vector(31 downto 0);

    INT,RESET,CLK : in std_logic;

    -- extra : maybe implemented one day ..
    ERROR    : out std_logic_vector(2 downto 0);
    ERROR_PC : out std_logic_vector(31 downto 0)

  );
end entity;

architecture CPU_ARCH of CPU is

    -- common
    signal fetchPC , decodePC , executePC , memoryPc : std_logic_vector(31 downto 0);
    signal dummyError1 , dummyError2 , dummyError3 , dummyError4 : std_logic;

    -- Fetch I/O
    signal sPCU , sZeroFlag , sExecuteWB , sMemWB                         : std_logic;
    signal sJRdst , sERdst , sMRdst                                       : std_logic_vector(2 downto 0);
    signal sJumpType                                                      : std_logic_vector(1 downto 0);
    signal sDecodeValue , sExecuteValue , sMemoryValue                    : std_logic_vector(31 downto 0);
    signal sInstOut                                                       : std_logic_vector(31 downto 0);
    signal sFlushFetch , sFlushDecode , sFlushExecute                     : std_logic;
    signal sFetchIntSigOut                                                : std_logic_vector(3 downto 0);

    -- Decode I/O
    signal sOutputEnable : std_logic;
    signal sALUControl   : std_logic_vector(3 downto 0);
    signal sD_RegControl : std_logic_vector(7 downto 0);
    signal sMemControl   : std_logic_vector(5 downto 0);
    signal sR1_for       : std_logic;
    signal sR2_for       : std_logic;
    signal sRsrc1        : std_logic_vector(2 downto 0);
    signal sRsrc2        : std_logic_vector(2 downto 0);
    signal sOp1          : std_logic_vector(31 downto 0);
    signal sOp2          : std_logic_vector(31 downto 0);
    
    -- Writeback I/O
    signal sRdst  : std_logic_vector(2 downto 0);
    signal sWB    : std_logic;
    
    -- Execute I/O
    signal sMR ,  sMW , sMF , sMP : std_logic;
    signal sE_RegisterControl : std_logic_vector(7 downto 0);
    signal sAddr : std_logic_vector(31 downto 0);

    -- Memory I/O
    signal sDirectValue : std_logic_vector(0 to 31);

    -- Hazard unit
    signal sHazard    : std_logic;
    signal sDRdst     : std_logic_vector(2 downto 0);
    signal sDWB, sDMR : std_logic;

    -- reset wires
    signal resetF , resetD , resetE , resetM : std_logic;
    signal resetMM : std_logic; -- just an early reset signal to the memory to be able to load the pc
    
begin
    sJRdst <= sD_RegControl(6 downto 4);
    sERdst <= sE_RegisterControl(6 downto 4);
    sMRdst <= sRdst;
    sExecuteWB <= sE_RegisterControl(7);
    sMemWB <= sWB;
    resetF <= RESET;

    stagefetch_inst: entity work.StageFetch
    port map (
      clk                => clk,
      reset              => resetF,
      oReset             => resetD,
      Hazard             => sHazard,
      INT                => INT,
      PCU                => sPCU,
      ZeroFlag           => sZeroFlag,
      ExecuteWB          => sExecuteWB,
      MemWB              => sMemWB,
      Rdst               => sJRdst,
      ERdst              => sERdst,
      MRdst              => sMRdst,
      JmpType            => sJumpType,
      DecodeValue        => sDecodeValue,
      ExecuteValue       => sExecuteValue,
      MemoryValue        => sMemoryValue,
      Error              => dummyError1,
      IntSigOut          => sFetchIntSigOut,
      InstOut            => sInstOut,
      nextPC             => fetchPC,
      Flush_Fetch        => sFlushFetch,
      Flush_Decode       => sFlushDecode,
      Flush_Execute      => sFlushExecute
    );

    sDRdst <= sD_RegControl(6 downto 4);
    sDWB   <= sD_RegControl(7);
    sDMR   <= sMemControl(5);
    
    stagedecode_inst: entity work.StageDecode
    port map (
      clk          => clk,
      eRdst        => sDRdst,
      eWB          => sDWB,
      eMR          => sDMR,
      Hazard       => sHazard,
      flush        => sFlushFetch,
      reset        => resetD,
      oReset       => resetE,
      INPUT        => INPUT,
      INT_CRT      => sFetchIntSigOut,
      iPC          => fetchPC,
      oPC          => decodePC,
      ERROR        => dummyError2,
      inst         => sInstOut,
      DecodeValue  => sDecodeValue,
      oJumpControl => sJumpType,
      oPortControl => sOutputEnable,
      oALUControl  => sALUControl,
      oRegControl  => sD_RegControl,
      oMemControl  => sMemControl,
      oR1_for      => sR1_for,
      oR2_for      => sR2_for,
      oRsrc1       => sRsrc1,
      oRsrc2       => sRsrc2,
      oOp1         => sOp1,
      oOp2         => sOp2,
      iRdst        => sRdst,
      iWB          => sWB,
      iValue       => sMemoryValue
    );

    

    stageexecute_inst: entity work.StageExecute
    port map (
      clk                   => clk,
      flush                 => sFlushDecode,
      reset                 => resetE,
      oReset                => resetM,
      Rsrc1_forwardable     => sR1_for,
      Rsrc2_forwardable     => sR2_for,
      execute_forward_PFR   => sE_RegisterControl(0),
      execute_forward_WB    => sE_RegisterControl(7),
      memory_forward_WB     => sWB,
      iMW                   => sMemControl(4),
      iMR                   => sMemControl(5),
      i_F                   => sMemControl(1),
      i_P                   => sMemControl(0),
      OE                    => sOutputEnable,
      ERROR                 => dummyError3,
      oMR                   => sMR,
      oMW                   => sMW,
      o_F                   => sMF,
      o_P                   => sMP,
      ZeroFlag              => sZeroFlag,
      iRegisterControl      => sD_RegControl,
      oRegisterControl      => sE_RegisterControl,
      VS                    => sMemControl(3 downto 2),
      Rsrc1                 => sRsrc1,
      Rsrc2                 => sRsrc2,
      execute_forward_Rdst  => sE_RegisterControl(6 downto 4),
      memory_forward_Rdst   => sRdst,
      ALU_OP                => sALUControl,
      Op_1                  => sOp1,
      Op_2                  => sOp2,
      execute_forward_Value => sExecuteValue,
      memory_forward_Value  => sMemoryValue,
      FR_forward_Value      => sDirectValue, -- not the best way to do this btw ... 
      iPC                   => decodePC,
      oPC                   => executePC,
      oValue                => sExecuteValue,
      Addr                  => sAddr,
      OUTPUT                => OUTPUT
    );

    stagememory_inst: entity work.StageMemory
    port map (
      clk       => clk,
      flush     => sFlushExecute,
      reset     => resetM,
      iPC       => executePC,
      oPC       => memoryPc,
      ERROR     => dummyError4,
      iWB       => sE_RegisterControl(7),
      iPCU      => sE_RegisterControl(1),
      iRdst     => sE_RegisterControl(6 downto 4),
      iSPO      => sE_RegisterControl(3 downto 2),
      oWB       => sWB,
      oPCU      => sPCU,
      oRdst     => sRdst,
      iMR       => sMR,
      iMW       => sMW,
      i_F       => sMF,
      i_P       => sMP,
      Addr      => sAddr,
      Value     => sExecuteValue,
      oValue    => sMemoryValue,
      oMemValue => sDirectValue
    );

end architecture;