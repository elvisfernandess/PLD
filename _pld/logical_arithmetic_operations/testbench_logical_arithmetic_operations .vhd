library ieee;
use ieee.std_logic_1164.all;

entity testbench_logical_arithmetic_operations is
end entity testbench_logical_arithmetic_operations;

architecture tb_arch of testbench_logical_arithmetic_operations is
    -- Sinais de entrada
    signal a_tb, b_tb : std_logic_vector(3 downto 0);

    -- Sinais de saída das operações lógicas
    signal result_and_tb, result_or_tb, result_xor_tb, result_not_a_tb, result_not_b_tb : std_logic_vector(3 downto 0);

    -- Sinais de saída das operações aritméticas
    signal result_add_tb, result_sub_tb, result_mul_tb, result_div_tb : std_logic_vector(4 downto 0);
    signal result_mod_tb : std_logic_vector(3 downto 0);
begin
    -- Instanciação da unidade sob teste (UUT)
    uut : entity work.logical_arithmetic_operations
        port map (
            a => a_tb,
            b => b_tb,
            result_and => result_and_tb,
            result_or => result_or_tb,
            result_xor => result_xor_tb,
            result_not_a => result_not_a_tb,
            result_not_b => result_not_b_tb,
            result_add => result_add_tb,
            result_sub => result_sub_tb,
            result_mul => result_mul_tb,
            result_div => result_div_tb,
            result_mod => result_mod_tb
        );

    -- Processo de estimulação
    stimulus : process
    begin
        -- Teste das operações lógicas
        a_tb <= "0010";
        b_tb <= "0000";
        wait for 10 ns;

        -- Teste das operações aritméticas
        a_tb <= "0011";
        b_tb <= "0001";
        wait for 10 ns;

        -- Adicione mais estímulos de teste conforme necessário

        wait;
    end process;
end architecture tb_arch;
