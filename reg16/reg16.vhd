-------------------------------------------------------
--! Tarefa 02: Registrador de 16 bits
--! Aluno: Elvis Fernandes
--! Data: 28/09/2022
--! Arquivo: reg16.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg16 is
    port(
        clk       : in  std_logic;      --! clock
        rst_clear : in  std_logic;      --! reset assíncrono (clear)
        w_flag    : in  std_logic;      --! bit de controle de escrita
        datain    : in  std_logic_vector(15 downto 0); --! entrada de dados
        reg_out   : out std_logic_vector(15 downto 0)
    );
end entity reg16;

architecture rtl of reg16 is

begin
    process(rst_clear, clk)
    begin
        if rst_clear = '1' then
            reg_out <= (others => '0');

        elsif rising_edge(clk) then
            if w_flag = '1' then
                reg_out <= datain;

            end if;
        end if;

    end process;

end architecture rtl;
