Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StageDecode is
    port(
        clk , flush , reset : in std_logic;
        INPUT   : in std_logic_vector(0 to 31);
        
        -- hazard stuff
        eRdst          : in std_logic_vector(2 downto 0);
        eWB,eMR        : in std_logic;

        --decode stuff
        iPC           : in std_logic_vector(31 downto 0);
        oPC           : out std_logic_vector(31 downto 0);
        ERROR, Hazard , oReset : out std_logic;
        inst          : in std_logic_vector(0 to 31); -- INPUT INSTRUCTION
        INT_CRT       : in std_logic_vector(0 to 3);  -- INPUT INT CONTROL

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
end StageDecode;

architecture StageDecodeArch of StageDecode is
    -- instruction signals
    signal ControlSignals : std_logic_vector(24 downto 0);
    signal fOpCode        : std_logic_vector(4  downto 0) := "00000";
    signal fRdst  : std_logic_vector(2  downto 0);
    signal fRsrc1 : std_logic_vector(2  downto 0);
    signal fRsrc2 : std_logic_vector(2  downto 0);
    signal fEA    : std_logic_vector(19 downto 0);
    signal fImmd1 : std_logic_vector(15 downto 0);
    signal fImmd2 : std_logic_vector(5  downto 0);

    -- CU signals
    signal RS           : std_logic;
    signal Reg1         : std_logic_vector(2 downto 0) := "000";
    signal Reg2         : std_logic_vector(2 downto 0) := "000";
    signal Op1Select    : std_logic_vector(1 downto 0);
    signal Op2Select    : std_logic_vector(1 downto 0);
    signal JumpControl  : std_logic_vector(1 downto 0);
    signal PortControl  : std_logic;
    signal ALUControl   : std_logic_vector(3 downto 0);
    signal RegControl   : std_logic_vector(7 downto 0);
    signal MemControl   : std_logic_vector(5 downto 0);
    signal R1_for       : std_logic;
    signal R2_for       : std_logic;
    signal tR1_for      : std_logic;
    signal tR2_for      : std_logic;
    signal Op1          : std_logic_vector(31 downto 0);
    signal Op2          : std_logic_vector(31 downto 0);

    signal Rsrc1        : std_logic_vector(2 downto 0);
    signal Rsrc2        : std_logic_vector(2 downto 0);
    signal Op2Source    : std_logic;
    
    signal Reg1V        : std_logic_vector(31 downto 0);
    signal Reg2V        : std_logic_vector(31 downto 0);


    constant EA_FILLER    : std_logic_vector(11 downto 0) := (others => '0');
    constant IMMD1_FILLER : std_logic_vector(15 downto 0) := (others => '0');
    constant IMMD2_FILLER : std_logic_vector(25 downto 0) := (others => '0');

    -- Stall Stuff
    -- signal cPC            : std_logic_vector(31 downto 0);
    -- signal cInst          : std_logic_vector(0 to 31);
    -- signal cINT_CRT       : std_logic_vector(0 to 3);
    signal sHazard        : std_logic;
    -- signal cHazard        : std_logic;

    
begin

    fOpCode  <= inst(0  to 4 ) when flush = '0' else (others => '0');
    fRdst    <= inst(5  to 7 ) when flush = '0' else (others => '0');
    fRsrc1   <= inst(8  to 10) when flush = '0' else (others => '0');
    fRsrc2   <= inst(11 to 13) when flush = '0' else (others => '0');
    fEA      <= inst(12 to 31) when flush = '0' else (others => '0');
    fImmd1   <= inst(16 to 31) when flush = '0' else (others => '0');
    fImmd2   <= inst(8  to 13) when flush = '0' else (others => '0');

    controlunit_inst: entity work.ControlUnit
    port map (
      op_code => fOpCode,
      int_sig => INT_CRT,
      sig     => ControlSignals
    );

    RS          <= ControlSignals(22);
    Op1Select   <= ControlSignals(21 downto 20);
    Op2Select   <= ControlSignals(19 downto 18);
    JumpControl <= ControlSignals(17 downto 16);
    PortControl <= ControlSignals(15);
    ALUControl  <= ControlSignals(14 downto 11);
    RegControl  <= ControlSignals(10) & fRdst & ControlSignals(9 downto 6);
    MemControl  <= ControlSignals(5 downto 0);

    forwardcalculationunit_inst : entity work.ForwardCalculationUnit
    port map (
      Op1S      => Op1Select,
      Op2S      => Op2Select,
      Op1F      => R1_for,
      Op2F      => R2_for,
      Op2Source => Op2Source
    );

    tR1_for <= ControlSignals(24) and R1_for;
    tR2_for <= ControlSignals(23) and R2_for;

    Reg1 <= fRdst when RS = '0'
       else fRsrc1;
    
    Reg2 <= fRsrc2;


    Registers: entity work.RegisterFile
    port map (
      clk   => clk,
      reset => reset,
      Rsrc1 => Reg1,
      Rsrc2 => Reg2,
      Rdst  => iRdst,
      WB    => iWB,
      Value => iValue,
      Rout1 => Reg1V,
      Rout2 => Reg2V
    );

    Op1 <= Reg1V           when Op1Select = "00"
      else iPC             when Op1Select = "01"
      else INPUT           when Op1Select = "10"
      else EA_FILLER & fEA when Op1Select = "11";

    Op2 <= Reg2V                 when Op2Select = "00"
      else IMMD1_FILLER & fImmd1 when Op2Select = "01"
      else Reg1V                 when Op2Select = "10"
      else IMMD2_FILLER & fImmd2 when Op2Select = "11";

    Rsrc1 <= Reg1;
    Rsrc2 <= Reg2 when Op2Source = '0' else Reg1;

    hazarddetectionunit_inst: entity work.HazardDetectionUnit
    port map (
      MR         => eMR,
      MemoryWB   => eWB,
      Rsrc1F     => tR1_for,
      Rsrc2F     => tR2_for,
      MemoryRdst => eRdst,
      Rsrc1      => Rsrc1,
      Rsrc2      => Rsrc2,
      hazard     => sHazard
    );
    Hazard <= sHazard;

    
    process( clk )
    begin
        if (clk'event and clk = '1') then
          oReset <= reset;
          if (sHazard = '1') then
            oPC <= iPC;
            oJumpControl  <= (others => '0');
            oPortControl  <= '0';
            oALUControl   <= (others => '0');
            oRegControl   <= (others => '0');
            oMemControl   <= (others => '0');
            oR1_for       <= '0';
            oR2_for       <= '0';
            oRsrc1        <= (others => '0');
            oRsrc2        <= (others => '0');
            oOp1          <= (others => '0');
            oOp2          <= (others => '0');
            DecodeValue   <= (others => '0');
          else
            oPC <= iPC;
            oJumpControl  <= JumpControl;
            oPortControl  <= PortControl;
            oALUControl   <= ALUControl;
            oRegControl   <= RegControl;
            oMemControl   <= MemControl;
            oR1_for       <= tR1_for;
            oR2_for       <= tR2_for;
            oRsrc1        <= Rsrc1;
            oRsrc2        <= Rsrc2;
            oOp1          <= Op1;
            oOp2          <= Op2;
            DecodeValue   <= Reg1V;
          end if;
        end if;
    end process ; 

end architecture;