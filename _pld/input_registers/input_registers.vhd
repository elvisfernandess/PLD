library ieee;
use ieee.std_logic_1164.all;

entity input_registers is
    port (
        clk      : in  std_logic;                -- Sinal de clock
        reset    : in  std_logic;                -- Sinal de reset
        data_in1 : in  std_logic_vector(7 downto 0);  -- Dados de entrada para o registrador 1
        data_in2 : in  std_logic_vector(7 downto 0);  -- Dados de entrada para o registrador 2
        enable   : in  std_logic;                -- Sinal de habilitação
        q1       : out std_logic_vector(7 downto 0); -- Saída do registrador 1
        q2       : out std_logic_vector(7 downto 0)  -- Saída do registrador 2
    );
end entity input_registers;

architecture Behavioral of input_registers is
    signal reg1 : std_logic_vector(7 downto 0);  -- Registrador 1
    signal reg2 : std_logic_vector(7 downto 0);  -- Registrador 2
begin
    process (clk, reset)
    begin
        if reset = '1' then
            reg1 <= (others => '0');  -- Reinicia o registrador 1
            reg2 <= (others => '0');  -- Reinicia o registrador 2
        elsif rising_edge(clk) then
            if enable = '1' then
                reg1 <= data_in1;  -- Armazena os dados de entrada no registrador 1
                reg2 <= data_in2;  -- Armazena os dados de entrada no registrador 2
            end if;
        end if;
    end process;

    q1 <= reg1;  -- A saída do registrador 1 é a própria saída q1
    q2 <= reg2;  -- A saída do registrador 2 é a própria saída q2
end architecture Behavioral;