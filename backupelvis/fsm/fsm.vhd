library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port(
        clk : in  std_logic;
        rst : in  std_logic;
        d   : in  std_logic;
        q   : out std_logic
    );
end entity fsm;

architecture RTL of fsm is
    type state_type is (zero, um, dois, tres);

    signal state : state_type;
begin

    -- Processo repsonsável apenas pela
    -- transição de estados
    state_transation : process(clk, rst, d) is
    begin
        if rst = '1' or d = '0' then
            state <= zero;
            q     <= '0';

        elsif rising_edge(clk) then
            case state is
                when zero =>
                    if d = '1' then
                        state <= um;
                        q     <= '0';
                    end if;
                when um =>
                    if (d = '1') then
                        state <= dois;
                        q     <= '0';
                    end if;
                when dois =>
                    if (d = '1') then
                        state <= tres;
                        q     <= '0';
                    end if;
                when tres =>

                    if (d = '0') then
                        state <= zero;
                        q     <= '0';

                    elsif (d = '1') then
                        --state <= tres;
                        q     <= '1';
                    end if;

            end case;
        end if;
    end process;

end architecture RTL;
