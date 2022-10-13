
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
    signal clk         : std_logic;
    signal rst         : std_logic;
    signal start       : std_logic;
    signal set_point   : unsigned(15 downto 0);
    signal temperature : unsigned(15 downto 0);
    signal light       : std_logic;
    signal motor       : std_logic;

begin

    dut : entity work.fsm

        port map(
            clk         => clk,
            rst         => rst,
            start       => start,
            set_point   => set_point,
            temperature => temperature,
            light       => light,
            motor       => motor
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
        start <= '1';
        wait for 100 ns;
        start <= '0';
        wait for 40 ns;
        start <= '1';
        wait for 120 ns;
        start <= '0';
        wait for 40 ns;
        --wait;
    end process;

    --gera uma forma de onda de um só pulso
    process
    begin
        set_point   <= x"000D";
        temperature <= x"000E";
        wait for 30 ns;
        set_point   <= x"000F";
        temperature <= x"000B";
        wait for 30 ns;
        set_point   <= x"00CC";
        temperature <= x"00BB";
        wait for 30 ns;
        wait;
    end process;

end architecture stimulus;
