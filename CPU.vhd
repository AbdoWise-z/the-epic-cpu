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
    component StageFetch is
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
    end component;

    component StageDecode is
        port(
            clk , flush , reset : in std_logic;
            INPUT : in std_logic_vector(0 to 31);
    
            --decode stuff
            iPC : in std_logic_vector(31 downto 0);
            oPC : out std_logic_vector(31 downto 0);
            ERROR : out std_logic;
            inst : in std_logic_vector(0 to 31);
    
            DecodeValue   : out std_logic_vector(31 downto 0);
            oJumpControl  : out std_logic_vector(1 downto 0);
            oPortControl  : out std_logic;
            oALUControl   : out std_logic_vector(3 downto 0);
            oRegControl   : out std_logic_vector(7 downto 0);
            oMemControl   : out std_logic_vector(5 downto 0);
            oR1_for       : out std_logic;
            oR2_for       : out std_logic;
            oRsrc1        : out std_logic_vector(2 downto 0);
            oRsrc2        : out std_logic_vector(2 downto 0);
            oOp1          : out std_logic_vector(31 downto 0);
            oOp2          : out std_logic_vector(31 downto 0);
    
    
            --WB stuff
            iRdst  : in std_logic_vector(2 downto 0);
            iWB    : in std_logic;
            iValue : in std_logic_vector(0 to 31)
    
        );
    end component;

    component StageExecute is
        port(
            clk , flush : in std_logic;
    
            Rsrc1_forwardable , Rsrc2_forwardable , execute_forward_PFR , execute_forward_WB , memory_forward_WB , iMW , iMR , i_F , i_P , OE : in std_logic;
            ERROR ,  oMR , oMW ,  o_F , o_P , ZeroFlag : out std_logic;
    
            iRegisterControl : in std_logic_vector(7 downto 0);
            oRegisterControl : out std_logic_vector(7 downto 0);
    
            VS : in std_logic_vector(1 downto 0);
    
            Rsrc1 , Rsrc2 , execute_forward_Rdst , memory_forward_Rdst : in std_logic_vector(2 downto 0);
            ALU_OP : in std_logic_vector(3 downto 0);
    
            Op_1 , Op_2 , execute_forward_Value , memory_forward_Value , FR_forward_Value , iPC : in std_logic_vector(31 downto 0);
            oPC , oValue , Addr , OUTPUT : out std_logic_vector(31 downto 0)
        );
    end component;

    component StageMemory is
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
    end component;

    -- common
    signal fetchPC , decodePC , executePC , memoryPc : std_logic_vector(31 downto 0);
    signal dummyError1 , dummyError2 , dummyError3 , dummyError4 : std_logic;

    -- Fetch I/O
    signal sPCU , sZeroFlag , sExecuteWB , sMemWB , sControllerPCSelect   : std_logic;
    signal sJRdst , sERdst , sMRdst                                       : std_logic_vector(2 downto 0);
    signal sJumpType                                                      : std_logic_vector(1 downto 0);
    signal sDecodeValue , sExecuteValue , sMemoryValue , sControllerValue : std_logic_vector(31 downto 0);
    signal sInstOut                                                       : std_logic_vector(31 downto 0);
    signal sFlushFetch , sFlushDecode , sFlushExecute                     : std_logic;

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

begin

    sJRdst <= sD_RegControl(6 downto 4);
    sERdst <= sE_RegisterControl(6 downto 4);
    sMRdst <= sRdst;
    sExecuteWB <= sE_RegisterControl(7);
    sMemWB <= sWB;

    stagefetch_inst: StageFetch
    port map (
      clk                => clk,
      reset              => reset,
      PCU                => sPCU,
      ZeroFlag           => sZeroFlag,
      ExecuteWB          => sExecuteWB,
      MemWB              => sMemWB,
      ControllerPCSelect => sControllerPCSelect,
      Rdst               => sJRdst,
      ERdst              => sERdst,
      MRdst              => sMRdst,
      JmpType            => sJumpType,
      DecodeValue        => sDecodeValue,
      ExecuteValue       => sExecuteValue,
      MemoryValue        => sMemoryValue,
      ControllerValue    => sControllerValue,
      Error              => dummyError1,
      InstOut            => sInstOut,
      nextPC             => fetchPC,
      Flush_Fetch        => sFlushFetch,
      Flush_Decode       => sFlushDecode,
      Flush_Execute      => sFlushExecute
    );

    stagedecode_inst: StageDecode
    port map (
      clk          => clk,
      flush        => sFlushFetch,
      reset        => reset,
      INPUT        => INPUT,
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

    

    -- TODO : add PFR for interrupts
    stageexecute_inst: StageExecute
    port map (
      clk                   => clk,
      flush                 => sFlushDecode,
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
      FR_forward_Value      => sMemoryValue,
      iPC                   => decodePC,
      oPC                   => executePC,
      oValue                => sExecuteValue,
      Addr                  => sAddr,
      OUTPUT                => OUTPUT
    );
    
    stagememory_inst: StageMemory
    port map (
      clk       => clk,
      flush     => sFlushExecute,
      reset     => reset,
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