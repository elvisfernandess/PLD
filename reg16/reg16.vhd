-------------------------------------------------------
--! Tarefa 02: R    egistrador de 16 bits
--! Aluno: Elvis Fernandes
--! Data: 23/09/2022
--! Arquivo: reg16.vhd
-------------------------------------------------------

-- bibliotecas e cl�sulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg16 is
    port(
        clk       : in  std_logic;      --! clock
        rst_clear : in  std_logic;      --! reset ass�ncrono (clear)
        w_flag    : out std_logic;      --! bit de controle de escrita
        datain    : in  std_logic_vector(15 downto 0); --! entrada de dados
        reg_out   : out std_logic_vector(15 downto 0)
    );
end entity reg16;
