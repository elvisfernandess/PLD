library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_8x8 is
    generic (
        constant DATA_WIDTH : integer := 8  -- Largura padrão para os vetores UNSIGNED
    );
    port (
        clk             : in  std_logic;
        reset           : in  std_logic;
        dataa           : in  unsigned(DATA_WIDTH - 1 downto 0);
        datab           : in  unsigned(DATA_WIDTH - 1 downto 0);
        product8x8_out  : out unsigned((2 * DATA_WIDTH) - 1 downto 0);
        done_flag       : out std_logic;
        seg_display     : out std_logic_vector(6 downto 0)
    );
end entity multiplier_8x8;

architecture RTL of multiplier_8x8 is
    constant RESULT_WIDTH : integer := (2 * DATA_WIDTH) - 1;
    type state_type is (IDLE, MULTIPLY_1, MULTIPLY_2, MULTIPLY_3, MULTIPLY_4, ADD_RESULT);
    signal state : state_type := IDLE;
    signal result_temp : unsigned(RESULT_WIDTH downto 0) := (others => '0');
    signal accumulator : unsigned(RESULT_WIDTH downto 0) := (others => '0');
    signal counter : integer range 0 to 4 := 0; -- Alterado para 4 para incluir todos os ciclos
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
            result_temp <= (others => '0');
            accumulator <= (others => '0');
            counter <= 0;
            done_flag <= '0';  -- Reiniciado para '0' durante o reset
            seg_display <= (others => '0');
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if counter = 0 then
                        result_temp <= (others => '0');
                        accumulator <= (others => '0');
                    end if;
                    if counter < 4 then
                        state <= MULTIPLY_1;
                    else
                        state <= ADD_RESULT;
                    end if;
                    
                when MULTIPLY_1 =>
                    result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) <= (others => '0');
                    result_temp(DATA_WIDTH - 1 downto 0) <= dataa(7 downto 4) * datab(7 downto 4);
                    state <= MULTIPLY_2;
                    
                when MULTIPLY_2 =>
                    result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) <= result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) + dataa(7 downto 4) * datab(3 downto 0);
                    state <= MULTIPLY_3;
                    
                when MULTIPLY_3 =>
                    result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) <= result_temp((2 * DATA_WIDTH) - 1 downto DATA_WIDTH) + dataa(3 downto 0) * datab(7 downto 4);
                    state <= MULTIPLY_4;
                    
                when MULTIPLY_4 =>
                    result_temp(DATA_WIDTH - 1 downto 0) <= dataa(3 downto 0) * datab(3 downto 0);
                    counter <= counter + 1;
                    if counter < 4 then  -- Alterado para 4 para incluir todos os ciclos
                        state <= MULTIPLY_1;
                    else
                        state <= ADD_RESULT;
                    end if;
                    
                when ADD_RESULT =>
                    accumulator <= accumulator + result_temp;
                    product8x8_out <= accumulator;
                    done_flag <= '1';  -- Definido como '1' ao final da multiplicação
                    seg_display <= "0000000"; -- Ajuste os sinais para ligar o display de 7 segmentos conforme necessário
                    state <= IDLE;
            end case;
        end if;
    end process;
end architecture RTL;
