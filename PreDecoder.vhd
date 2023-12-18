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
    intSigOut : out std_logic_vector(3 downto 0);
    PausePC   : out std_logic
  ) ;
end PreDecoder;

architecture PreDecoderArch of PreDecoder is
    constant nop          : std_logic_vector(31 downto 0) := (others => '0');
    constant RST_INST     : std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; -- the instruction used in Load PC (I set EA to 0 by hand here)
    constant INT_INST     : std_logic_vector(31 downto 0) := "00000000000000000000000000000010"; -- push pc
    
    constant filler  : std_logic_vector(15 downto 0) := (others => '0');
    
    signal half     : std_logic_vector(15 downto 0);
    signal multi    : std_logic := '0';
    signal delayedInst : std_logic_vector(15 downto 0);
    
    signal MULTI_1 : std_logic_vector(4 downto 0) := "01101"; -- ADDI
    signal MULTI_2 : std_logic_vector(4 downto 0) := "10011"; -- LDM
    signal MULTI_3 : std_logic_vector(4 downto 0) := "10100"; -- LDD
    signal MULTI_4 : std_logic_vector(4 downto 0) := "10101"; -- STD

    
    signal delay         : std_logic_vector(1 downto 0) := "00";
    signal delayType     : std_logic_vector(1 downto 0) := "00";
    signal IntSequance   : std_logic_vector(1 downto 0) := "00"; -- int sequance is   : push pc,push fr,load pc
    signal ResetSequance : std_logic_vector(1 downto 0) := "00"; -- reset sequance is : load pc 

    signal NormalExecutionInstOut : std_logic_vector(31 downto 0);
    
