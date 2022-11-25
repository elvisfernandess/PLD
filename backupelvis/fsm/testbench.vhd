-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------
entity testbench is
end entity testbench;
------------------------------

architecture stimulus of testbench is

    -- declaração de sinais
    signal clk : std_logic;
    signal rst : std_logic;
    signal d   : std_logic;
    signal q   : std_logic;

begin

    dut : entity work.fsm

        port map(
            clk => clk,
            rst => rst,
            d   => d,
            q   => q
        );

    -- gera uma forma de onda repetitiva e regular: clocks
    process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    process
    begin
        rst <= '1';
        d <= '0';
        wait for 15 ns;
        
        rst <= '0';
        d <= '1';
        wait for 80 ns;
        
        d <= '0';
        wait for 20 ns;
        wait;

    end process;

end architecture stimulus;