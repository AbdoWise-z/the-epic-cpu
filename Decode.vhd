Library ieee;
use ieee.std_logic_1164.all;

Entity Decode is 
port(
	RdstAddr,Rsrc1Addr,Rsrc2Addr: in std_logic_vector (2 downto 0);
	Rsrc1,Rsrc2:		     Out std_logic_vector(31 downto 0)
);
end Entity Decode;


Architecture DecodeArch of Decode is
begin
end Architecture DecodeArch;
