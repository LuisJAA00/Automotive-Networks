library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL;

entity CRC is 
port( Clk: in std_logic;
        reset : in std_logic; 
        Data_in : in std_logic; --serial input
        residue_out : out unsigned(14 downto 0); 
        Pol : in unsigned(15 downto 0);
        ready : out std_logic --high when the calculation is done.
        ); 
end CRC; 

architecture Behavioral of CRC is 

signal count : unsigned(15 downto 0) := (others => '0');
signal residue_temp : unsigned(14 downto 0) := (others => '0');

begin

process(Clk,reset)
begin
    if(reset = '1') then
        residue_temp <= (others => '0');
        count <= (others => '0');
        ready <= '0';
    elsif(rising_edge(Clk) and ready='0') then
    --crc calculation in the next four lines.
    
        residue_temp(0) <= Data_in xor residue_temp(14);
        residue_temp(1) <= residue_temp(0) xor ((residue_temp(14) xor Data_in) and Pol(1));
        residue_temp(2) <= residue_temp(1) xor ((residue_temp(14) xor Data_in) and Pol(2));
        residue_temp(3) <= residue_temp(2) xor ((residue_temp(14) xor Data_in) and Pol(3));
        residue_temp(4) <= residue_temp(3) xor ((residue_temp(14) xor Data_in) and Pol(4));
        residue_temp(5) <= residue_temp(4) xor ((residue_temp(14) xor Data_in) and Pol(5));
        residue_temp(6) <= residue_temp(5) xor ((residue_temp(14) xor Data_in) and Pol(6));
        residue_temp(7) <= residue_temp(6) xor ((residue_temp(14) xor Data_in) and Pol(7));
        residue_temp(8) <= residue_temp(7) xor ((residue_temp(14) xor Data_in) and Pol(8));
        residue_temp(9) <= residue_temp(8) xor ((residue_temp(14) xor Data_in) and Pol(9));
        residue_temp(10) <= residue_temp(9) xor ((residue_temp(14) xor Data_in) and Pol(10));
        residue_temp(11) <= residue_temp(10) xor ((residue_temp(14) xor Data_in) and Pol(11));
        residue_temp(12) <= residue_temp(11) xor ((residue_temp(14) xor Data_in) and Pol(12));
        residue_temp(13) <= residue_temp(12) xor ((residue_temp(14) xor Data_in) and Pol(13));
        residue_temp(14) <= residue_temp(13) xor ((residue_temp(14) xor Data_in) and Pol(14));

   
        

        count <= count + 1; --keeps track of the number of rounds
        if(count = 20-1) then --check when to finish the calculations
            count <= (others => '0');
            ready <= '1';
        end if; 
    end if; 
end process;    

residue_out <= residue_temp;

end Behavioral;
