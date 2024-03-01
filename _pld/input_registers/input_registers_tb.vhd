library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_registers_tb is
end entity input_registers_tb;

architecture tb of input_registers_tb is
    constant CLOCK_PERIOD : time := 10 ns;  -- Período do sinal de clock
    signal clk_tb    : std_logic := '0';       -- Sinal de clock
    signal reset_tb  : std_logic := '0';       -- Sinal de reset
    signal enable_tb : std_logic := '0';       -- Sinal de habilitação
    signal data1_tb  : std_logic_vector(7 downto 0) := "00000000";  -- Dados de entrada 1
    signal data2_tb  : std_logic_vector(7 downto 0) := "11111111";  -- Dados de entrada 2
    signal q1_tb     : std_logic_vector(7 downto 0);  -- Saída do registrador 1
    signal q2_tb     : std_logic_vector(7 downto 0);  -- Saída do registrador 2
begin
    -- Instância da unidade a ser testada
    DUT : entity work.input_registers
        port map (
            clk      => clk_tb,
            reset    => reset_tb,
            data_in1 => data1_tb,
            data_in2 => data2_tb,
            enable   => enable_tb,
            q1       => q1_tb,
            q2       => q2_tb
        );

    -- Processo para gerar o sinal de clock
    process
    begin
        while now < 1000 ns loop  -- Executa por 1000ns
            clk_tb <= not clk_tb;  -- Inverte o sinal de clock
            wait for CLOCK_PERIOD / 2;  -- Aguarda metade do período do clock
        end loop;
        wait;
    end process;

    -- Processo de simulação
    process
    begin
        -- Aplicando valores de entrada
        reset_tb  <= '1';
        enable_tb <= '0';
        wait for 10 ns;  -- Espera um curto período de tempo
        reset_tb  <= '0';  -- Desativa o sinal de reset
        enable_tb <= '1';  -- Ativa o sinal de habilitação
        data1_tb  <= "00110011";  -- Define os dados de entrada 1
        data2_tb  <= "11001100";  -- Define os dados de entrada 2
        
        -- Espera um curto período de tempo
        wait for 100 ns;
             
        wait;
    end process;
end architecture tb;