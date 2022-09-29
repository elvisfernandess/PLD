library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
    generic(
        BITS : integer := 15
    );

    port(
        clk    : in  std_logic;
        load   : in  std_logic;
        reset  : in  std_logic;
        up     : in  std_logic;
        datain : in  unsigned(BITS downto 0);
        value  : out unsigned(BITS downto 0)
    );
end entity pc;

architecture rtl of pc is
    signal data : unsigned(BITS downto 0);
begin

    process(clk, reset)
    begin
        if reset = '1' then
            data <= (others => '0');
        elsif rising_edge(clk) then

            if load = '1' then
                data <= datain;
            end if;

            if up = '1' then
                data <= data + 1;
            end if;
        end if;
    end process;

    value <= data;

end architecture rtl;
