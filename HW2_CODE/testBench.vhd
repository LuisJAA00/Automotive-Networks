LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS

    -- TESTING THE COMPONENT
    COMPONENT CRC
    port( Clk: in std_logic;
        reset : in std_logic;
        Data_in : in std_logic;
        residue_out : out unsigned(14 downto 0);
        Pol : in unsigned(15 downto 0);
        ready : out std_logic
        );
    END COMPONENT;

   --Inputs
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Data_in : std_logic := '0';
    signal Pol : unsigned(15 downto 0):=(others => '0');
    --
    --Outputs
   signal residue_out : unsigned(14 downto 0);
   signal ready : std_logic;
   -- Clock period definitions
   constant Clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: CRC PORT MAP (
          Clk => Clk,
          reset => reset,
          Data_in => Data_in,
          residue_out => residue_out,
          Pol => Pol,
          ready => ready
        );

   -- Clock process definitions
process
   begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;

   end process;

   -- Stimulus process
process
   begin
      reset <= '1';
      -- POLINOMIO
      Pol(0) <= '1';
      Pol(1) <= '0';
      Pol(2) <= '0';
      Pol(3) <= '1';
      Pol(4) <= '1';
      Pol(5) <= '0';
      Pol(6) <= '0';
      Pol(7) <= '1';
      Pol(8) <= '1';
      Pol(9) <= '0';
      Pol(10) <= '1';
      Pol(11) <= '0';
      Pol(12) <= '0';
      Pol(13) <= '0';
      Pol(14) <= '1';
      Pol(15) <= '1';

        wait for 100 ns;


        wait until falling_edge(Clk);


        --DATA IN
        reset <= '0';
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;
        Data_in <= '1'; wait for Clk_period;
        Data_in <= '0'; wait for Clk_period;

        wait until ready = '1'; wait for Clk_period;
        reset <= '1';


      wait;
   end process;

END;
