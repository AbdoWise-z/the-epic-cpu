Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StageExecute_tb is
end entity;

architecture StageExecute_tbArch of StageExecute_tb is
    component StageExecute is 
    port(
        clk , Rsrc1_forwardable , Rsrc2_forwardable , execute_forward_PFR , iPFR , iWB 
        , execute_forward_WB , memory_forward_WB , iPCU , iMW , iMR , i_F , i_P , OE : in std_logic;
        ERROR , oWB , oPCU , oPFR ,  oMR , oMW ,  o_F , o_P , ZeroFlag : out std_logic;

        VS , iSPO : in std_logic_vector(1 downto 0);
        oSPO : out std_logic_vector(1 downto 0);

        Rsrc1 , Rsrc2 , iRdst , execute_forward_Rdst , memory_forward_Rdst : in std_logic_vector(2 downto 0);
        oRdst : out std_logic_vector(2 downto 0);

        ALU_OP : in std_logic_vector(3 downto 0);

        Op_1 , Op_2 , execute_forward_Value , memory_forward_Value , FR_forward_Value , iPC : in std_logic_vector(31 downto 0);
        oPC , oValue , Addr , OUTPUT : out std_logic_vector(31 downto 0)
    );
    end component;
        signal sclk , sRsrc1_forwardable , sRsrc2_forwardable , sexecute_forward_PFR , siPFR , siWB 
            , sexecute_forward_WB , smemory_forward_WB , siPCU , siMW , siMR , si_F , si_P , sOE : std_logic := '0';
        signal sERROR , soWB , soPCU , soPFR ,  soMR , soMW ,  so_F , so_P , sZeroFlag : std_logic;

        signal sVS , siSPO :  std_logic_vector(1 downto 0) := "00";
        signal soSPO :  std_logic_vector(1 downto 0);

        signal sRsrc1 , sRsrc2 , siRdst , sexecute_forward_Rdst , smemory_forward_Rdst : std_logic_vector(2 downto 0) := "000";
        signal soRdst : std_logic_vector(2 downto 0);

        signal sALU_OP : std_logic_vector(3 downto 0) := "0000";

        signal sOp_1 , sOp_2 , sexecute_forward_Value , smemory_forward_Value , sFR_forward_Value , siPC : std_logic_vector(31 downto 0) := (others => '0');
        signal soPC , soValue , sAddr , sOUTPUT : std_logic_vector(31 downto 0);
begin

    u : StageExecute
    port map (
      sclk      ,             
      sRsrc1_forwardable,   
      sRsrc2_forwardable,     
      sexecute_forward_PFR ,  
      siPFR,                
      siWB ,                  
      sexecute_forward_WB ,   
      smemory_forward_WB   ,  
      siPCU             ,     
      siMW            ,       
      siMR             ,      
      si_F            ,       
      si_P            ,       
      sOE              ,     
      sERROR          ,       
      soWB            ,       
      soPCU           ,      
      soPFR          ,        
      soMR           ,      
      soMW           ,        
      so_F,
      so_P           ,      
      sZeroFlag     ,         
      sVS            ,       
      siSPO          ,       
      soSPO          ,        
      sRsrc1          ,     
      sRsrc2          ,      
      siRdst             ,    
      sexecute_forward_Rdst  ,
      smemory_forward_Rdst  , 
      soRdst           ,      
      sALU_OP,
      sOp_1        ,          
      sOp_2       ,          
      sexecute_forward_Value ,
      smemory_forward_Value  ,
      sFR_forward_Value     , 
      siPC          ,         
      soPC        ,           
      soValue    ,           
      sAddr       ,           
      sOUTPUT                
    );


    process
    begin
        --check FR / Adder / Value / Output

        wait for 1 ns;
        --ADD
        sclk <= not sclk;
        sOp_1 <= (31 downto 2 => '0') & "11";
        sOp_2 <= (31 downto 2 => '0') & "11";
        sVS <= "00";
        sALU_OP <= "0101";   
        sOE <= '0';
        wait for 5 ns;

        sclk <= not sclk;
        wait for 5 ns;

        --ADD WITH OUTPUT
        sclk <= not sclk;
        sOp_1 <= (31 downto 2 => '0') & "11";
        sOp_2 <= (31 downto 2 => '0') & "11";
        sVS <= "00";
        sALU_OP <= "0101";  
        sOE <= '1';
        wait for 5 ns;

        sclk <= not sclk;
        wait for 5 ns;

        --ADD WITH OUTPUT WITH CARRY
        sclk <= not sclk;
        sOp_1 <= (others => '1');
        sOp_2 <= (31 downto 1 => '0') & '1';
        sVS <= "00";
        sALU_OP <= "0101";
        sOE <= '1';
        wait for 5 ns;

        sclk <= not sclk;
        wait for 5 ns;

        --SELECT OP1
        sclk <= not sclk;
        sOp_1 <= (31 downto 3 => '0') & "111";
        sOp_2 <= (others => '1');
        sVS <= "01";
        sALU_OP <= "0000";
        sOE <= '1';
        wait for 5 ns;

        sclk <= not sclk;
        wait for 5 ns;

        --SELECT OP2
        sclk <= not sclk;
        sOp_1 <= (31 downto 3 => '0') & "111";
        sOp_2 <= (31 downto 4 => '0') & "1001";
        sVS <= "10";
        sALU_OP <= "0000";
        sOE <= '1';
        wait for 5 ns;

        sclk <= not sclk;
        wait for 5 ns;

       --SELECT FR
       sclk <= not sclk;
       sOp_1 <= (31 downto 3 => '0') & "111";
       sOp_2 <= (others => '1');
       sVS <= "11";
       sALU_OP <= "0000";
       sOE <= '1';
       wait for 5 ns;

       sclk <= not sclk;
        wait for 5 ns;

        wait;
    end process;
end architecture StageExecute_tbArch;