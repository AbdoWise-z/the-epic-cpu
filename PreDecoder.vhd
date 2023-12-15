Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PreDecoder is
  port (
    clk    : in std_logic;
    flush  : in std_logic;
    INT    : in std_logic; -- execute interrupt
    RESET  : in std_logic; -- execute reset
    InstIn : in std_logic_vector(15 downto 0);
    InstOut   : out std_logic_vector(31 downto 0);
    intSigOut : out std_logic_vector(3 downto 0)
  ) ;
end PreDecoder;

architecture PreDecoderArch of PreDecoder is
    constant nop          : std_logic_vector(31 downto 0) := (others => '0');
    constant RST_INST     : std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; -- the instruction used in Load PC (I set EA to 0 by hand here)
    constant INT_INST     : std_logic_vector(31 downto 0) := "00000000000000000000000000000010"; -- push pc
    
    constant filler  : std_logic_vector(15 downto 0) := (others => '0');
    
    signal half : std_logic_vector(15 downto 0);
    signal multi    : std_logic := '0';
    
    signal MULTI_1 : std_logic_vector(4 downto 0) := "01101"; -- ADDI
    signal MULTI_2 : std_logic_vector(4 downto 0) := "10011"; -- LDM
    signal MULTI_3 : std_logic_vector(4 downto 0) := "10100"; -- LDD
    signal MULTI_4 : std_logic_vector(4 downto 0) := "10101"; -- STD

    
    signal latch_inst   : std_logic_vector(31 downto 0);
    signal latch_intSig : std_logic_vector(3 downto 0);
    signal delay        : std_logic_vector(2 downto 0) := "00";
    signal delayType    : std_logic_vector(2 downto 0) := "00";
    signal IntSequance   : std_logic_vector(1 downto 0); -- int sequance is   : push pc,push fr,load pc
    signal ResetSequance : std_logic_vector(1 downto 0); -- reset sequance is : load pc 

    signal shouoldINT : std_logic := '0';
begin

    latch_inst <= 
         RST_INST when ResetSequance /= "00"
    else INT_INST when IntSequance   /= "00"
    else nop when flush = '1' and multi = '1'
    else nop when delay /= "00"
    else half & InstIn when multi = '1'
    else nop when InstIn(15 downto 11) = MULTI_1 -- op-code == ADDI/LDM/LDD/STD
    else nop when InstIn(15 downto 11) = MULTI_2
    else nop when InstIn(15 downto 11) = MULTI_3
    else nop when InstIn(15 downto 11) = MULTI_4
    else InstIn & filler;

    latch_intSig <= 
         "1001" when INT_INST  = "11"
    else "1010" when INT_INST  = "10"
    else "1011" when INT_INST  = "01"
    else "0000";

    process (clk) begin
        if (clk'event and clk = '1') then
            if (RESET = '1') then
                ResetSequance <= "11";
                -- todo : fix this logic ..
            else
                if (ResetSequance = "11") then
                    ResetSequance <= "10";
                end if;
                if (ResetSequance = "10") then
                    ResetSequance <= "01";
                end if;
                if (ResetSequance = "01") then
                    ResetSequance <= "00";
                end if;
                if (ResetSequance = "00") then
                    
                end if;
            end if;
            half <= InstIn;

            InstOut <= latch_inst;
            intSigOut <= latch_intSig;

            if (latch_inst(31 downto 27) = "11111") then -- op code of swap

            end if;

            

            if (INT = '1') then
                IntSequance <= "11";
            else
                if (IntSequance = "11") then
                    IntSequance <= "10";
                end if;
                if (IntSequance = "10") then
                    IntSequance <= "01";
                end if;
                if (IntSequance = "01") then
                    IntSequance <= "00";
                end if;
                if (IntSequance = "00") then
                    IntSequance <= "00";
                end if;
            end if;
            
            if (multi = '1') then
                multi <= '0';
            else
                if (InstIn(15 downto 11) = MULTI_1) then
                    multi <= '1';
                elsif (InstIn(15 downto 11) = MULTI_2) then
                    multi <= '1';
                elsif (InstIn(15 downto 11) = MULTI_3) then
                    multi <= '1';
                elsif (InstIn(15 downto 11) = MULTI_4) then
                    multi <= '1';
                else
                    multi <= '0';
                end if;                        
            end if;
        end if;
    end process;
    
end architecture PreDecoderArch;