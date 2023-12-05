Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StageExecute is
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
end StageExecute;

architecture StageExecuteArch of StageExecute is 

    component ALU is 
        port(
            A,B : in std_logic_vector(31 downto 0);
            FRin : in std_logic_vector(3 downto 0);
            S   : in std_logic_vector(3 downto 0);
            
            F   : out std_logic_vector(31 downto 0);
            FRout : out std_logic_vector(3 downto 0)
        );
    end component;

    signal ALU_A , ALU_B , ALU_F , sValue , sOutput : std_logic_vector(31 downto 0) := (others => '0');
    signal ALU_FRin , sALU_FRin , ALU_FRout : std_logic_vector(3 downto 0) := (others => '0');

    signal FORWARD_out1, FORWARD_out2 : std_logic_vector(1 downto 0);

    constant ZERO     : std_logic_vector(27 downto 0) := (others => '0');
    
    signal fOE : std_logic;
    signal fALU_OP     : std_logic_vector(3 downto 0) := (others => '0');
    signal fRegisterControl : std_logic_vector(7 downto 0);
    signal fMR : std_logic; 
    signal fMW : std_logic; 
    signal fP : std_logic; 
    signal fF : std_logic; 
    signal fVS : std_logic_vector(1 downto 0); 
    signal fRsrc1_forwardable : std_logic; 
    signal fRsrc2_forwardable : std_logic; 

begin
    -------------------------------------------------------------TODO FORWARD UNIT-----------------------------------------------------------------

    ----- flush ------
    fOE                <= OE                when flush = '0' else '0';
    fALU_OP            <= ALU_OP            when flush = '0' else (others => '0');
    fRegisterControl   <= iRegisterControl  when flush = '0' else (others => '0');
    fMR                <= iMR               when flush = '0' else '0';
    fMW                <= iMW               when flush = '0' else '0';
    fP                 <= i_P               when flush = '0' else '0';
    fF                 <= i_F               when flush = '0' else '0';
    fVS                <= VS                when flush = '0' else (others => '0');
    fRsrc1_forwardable <= Rsrc1_forwardable when flush = '0' else '0';
    fRsrc2_forwardable <= Rsrc2_forwardable when flush = '0' else '0';

    

    FORWARD_out1 <= (others => '0');  --for now...
    FORWARD_out2 <= (others => '0');  --for now...

    ALU_A <= Op_1                   when FORWARD_out1 = "00" 
        else execute_forward_Value  when FORWARD_out1 = "01"
        else memory_forward_Value   when FORWARD_out1 = "10"
        else (others => '0')        when FORWARD_out1 = "11";  --should never happen

    ALU_B <= Op_2                   when FORWARD_out2 = "00" 
        else execute_forward_Value  when FORWARD_out2 = "01"
        else memory_forward_Value   when FORWARD_out2 = "10"
        else (others => '0')        when FORWARD_out2 = "11";  --should never happen

     alu_cmp : ALU port map(ALU_A,ALU_B,ALU_FRin,fALU_OP,ALU_F,ALU_FRout);

    sValue <= ALU_F                 when fVS = "00"
        else ALU_A                  when fVS = "01"
        else ALU_B                  when fVS = "10"
        else ZERO & ALU_FRout       when fVS = "11";

    sALU_FRin <= FR_forward_Value(3 downto 0) when execute_forward_PFR = '1'
        else ALU_FRout;
    
    ZeroFlag <= ALU_FRin(3);

    OUTPUT <= sOUTPUT;

    process(clk)
    begin
        if (rising_edge(clk)) then

            oRegisterControl <= fRegisterControl;
            oPC <= iPC;
            o_F <= fF;
            o_P <= fP;
            oMR <= fMR;
            oMW <= fMW;

            ALU_FRin <= sALU_FRin;
            oValue <= sValue;
            Addr <= ALU_A;
            
            if fOE = '1' then
                sOUTPUT <= sValue;
            else 
                sOUTPUT <= sOUTPUT;
            end if;
            
        end if;
    end process;



end architecture StageExecuteArch;