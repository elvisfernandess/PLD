library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_multiplier is
    constant DATA_WIDTH : integer := 16;  -- Largura padrão para os vetores UNSIGNED
end entity testbench_multiplier;

architecture stimulus of testbench_multiplier is
    signal clk : std_logic := '0';  -- Sinal de clock
    signal dataa : unsigned(DATA_WIDTH - 1 downto 0) := (others => '0'); -- Inicializa com zero
    signal datab : unsigned(DATA_WIDTH - 1 downto 0) := (others => '0'); -- Inicializa com zero
    signal result : unsigned((2*DATA_WIDTH) - 1 downto 0) := (others => '0'); 
begin
    -- Processo para gerar o sinal de clock
    clk_process: process
    begin
        while now < 1000 ns loop  -- Defina a duração do ciclo de clock
            clk <= '0';
            wait for 5 ns;  -- Metade do período de clock
            clk <= '1';
            wait for 5 ns;  -- Metade do período de clock
        end loop;
        wait;
    end process;

    multiplier_inst : entity work.multiplier
        generic map(
            DATA_WIDTH => DATA_WIDTH
        )
        port map(
            clk     => clk,
            dataa   => dataa,
            datab   => datab,
            result  => result
        );

    -- Estímulos para dataa e datab (você pode modificar conforme necessário)
    stimulus_process: process
    begin
        wait for 20 ns;  -- Aguarda um ciclo de clock antes de aplicar os estímulos
        dataa <= x"01A3";
        datab <= x"01A3";
        wait for 90 ns;  -- Aguarda um ciclo de clock antes de aplicar os estímulos
        dataa <= x"01B3";
        datab <= x"01B3";
        wait;
    end process;
end architecture stimulus;
