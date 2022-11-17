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
    signal load         : std_logic;
    signal up           : std_logic;
    signal data_in_pc   : unsigned(BITS downto 0);
    signal data_pc      : unsigned(BITS downto 0);
    signal data_rom     : unsigned(BITS downto 0);
    signal en           : std_logic;
    signal datain       : unsigned(15 downto 0);
    signal opcode       : unsigned(3 downto 0);
    signal cond         : unsigned(3 downto 0);
    signal deslocamento : unsigned(7 downto 0);
    signal mode         : unsigned(2 downto 0);
    signal reg          : unsigned(2 downto 0);
    signal reg2         : unsigned(2 downto 0);
    signal src          : unsigned(5 downto 0);
    signal dst          : unsigned(5 downto 0);

    signal saida : std_logic_vector(15 downto 0);

begin

    pc : entity work.pc
        port map(
            clk     => clk,
            load    => load,
            reset   => reset,
            up      => up,
            data_in => data_in_pc,
            data    => data_rom
        );

    addr <= data_rom(4 downto 0);

    rom_ram : entity work.memoria
        port map(
            clk     => clk,
            addr    => addr,
            reset   => reset,
            data_in => open,
            data    => saida
        );

end architecture RTL;
