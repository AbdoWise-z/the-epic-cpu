Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity StageExecute is
    port(

        clk , Rsrc1_forwardable , Rsrc2_forwardable , execute_forward_PFR , iPFR , iWB , 
        execute_forward_WB , memory_forward_WB , iPCU , iMW , iMR , i_F , i_P , OE : in std_logic;
        ERROR , oWB , oPCU , oPFR ,  oMR , oMW ,  o_F , o_P , ZeroFlag : out std_logic;

        VS , iSPO : in std_logic_vector(1 downto 0);
        oSPO : out std_logic_vector(1 downto 0);

        Rsrc1 , Rsrc2 , iRdst , execute_forward_Rdst , memory_forward_Rdst : in std_logic_vector(2 downto 0);
        oRdst : out std_logic_vector(2 downto 0);

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

    signal ALU_A , ALU_B , ALU_F , sValue , sPC , sOutput : std_logic_vector(31 downto 0);
    signal ALU_FRin , sALU_FRin , ALU_FRout : std_logic_vector(3 downto 0);

    signal FORWARD_out1, FORWARD_out2 : std_logic_vector(1 downto 0);

    constant ZERO     : std_logic_vector(27 downto 0) := (others => '0');


begin
    -------------------------------------------------------------TODO FORWARD UNIT-----------------------------------------------------------------

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

     alu_cmp : ALU port map(ALU_A,ALU_B,ALU_FRin,ALU_OP,ALU_F,ALU_FRout);

    sValue <= ALU_F                 when VS = "00"
        else ALU_A                  when VS = "01"
        else ALU_B                  when VS = "10"
        else ZERO & ALU_FRout       when VS = "11";

    sALU_FRin <= ALU_FRout when execute_forward_PFR = '0'
        else FR_forward_Value(3 downto 0) when execute_forward_PFR = '1';
    
    ZeroFlag <= sALU_FRin(3);

    OUTPUT <= sOUTPUT;


     process(clk)
     begin
        if (rising_edge(clk)) then

            oPC <= iPC;

            ALU_FRin <= sALU_FRin;
            
            oValue <= sValue;

            oWB <= iWB;
            oRdst <= iRdst;
            oSPO <= iSPO;
            oPCU <= iPCU;
            oPFR <= iPFR;

            o_F <= i_F;
            o_P <= i_P;
            oMR <= iMR;
            oMW <= iMW;

            Addr <= ALU_A;
            
            if OE = '1' then
                sOUTPUT <= sValue;
            else 
                sOUTPUT <= sOUTPUT;
            end if;
            
        end if;
     end process;



end architecture StageExecuteArch;