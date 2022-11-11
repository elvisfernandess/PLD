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
    signal addr         : unsigned(4 downto 0);
    signal data_in_rom  : std_logic_vector(BITS downto 0);
    signal data_rom     : std_logic_vector(BITS downto 0);
    signal load         : std_logic;
    signal up           : std_logic;
    signal data_in_pc   : unsigned(BITS downto 0);
    signal data_pc      : unsigned(BITS downto 0);
    signal data_rom_out : std_logic_vector(15 downto 0);
    

begin

    rom_ram : entity work.memoria
        port map(
            clk     => clk,
            addr    => addr,
            reset   => reset,
            data_in => data_rom,
            data    => data_rom_out
        );

    pc : entity work.pc
        port map(
            clk     => clk,
            load    => load,
            reset   => reset,
            up      => up,
            data_in => data_in_pc,
            data    => data_rom
        );

end architecture RTL;
