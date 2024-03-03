library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_8x8 is
    generic (
        constant DATA_WIDTH : integer := 8  -- Largura padrão para os vetores UNSIGNED
    );
    port (
        clk             : in  std_logic;
        dataa           : in  unsigned(DATA_WIDTH - 1 downto 0);
        datab           : in  unsigned(DATA_WIDTH - 1 downto 0);
        result          : out unsigned((2 * DATA_WIDTH) - 1 downto 0)
    );
end entity multiplier_8x8;

architecture RTL of multiplier_8x8 is
    -- Definição dos estados para o controle do FSM
    type state_type is (IDLE, MULTIPLY_1, MULTIPLY_2, MULTIPLY_3, MULTIPLY_4, UPDATE_RESULT);
    
    -- Sinal para o estado atual do FSM
    signal state : state_type := IDLE;
    
    -- Sinal para armazenar o resultado da multiplicação
    signal result_temp : unsigned((2 * DATA_WIDTH) - 1 downto 0) := (others => '0');  -- Inicializa com zeros
    
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when IDLE =>
                    -- Inicia a multiplicação dos operandos
                    result_temp <= (others => '0'); -- Reinicia o resultado temporário
                    state <= MULTIPLY_1;
                    
                when MULTIPLY_1 =>
                    -- Realiza a primeira parte da multiplicação
                    result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) <= (others => '0');
                    result_temp(DATA_WIDTH - 1 downto 0) <= dataa(7 downto 4) * datab(7 downto 4);
                    state <= MULTIPLY_2;
                    
                when MULTIPLY_2 =>
                    -- Realiza a segunda parte da multiplicação
                    result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) <= result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) + dataa(7 downto 4) * datab(3 downto 0);
                    state <= MULTIPLY_3;
                    
                when MULTIPLY_3 =>
                    -- Realiza a terceira parte da multiplicação
                    result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) <= result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) + dataa(3 downto 0) * datab(7 downto 4);
                    state <= MULTIPLY_4;
                    
                when MULTIPLY_4 =>
                    -- Realiza a última parte da multiplicação
                    result_temp(DATA_WIDTH - 1 downto 0) <= dataa(3 downto 0) * datab(3 downto 0);
                    state <= UPDATE_RESULT;
                    
                when UPDATE_RESULT =>
                    -- Atualiza o resultado
                    result <= result_temp;
                    state <= IDLE;
                    
                when others =>
                    -- Estado de erro
                    state <= IDLE;
            end case;
        end if;
    end process;

end architecture RTL;