begin

    NormalExecutionInstOut <= 
         nop when multi = '1' and flush = '1'
    else half & InstIn when multi = '1'
    else nop when InstIn(15 downto 11) = MULTI_1 -- op-code == ADDI/LDM/LDD/STD
    else nop when InstIn(15 downto 11) = MULTI_2
    else nop when InstIn(15 downto 11) = MULTI_3
    else nop when InstIn(15 downto 11) = MULTI_4
    else InstIn & filler;

    PausePC <= '1' when                                        -- Pause the pc if: (should add "About to reset" but it doesn't really matter tbh)
        (delay /= "00" and delay /= "01" and flush = '0') or   --   1. hardware writing an instrctuin
        ResetSequance /= "00" or                               --   2. in an ResetSequance
        IntSequance /= "00" or                                 --   3. in an Interrupt Sequance
        (INT = '1' and multi = '0') or                         --   4. About to start an interrupt Sequance
        (multi = '0' and InstIn(15 downto 11) = "11111") or    --   5. About to start a delay due SWAP
        (multi = '0' and InstIn(15 downto 11) = "11110")       --   6. About to start a delay due RTI
    else '0';

    process (clk) begin
        if (clk'event and clk = '1') then
            if (RESET = '1') then
                -- if we should reset, we start the reset sequance
                multi <= '0';
                delay <= "00";
                delayType <= "00";
                ResetSequance <= "11";
                InstOut <= RST_INST; -- RESET 0
                intSigOut <= "1000";
            else
                if (ResetSequance /= "00") then
                    -- we are in a reset sequance
                    if (ResetSequance = "11") then
                        ResetSequance <= "10";
                        InstOut <= RST_INST; -- RESET 1
                        intSigOut <= "0000";
                    elsif (ResetSequance = "10") then
                        ResetSequance <= "01";
                        InstOut <= RST_INST; -- RESET 2
                        intSigOut <= "0000";
                    else
                        ResetSequance <= "00";
                        InstOut <= RST_INST; -- RESET 3
                        intSigOut <= "0000";
                    end if;
                else
                    if (IntSequance /= "00") then -- we are in interrupt sequance
                        if (IntSequance = "11") then
                            IntSequance <= "01"; -- PUSH FR
                            InstOut <= INT_INST; -- INT 1
                            intSigOut <= "1010"; 
                        elsif (IntSequance = "01") then
                            IntSequance <= "00"; -- LOAD PC
                            InstOut <= INT_INST; -- INT 2
                            intSigOut <= "1011";
                        else
                            report "IntSequance reached area it shouldn't";
                        end if;
                    elsif (delay /= "00" and flush = '0') then -- we are delayed / we need to write a sequance (swap , RTI)
                        if (delayType = "00") then
                            -- swap type
                            if (delay = "11") then
                                delay <= "01";
                                InstOut <= "01011" & InstIn(4 downto 2) & InstIn(7 downto 0) & filler; -- XOR with the same inputs
                                intSigOut <= "0000"; -- SWAP 1
                            elsif (delay = "01") then
                                delay <= "00";
                                InstOut <= "01011" & InstIn(7 downto 5) & InstIn(7 downto 0) & filler; -- XOR with the same inputs
                                intSigOut <= "0000"; -- SWAP 2
                            else 
                                -- should never happen
                                report "reached a block you shouldn't ever reach ??";
                            end if;
                        elsif (delayType = "01") then
                            -- rti type
                            if (delay = "01") then
                                delay <= "00";
                                InstOut <= "11101" & delayedInst(10 downto 8) & delayedInst(10 downto 3) & filler; -- POP-PC (RET) other bits are useless
                                intSigOut <= "0000"; -- RTI 1
                            else
                                -- should never happen
                                report "reached a block you shouldn't ever reach ??";
                            end if;
                        elsif (delayType = "10") then
                            -- hlt type
                            InstOut <= nop;     -- HLT X
                            intSigOut <= "0000";
                            delay <= "11"; -- just hlt indefently
                        end if;
                    else
                        -- not delyad (or flushed) or interrupted
                        if (INT = '1' and multi = '0') then -- multi = 1 then we still have to fetch this instruction (complete at 2-cycle instrctuin)
                            -- we should start an interrupt sequance
                            -- sequance is as fullows
                            -- PUSH PC , PUSH FR , LDD PC
                            IntSequance <= "11"; -- PUSH PC
                            InstOut     <= INT_INST; -- INT 0
                            intSigOut   <= "1001"; 
                            multi <= '0';
                        else 
                            -- now this is the normal case execution (finally heh)
                            if (multi = '1') then
                                -- should nop this instruction and reset the multi flag
                                -- in this cycle we are only finishing of an instruction that was 2-cycle instruction
                                multi <= '0';
                                delay <= "00";
                                InstOut <= NormalExecutionInstOut;
                                intSigOut <= "0000";
                            else
                                if (InstIn(15 downto 11) = MULTI_1 or InstIn(15 downto 11) = MULTI_2 or InstIn(15 downto 11) = MULTI_3 or InstIn(15 downto 11) = MULTI_3) then
                                    InstOut <= NormalExecutionInstOut;
                                    intSigOut <= "0000"; 
                                    half <= InstIn;
                                    multi <= '1';
                                    delay <= "00";
                                elsif (InstIn(15 downto 11) = "11111") then -- SWAP
                                    delayedInst <= InstIn;
                                    -- 15,11 op | 10,8 Rdst | 7,5 Rsrc1 | 4,2 Rsrc1
                                    InstOut <= "01011" & InstIn(7 downto 5) & InstIn(7 downto 0) & filler; -- XOR with the same inputs
                                    intSigOut <= "0000"; -- SWAP 0
                                    delay <= "11";
                                    delayType <= "00";
                                elsif (InstIn(15 downto 11) = "11110") then -- RTI
                                    delayedInst <= InstIn;
                                    InstOut <= "11110" & InstIn(10 downto 8) & InstIn(10 downto 3) & filler; -- POP-FR (RET) other bits are useless
                                    intSigOut <= "0000"; -- RTI 0
                                    delay <= "01";
                                    delayType <= "01";
                                elsif (InstIn(15 downto 11) = "11100") then -- HLT
                                    delayedInst <= InstIn;
                                    InstOut <= nop; -- just nop
                                    intSigOut <= "0000"; -- HLT 0
                                    delay <= "11";
                                    delayType <= "10";
                                else -- normal 1-cycle instruction
                                    InstOut <= NormalExecutionInstOut;
                                    intSigOut <= "0000";
                                    delay <= "00";
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
end architecture PreDecoderArch;