library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_multiplier_8x8 is
    constant DATA_WIDTH : integer := 8;  -- Largura padrão para os vetores UNSIGNED
end entity testbench_multiplier_8x8;

architecture stimulus of testbench_multiplier_8x8 is
    signal clk : std_logic := '0';  -- Sinal de clock
    signal reset : std_logic := '1'; -- Sinal de reset inicialmente ativo
    signal dataa : unsigned(DATA_WIDTH - 1 downto 0) := x"05"; -- Inicializa com um valor diferente de zero
    signal datab : unsigned(DATA_WIDTH - 1 downto 0) := x"0A"; -- Inicializa com um valor diferente de zero
    signal product8x8_out : unsigned((2 * DATA_WIDTH) - 1 downto 0) := (others => '0'); -- Inicializa com zero
    signal done_flag : std_logic := '0'; -- Sinal DONE FLAG
    signal seg_display : std_logic_vector(6 downto 0) := (others => '0'); -- Sinal para ligar o display de 7 segmentos
begin
    -- Processo para gerar o sinal de clock
    clk_process: process
    begin
        while now < 1000 ns loop  -- Defina a duração do ciclo de clock
            clk <= not clk;
            wait for 5 ns;  -- Metade do período do clock
        end loop;
        wait;
    end process;

    -- Estímulos para dataa e datab
    stimulus_process: process
    begin
        wait for 10 ns;  -- Aguarda um ciclo de clock antes de aplicar os estímulos

        -- Aplica os valores de entrada
        dataa <= x"11";  -- Exemplo de valor para dataa
        datab <= x"22";  -- Exemplo de valor para datab
        
        -- Ativa o sinal de reset
        reset <= '0';
        wait for 10 ns;
        
        reset <= '1';  -- Desativa o sinal de reset

        -- Aguarda a operação ser concluída (pode ser substituído por uma condição de timeout)
        wait until done_flag = '1';

        -- Encerra a simulação
        wait;
    end process;
end architecture stimulus;
