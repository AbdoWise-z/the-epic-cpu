
Library ieee;
use ieee.std_logic_1164.all;

entity mem_tb is
end entity mem_tb;

architecture mem_tbarch of mem_tb is
Component Memory is
port( 
	WriteEnable,MemEnable,Protect,Free,Reset: in std_logic;
	datain,Address:  in std_logic_vector(31 downto 0);
	OutValue:	out std_logic_vector(31 downto 0);
	error	:       out std_logic
	
);
end component;
Signal WE,Me,P,F,R,err: std_logic := '0';
Signal data,Addr,Outv: std_logic_vector(31 downto 0) := (others => ('0'));

begin
	u: Memory port map(We,Me,P,F,R,data,addr,Outv,err);
process
begin
	data <= (others =>('1'));
	wait for 1 ns;
	R <= '1';
	wait for 5 ns;
	R <='0';
	We <='1';
	wait for 2 ns;
	Me <='1';
	wait for 5 ns;	
	Me <='0';
	data <= ("10101010101010101010101010101010");
	Addr(0) <= '1';
	wait for 1 ns;
	Me <= '1';
	wait for 2 ns;
	Me <= '0';
	Addr(0) <= '0';
	Addr(1) <= '1';
	wait for 2 ns;
	Me <='1';
	wait for 1 ns;
	Me <= '0';
	Addr(1 downto 0) <="00";
	wait for 1 ns;
	R <= '1';

	
	
wait;
end process;
end architecture mem_tbarch;
