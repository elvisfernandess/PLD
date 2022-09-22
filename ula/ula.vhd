-------------------------------------------------------
--! Tarefa 1 - ULA - Unidade Logica Aritmetica
--! Aluno: Elvis Fernandes
--! Data: 22/09/2022
--! Arquivo: ula.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
    port(
        A         : in  signed(15 downto 0); --PORTA DE ENTRADA
        B         : in  signed(15 downto 0); --PORTA DE ENTRADA
        result    : out signed(15 downto 0); --RESULTADO
        op_select : in  std_logic_vector(4 downto 0); --SELETOR DE OPERAÇÃO
        C         : out std_logic       -- BIT FLAG CARRY

    );
end entity ula;

architecture rtl of ula is
    signal carry_signal : signed(16 downto 0); -- SINAL QUE CARREGA O BIT DE CARRY

begin
    --PRCOCESSOS IMPLÍCITOS
    with op_select select carry_signal <=
        resize(A + B, carry_signal'length) when "00000", --ADIÇÃO
        resize(A - B, carry_signal'length) when "00001", --SUBTRAÇÃO
        resize(B - A, carry_signal'length) when "00010", --SUBTRAI DEPOIS COMPARA
        resize(A and B, carry_signal'length) when "00011", --AND
        resize(A or B, carry_signal'length) when "00100", --OR
        (others => '0') when "00101",   --CLEAR
        resize(NOT (A), carry_signal'length) when "00110", --INVERSÃO DE BITS
        (others => '0') when others;

    result <= carry_signal(15 downto 0);
    C      <= carry_signal(16);

end architecture rtl;
