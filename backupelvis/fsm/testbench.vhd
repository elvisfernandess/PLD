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
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process;

    --gera uma forma de onda de um só pulso
    process
    begin
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait;
    end process;

    --gera uma forma de onda de um só pulso
    process
    begin
        d <= '0';
        wait for 10 ns;

        d <= '1';
        wait for 40 ns;

        wait;

    end process;

end architecture stimulus;
