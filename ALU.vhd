Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity ALU is 
port(
    A,B : in std_logic_vector(31 downto 0);
    FRin : in std_logic_vector(3 downto 0);
    S   : in std_logic_vector(3 downto 0);
    
    F   : out std_logic_vector(31 downto 0);
    FRout : out std_logic_vector(3 downto 0)
);
end ALU;

Architecture ALUarch of ALU is
    function toBit(b: boolean) return std_logic is
        begin
          if b then
            return '1';
          else
            return '0';
          end if;
        end toBit;
        
    signal sNOP : std_logic_vector(31 downto 0);
    signal sNOPf : std_logic_vector(3 downto 0);

    signal sNOT : std_logic_vector(31 downto 0);
    signal sNOTf : std_logic_vector(3 downto 0);

    signal sNEG : std_logic_vector(31 downto 0);
    signal sNEGf : std_logic_vector(3 downto 0);
    
    signal sINC : std_logic_vector(31 downto 0);
    signal sINCf : std_logic_vector(3 downto 0);
    
    signal sDEC : std_logic_vector(31 downto 0);
    signal sDECf : std_logic_vector(3 downto 0);
    
    signal sADD : std_logic_vector(31 downto 0);
    signal sADDf : std_logic_vector(3 downto 0);
    
    signal sSUB : std_logic_vector(31 downto 0);
    signal sSUBf : std_logic_vector(3 downto 0);

    signal sAND : std_logic_vector(31 downto 0);
    signal sANDf : std_logic_vector(3 downto 0);

    signal sOR : std_logic_vector(31 downto 0);
    signal sORf : std_logic_vector(3 downto 0);

    signal sXOR : std_logic_vector(31 downto 0);
    signal sXORf : std_logic_vector(3 downto 0);

    signal sCMP : std_logic_vector(31 downto 0);
    signal sCMPf : std_logic_vector(3 downto 0);

    signal sBITSET : std_logic_vector(31 downto 0);
    signal sBITSETf : std_logic_vector(3 downto 0);

    signal sRCL : std_logic_vector(32 downto 0);
    signal sRCLf : std_logic_vector(3 downto 0);

    signal sRCR : std_logic_vector(32 downto 0);
    signal sRCRf : std_logic_vector(3 downto 0);

    constant ZERO     : std_logic_vector(31 downto 0) := (others => '0');
    constant ONE      : std_logic_vector(31 downto 0) := std_logic_vector(to_signed(1 , 32));
    constant NEG_ONE  : std_logic_vector(31 downto 0) := std_logic_vector(to_signed(-1 , 32));

begin
    -- nop
    sNOP <= (others => '0');
    sNOPf <= FRin;

    -- not
    sNEG <= std_logic_vector(-signed(A));
    sNEGf <= toBit(sNEG = ZERO) & sNOT(sNEG'high) & FRin(1 downto 0);

    -- neg
    sNOT <= not A;
    sNOTf <= toBit(sNOT = ZERO) & sNOT(sNOT'high) & FRin(1 downto 0);

    -- inc
    sINC <= std_logic_vector(signed(A) + signed(ONE));
    sINCf <= toBit(sINC = ZERO) & sINC(sINC'high) & toBit(
        sINC(sINC'high) /= A(A'high) and A(A'high) = ONE(ONE'high)) & FRin(0);

    -- dec
    sDEC <= std_logic_vector(signed(A) + signed(NEG_ONE));
    sDECf <= toBit(sDEC = ZERO) & sDEC(sDEC'high) & toBit(
        sDEC(sDEC'high) /= A(A'high) and A(A'high) = NEG_ONE(NEG_ONE'high)) & FRin(0);

    -- add
    sADD <= std_logic_vector(signed(A) + signed(B));
    sADDf <= toBit(sADD = ZERO) & sADD(sADD'high) & toBit(
        sADD(sADD'high) /= A(A'high) and A(A'high) = B(B'high)) & FRin(0);


    -- sub & CMP
    sSUB <= std_logic_vector(signed(A) - signed(B));
    sCMP <= sSUB;
    sSUBf <= toBit(sSUB = ZERO) & sSUB(sSUB'high) & toBit(
        sSUB(sSUB'high) /= A(A'high) and A(A'high) = B(B'high)) & FRin(0);
    sCMPf <= sSUBf;

    -- and
    sAND <= A and B;
    sANDf <= toBit(sAND = ZERO) & sAND(sAND'high) & FRin(1 downto 0);

    -- or
    sOR  <= A or B;
    sORf <= toBit(sOR = ZERO) & sOR(sOR'high) & FRin(1 downto 0);

    -- xor
    sXOR <= A xor B;
    sXORf <= toBit(sXOR = ZERO) & sXOR(sXOR'high) & FRin(1 downto 0);

    -- RCL / RCR / bitset
    process( A , B , FRin )
        variable rotate_counter : natural := 0;
        variable rotate_count   : natural := 0;
        variable sRCLv          : std_logic_vector(32 downto 0);
        variable sRCRv          : std_logic_vector(32 downto 0);
        variable sBITSETv       : std_logic_vector(31 downto 0);
    begin
        sBITSETv := A;
        sBITSETv(to_integer(unsigned(B(4 downto 0)))) := '1';
    
        sRCLv := FRin(1) & A;
        sRCRv := FRin(1) & A;

        rotate_counter := 0;
        rotate_count   := to_integer(unsigned(B(5 downto 0)));

        while rotate_counter < rotate_count loop
            rotate_counter := rotate_counter + 1;
            sRCLv := sRCLv(31 downto 0) & sRCLv(32);
            sRCRv := sRCRv(0) & sRCRv(32 downto 1);
        end loop;

        sRCL <= sRCLv;
        sRCR <= sRCRv;
        sBITSET <= sBITSETv;
    end process;

    sBITSETf <= toBit(sBITSET = ZERO) & sBITSET(sBITSET'high) & FRin(1 downto 0);
    sRCLf <= toBit(sRCL(31 downto 0) = ZERO) & sRCL(sRCL'high) & FRin(1 downto 0);
    sRCRf <= toBit(sRCR(31 downto 0) = ZERO) & sRCL(sRCR'high) & FRin(1 downto 0);

    F <= sNOT when S = "0001"
    else sNEG when S = "0010"
    else sINC when S = "0011"
    else sDEC when S = "0100"
    else sADD when S = "0101"
    else sSUB when S = "0110"
    else sAND when S = "0111"
    else sOR  when S = "1000"
    else sXOR when S = "1001"
    else sCMP when S = "1010"
    else sBITSET when S = "1011"
    else sRCL(31 downto 0) when S = "1100"
    else sRCR(31 downto 0) when S = "1101"
    else sNOP;

    FRout <= sNOTf when S = "0001"
        else sNEGf when S = "0010"
        else sINCf when S = "0011"
        else sDECf when S = "0100"
        else sADDf when S = "0101"
        else sSUBf when S = "0110"
        else sANDf when S = "0111"
        else sORf  when S = "1000"
        else sXORf when S = "1001"
        else sCMPf when S = "1010"
        else sBITSETf when S = "1011"
        else sRCLf when S = "1100"
        else sRCRf when S = "1101"
        else sNOPf; 
        
end Architecture ALUarch;