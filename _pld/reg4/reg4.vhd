library ieee;
use ieee.std_logic_1164.all;

entity reg4 is
    port (
        clk    : in  std_logic;           -- Sinal de clock de entrada
        reset  : in  std_logic;           -- Sinal de reset assíncrono de entrada
        enable : in  std_logic;           -- Sinal de habilitação de entrada
        data_in: in  std_logic_vector(3 downto 0);  -- Dados de entrada de 4 bits
        q      : out std_logic_vector(3 downto 0)   -- Saída do registrador de 4 bits
    );
end entity reg4;

architecture Behavioral of reg4 is
    signal reg: std_logic_vector(3 downto 0);  -- Registrador de 4 bits interno
begin
    process (clk, reset)
    begin
        if reset = '1' then                -- Se o sinal de reset estiver ativo
            reg <= (others => '0');        -- Reiniciar o registrador
        elsif rising_edge(clk) then        -- Em borda de subida do clock
            if enable = '1' then           -- Se a habilitação estiver ativada
                reg <= data_in;            -- Armazenar dados de entrada no registrador
            end if;
        end if;
    end process;

    q <= reg;  -- A saída do registrador é a própria saída q
end architecture Behavioral;
