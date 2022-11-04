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
    signal clk        : std_logic;
    signal reset      : std_logic;
    signal stby       : std_logic;
    signal test       : std_logic;
    signal vermelho_1 : std_logic;
    signal amarelo_1  : std_logic;
    signal verde_1    : std_logic;
    signal vermelho_2 : std_logic;
    signal amarelo_2  : std_logic;
    signal verde_2    : std_logic;
    

begin

    dut : entity work.controlador_semaforos

	generic map(
            MAX => 60
        )
        port map(
            clk        => clk,
            reset      => reset,
            stby       => stby,
            test       => test,
            vermelho_1 => vermelho_1,
            amarelo_1  => amarelo_1,
            verde_1    => verde_1,
            vermelho_2 => vermelho_2,
            amarelo_2  => amarelo_2,
            verde_2    => verde_2
        );


    -- gera uma forma de onda repetitiva e regular: clocks
    process
constant period : time := 20 ns;
    begin

        clk <= '0';
        wait for period / 2;
        clk <= '1';
        wait for period / 2;
    end process;

    --gera uma forma de onda de um só pulso
    process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait;
    end process;
    
    --gera uma forma de onda de um só pulso
    process
    begin
        stby <= '1';
        wait for 100 ns;
        stby <= '0';
        wait for 100 ns;
        wait;
    end process;
end architecture stimulus;
