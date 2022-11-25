-------------------------------------------------------------------
-- Name        : testbench.vhd
-- Author      : Renan Augusto Starke
-- Version     : 0.1
-- Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
-- Description : Exemplo de estimulus para testbenchs
-------------------------------------------------------------------

-- Bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------
entity testbench is
end entity testbench;
------------------------------

architecture stimulus of testbench is
    -- declaração de sinais
    signal clk   : std_logic := '0';
    -- signal addr  : unsigned(4 downto 0);
    --signal data  : std_logic_vector(6 downto 0);
    signal reset : std_logic;

begin                                   -- inicio do corpo da arquitetura

    -- instância de divisor_clock com nome dut, pode haver 
    -- quantas mais do que uma
    dut : entity work.main

        port map(
            clk   => clk,
            reset => reset
        );

    --gera um clock
    process
    begin
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
    end process;

    --gera um reset
    process
    begin
        wait for 60 ns;
        reset <= '0';
        wait;
    end process;

end architecture stimulus;
