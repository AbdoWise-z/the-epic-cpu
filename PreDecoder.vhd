Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PreDecoder is
  port (
    clk    : in std_logic;
    flush  : in std_logic;
    InstIn : in std_logic_vector(15 downto 0);
    InstOut : out std_logic_vector(31 downto 0)
  ) ;
end PreDecoder;

architecture PreDecoderArch of PreDecoder is
    constant nop     : std_logic_vector(31 downto 0) := (others => '0');
    constant filler  : std_logic_vector(15 downto 0) := (others => '0');
    
    signal half : std_logic_vector(15 downto 0);
    signal multi    : std_logic := '0';
    
    signal MULTI_1 : std_logic_vector(4 downto 0) := "01101"; -- ADDI
    signal MULTI_2 : std_logic_vector(4 downto 0) := "10011"; -- LDM
    signal MULTI_3 : std_logic_vector(4 downto 0) := "10100"; -- LDD
    signal MULTI_4 : std_logic_vector(4 downto 0) := "10101"; -- STD

    -- for testing ..
    signal latch : std_logic_vector(31 downto 0);

begin

    latch <= nop when flush = '1' and multi = '1'
    else half & InstIn when multi = '1'
    else nop when InstIn(15 downto 11) = MULTI_1 -- op-code == ADDI/LDM/LDD/STD
    else nop when InstIn(15 downto 11) = MULTI_2
    else nop when InstIn(15 downto 11) = MULTI_3
    else nop when InstIn(15 downto 11) = MULTI_4
    else InstIn & filler;

    process (clk) begin
        if (clk'event and clk = '1') then
            InstOut <= latch;
            half <= InstIn;

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