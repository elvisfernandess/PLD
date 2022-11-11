-------------------------------------------------------
--! Tarefa 3 - Contador de Programa
--! Aluno: Elvis Fernandes
--! Data: 29/09/2022
--! Arquivo: pc.vhd
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
    generic(
        BITS : integer := 15
    );

    port(
        clk     : in  std_logic;
        load    : in  std_logic;
        reset   : in  std_logic;
        up      : in  std_logic;
        data_in : in  unsigned(BITS downto 0);
        data    : out unsigned(BITS downto 0)
    );
end entity pc;

architecture rtl of pc is
    signal value : unsigned(BITS downto 0);
begin

    process(clk, reset)
    begin
        if reset = '1' then
            value <= (others => '0');
        elsif rising_edge(clk) then

            if load = '1' then
                value <= data_in;
            end if;

            if up = '1' then
                value <= value + 1;
            end if;
        end if;
    end process;

    data <= value;

end architecture rtl;
