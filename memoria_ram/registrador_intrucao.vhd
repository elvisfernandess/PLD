-------------------------------------------------------
--! Tarefa 5 - Registrador de Instrução
--! Aluno: Elvis Fernandes
--! Data: 11/11/2022
--! Arquivo: registrador_instrucao.vhd
-------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registrador_instrucao is
    generic(
        BITS : integer := 15
    );
    port(
        clk   : in std_logic;
        reset : in std_logic;
        data_in : in  unsigned(BITS downto 0)
    );
end entity registrador_instrucao;