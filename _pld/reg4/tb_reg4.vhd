library ieee;
use ieee.std_logic_1164.all;

entity tb_reg4 is
end entity tb_reg4;

architecture tb of tb_reg4 is
    -- Declarações dos sinais
    signal clk_tb    : std_logic := '0';       -- Sinal de clock
    signal reset_tb  : std_logic := '0';       -- Sinal de reset
    signal enable_tb : std_logic := '0';       -- Sinal de habilitação
    signal data_tb   : std_logic_vector(3 downto 0) := "0000";  -- Dados de entrada
    signal q_tb      : std_logic_vector(3 downto 0);            -- Saída do registrador
    
    -- Componente a ser testado
    component reg4
        port (
            clk    : in  std_logic;
            reset  : in  std_logic;
            enable : in  std_logic;
            data_in: in  std_logic_vector(3 downto 0);
            q      : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    -- Instanciando o registrador
    DUT : reg4
        port map (
            clk    => clk_tb,
            reset  => reset_tb,
            enable => enable_tb,
            data_in=> data_tb,
            q      => q_tb
        );

    -- Processo de clock
    process
    begin
        while now < 100 ns loop  -- Executa por 100ns
            clk_tb <= not clk_tb;  -- Inverte o sinal de clock
            wait for 5 ns;          -- Aguarda 5ns antes de inverter novamente
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
        data_tb   <= "1010";  -- Define os dados de entrada
        
        -- Espera um curto período de tempo
        wait for 50 ns;
        
       
        wait;
    end process;
end architecture tb;
