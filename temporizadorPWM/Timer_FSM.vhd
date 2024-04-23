Claro, aqui está o código identado:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timer_FSM is
    Port (
        CLK                      : in  STD_LOGIC;
        RESET                    : in  STD_LOGIC;
        COMPARE1_OUT             : out STD_LOGIC;
        COMPARE1_COMPLEMENT_OUT : out STD_LOGIC;
        COMPARE2_OUT             : out STD_LOGIC;
        COMPARE2_COMPLEMENT_OUT : out STD_LOGIC;
        PRESCALER_SELECT         : in  STD_LOGIC_VECTOR(2 downto 0);
        COUNT_REACHED            : out STD_LOGIC;
        LED                      : out STD_LOGIC_VECTOR(7 downto 0); -- LEDs físicos do kit
        SW                       : in  STD_LOGIC_VECTOR(7 downto 0); -- Switches físicos do kit
        KEY                      : in  STD_LOGIC_VECTOR(3 downto 0) -- Botões físicos do kit
    );
end Timer_FSM;

architecture Behavioral of Timer_FSM is
    type state_type is (S_IDLE, S_COUNT, S_COMPARE1, S_COMPARE2);
    signal state              : state_type := S_IDLE;
    signal counter            : STD_LOGIC_VECTOR(7 downto 0);
    signal prescaler_counter : STD_LOGIC_VECTOR(2 downto 0);
    signal compare1, compare2 : STD_LOGIC;
begin

    process(CLK, RESET)
    begin
        if RESET = '1' then
            state                    <= S_IDLE;
            counter                  <= (others => '0');
            prescaler_counter <= (others => '0');
            COMPARE1_OUT             <= '0';
            COMPARE1_COMPLEMENT_OUT <= '1';
            COMPARE2_OUT             <= '0';
            COMPARE2_COMPLEMENT_OUT <= '1';
            COUNT_REACHED            <= '0';
        elsif rising_edge(CLK) then
            case state is
                when S_IDLE =>
                    if PRESCALER_SELECT /= "000" then
                        prescaler_counter <= prescaler_counter + 1;
                        if prescaler_counter = PRESCALER_SELECT then
                            state <= S_COUNT;
                        end if;
                    end if;
                when S_COUNT =>
                    if counter = "11111111" then
                        counter <= (others => '0');
                        COUNT_REACHED <= '1';
                        state <= S_IDLE;
                    else
                        counter <= counter + 1;
                    end if;
                when S_COMPARE1 =>
                    if counter = "00000000" then
                        COMPARE1_OUT <= '1';
                        COMPARE1_COMPLEMENT_OUT <= '0';
                    else
                        COMPARE1_OUT <= '0';
                        COMPARE1_COMPLEMENT_OUT <= '1';
                    end if;
                    state <= S_IDLE;
                when S_COMPARE2 =>
                    if counter = "01111111" then
                        COMPARE2_OUT <= '1';
                        COMPARE2_COMPLEMENT_OUT <= '0';
                    else
                        COMPARE2_OUT <= '0';
                        COMPARE2_COMPLEMENT_OUT <= '1';
                    end if;
                    state <= S_IDLE;
            end case;
        end if;
    end process;

    -- Mapeamento dos pinos físicos para as saídas
    LED <= counter when state = S_COUNT else (others => '0'); -- Mostra o contador nos LEDs
    COMPARE1_OUT <= SW(0); -- Mapeia o switch SW(0) para a saída do comparador 1
    COMPARE2_OUT <= SW(1); -- Mapeia o switch SW(1) para a saída do comparador 2
    -- Ações baseadas nos botões físicos
    -- Exemplo: Pressionar KEY(0) redefine o contador e reinicia o temporizador
    process(KEY)
    begin
        if KEY(0) = '0' then
            counter <= (others => '0');
            state <= S_IDLE;
            prescaler_counter <= (others => '0');
            COUNT_REACHED <= '0';
        end if;
    end process;

end Behavioral;
```

Agora o código está melhor identado para facilitar a leitura e manutenção.