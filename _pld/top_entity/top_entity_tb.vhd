library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_entity_tb is
end entity top_entity_tb;

architecture tb_arch of top_entity_tb is
    -- Constantes para definição do clock
    constant CLOCK_PERIOD : time := 10 ns;  -- Período do clock

    -- Sinais de entrada
    signal a_tb, b_tb : std_logic_vector(15 downto 0);
    signal clk_tb, enable_tb : std_logic := '0';

    -- Sinais de saída
    signal result_and_tb, result_or_tb, result_xor_tb, result_not_a_tb, result_not_b_tb : std_logic_vector(15 downto 0);
    signal result_add_tb, result_sub_tb, result_mul_tb, result_div_tb : std_logic_vector(16 downto 0);
    signal result_mod_tb : std_logic_vector(15 downto 0);

begin
    -- Instanciando a unidade sob teste (DUT)
    dut : entity work.top_entity
        port map (
            a => a_tb,
            b => b_tb,
            clk => clk_tb,
            enable => enable_tb,
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

    -- Processo para gerar o clock
    clk_process : process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for CLOCK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Processo para aplicar estímulos aos sinais de entrada
    stimulus : process
    begin
        -- Inicializando os sinais de entrada
        a_tb <= (others => '0');
        b_tb <= (others => '0');
        enable_tb <= '0';

        -- Aplicando estímulos aos sinais de entrada
        for i in 0 to 65535 loop
            -- Aplicando estímulos aos sinais de entrada
			a_tb <= x"A5A5"; -- Exemplo de constante para a_tb
			b_tb <= x"5A5A"; -- Exemplo de constante para b_tb
			enable_tb <= '1'; -- Habilita as operações

            -- Aguarda um ciclo de clock
            wait for CLOCK_PERIOD;
        end loop;

        wait;
    end process;

end architecture tb_arch;
