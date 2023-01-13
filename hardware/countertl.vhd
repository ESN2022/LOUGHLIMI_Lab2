library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity countertl is

    port (
        clk_clk : in std_logic;
        reset_reset_n : in std_logic;
        pio_1_external_connection_export : in  std_logic_vector(7 downto 0);
        unit7seg : out std_logic_vector(6 downto 0);
        dix7seg : out std_logic_vector(6 downto 0);
        cent7seg : out std_logic_vector(6 downto 0)
    );

       
end countertl;


architecture ARCH of countertl is
       
    component counter is
        port (
            clk_clk                          : in  std_logic                     := 'X';             -- clk
            pio_0_external_connection_export : out std_logic_vector(11 downto 0);                    -- export
            pio_1_external_connection_export : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
            reset_reset_n                    : in  std_logic                     := 'X'              -- reset_n
        );
    end component counter;
    
    
    
    
    
    component septseg is
    
        port (
            number : in std_logic_vector(3 downto 0);
            display : out std_logic_vector(6 downto 0)
        );
       
    end component septseg;
    
    
    
    
    
    component DD is

    port (
        clk: IN std_logic;
        rst: IN std_logic;
        nb : IN std_logic_vector(11 downto 0);
        unit, diz, cent: OUT std_logic_vector(3 downto 0)
    );
    
    end component DD;



    signal UB, DB, CB : std_logic_vector(3 downto 0);
    signal contat : std_logic_vector(11 downto 0);

    begin
       
		U : counter port map(clk_clk, contat, pio_1_external_connection_export, reset_reset_n);
		U0 : DD port map(clk_clk, reset_reset_n, contat, UB, DB, CB);
		U1 : septseg port map(UB, unit7seg);
		U2 : septseg port map(DB, dix7seg);
		U3 : septseg port map(CB, cent7seg);
    
end ;