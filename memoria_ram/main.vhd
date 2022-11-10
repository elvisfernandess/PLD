library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is
    generic(
        BITS : integer := 15
    );
    port(
        clk   : in std_logic;
        reset : in std_logic
    );
end entity main;

architecture RTL of main is
    signal data_in : unsigned(BITS downto 0);
    signal data    : unsigned(BITS downto 0);

begin

    rom_ram : entity work.memoria
        port map(
            clk     => clk,
            addr    => addr,
            reset   => reset,
            data_in => data_in,
            data    => data
        );

    pc : entity work.pc

        port map(
            clk     => clk,
            load    => load,
            reset   => reset,
            up      => up,
            data_in => data_in,
            data    => data
        );

end architecture RTL;
