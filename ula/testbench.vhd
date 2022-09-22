-------------------------------------------------------
--! Tarefa 1 - ULA - Unidade Logica Aritmetica
--! Aluno: Elvis Fernandes
--! Data: 22/09/2022
--! Arquivo: testbench.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------
entity testbench is
end entity testbench;
------------------------------
architecture stimulus of testbench is

    --CRIAÇÃO DE SINAIS QUE SERÃO ATRBUÍDOS NO DUT 
    signal a         : signed(15 downto 0); --(A)-->(a) SINAL DE ENTRADA
    signal b         : signed(15 downto 0); --(A)-->(b) SINAL DE ENTRADA
    signal output    : signed(15 downto 0); --(result)-->(output) SINAL DE RESULTADO
    signal op_select : std_logic_vector(4 downto 0); --SINAL DE SELETOR DE OPERAÇÃO
    signal carry     : std_logic;       --SINAL DE BIT FLAG CARRY

begin

    dut : entity work.ula
        port map(
            A         => a,
            B         => b,
            result    => output,
            op_select => op_select,
            C         => carry);

    -- gera sinal de a
    process
    begin
        a <= x"01A3";
        b <= x"000C";
        for i in 0 to 2 ** (op_select'length) - 1 loop
            op_select <= std_logic_vector(to_unsigned(i, op_select'length));
            wait for 10 ns;
        end loop;

        a         <= x"0503";
        b         <= x"001B";
        op_select <= "00011";
        wait for 50 ns;

    end process;

end architecture stimulus;
