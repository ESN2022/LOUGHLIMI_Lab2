Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;


entity DD is

    port (
        clk: IN std_logic;
        rst: IN std_logic;
        nb : IN std_logic_vector(11 downto 0);
        unit, diz, cent: OUT std_logic_vector(3 downto 0)
    );
    
end entity DD;

architecture ARCH of DD is

begin

    DD_process: PROCESS (clk, rst)
    variable cont: integer range 0 to 10;
    variable onb: std_logic_vector(11 downto 0);
    variable sc : std_logic_vector(23 downto 0);
    begin
        IF (rst = '0') THEN
            cont := 0;
            onb := (others => '1');
            sc := (others => '0');
           
           
        ELSIF (rising_edge(clk)) THEN
       
            IF (onb /= nb) THEN
                onb := nb;
                cont := 0;
                sc := "000000000" & nb & "000";
               
            ELSIF (cont < 9) THEN

                IF(sc(23 downto 20) > "0100") THEN
                    sc(23 downto 20) := sc(23 downto 20) + "0011";
                END IF;
                IF(sc(19 downto 16) > "0100") THEN
                    sc(19 downto 16) := sc(19 downto 16) + "0011";
                END IF;
                IF(sc(15 downto 12) > "0100") THEN
                    sc(15 downto 12) := sc(15 downto 12) + "0011";
                END IF;
                sc := sc(22 downto 0) & '0';
					 cont := cont + 1;
					 ELSIF (cont = 9) THEN
                    unit <= sc(15 downto 12);
                    diz <= sc(19 downto 16);
                    cent <= sc(23 downto 20);
            END IF;
        END IF;
    END PROCESS;
end ;