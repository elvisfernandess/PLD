-------------------------------------------------------
--! Tarefa 08: composição do multiplicador 8x8 e FSM
--! Aluno: Elvis Fernandes
--! Data: 02/04/2024
--! Arquivo: multiplicador8x8.vhd
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplicador8x8 is
    generic(
        constant DATA_WIDTH : integer := 16 -- Largura padrão para os vetores UNSIGNED
    );
    port(
        dataa          : in  unsigned(7 downto 0);
        datab          : in  unsigned(7 downto 0);
        start          : in  std_logic;
        reset_a        : in  std_logic;
        clk            : in  std_logic;
        done_flag      : out std_logic;
        product8x8_out : out unsigned(15 downto 0);
        segs           : out unsigned(7 downto 0)
    );
end entity multiplicador8x8;

architecture RTL of multiplicador8x8 is

    signal shift_out   : unsigned(15 downto 0); -- Sinal de saída do deslocador.
    signal product8x8  : unsigned(15 downto 0); -- Sinal de saída do multiplicador 8x8.
    signal sum         : unsigned(15 downto 0); -- Sinal de saída da soma.
    signal input       : unsigned(7 downto 0);
    signal shift_cntrl : std_logic_vector(1 downto 0);
    signal aclr_n      : std_logic;
    signal count       : unsigned(1 downto 0);
    signal aout        : unsigned(3 downto 0);
    signal bout        : unsigned(3 downto 0);
    signal product     : unsigned(7 downto 0);
    signal sel         : unsigned(1 downto 0);
    signal sclr_n      : std_logic;
    signal clk_ena     : std_logic;

begin

    adder : entity work.adder
            --generic map(
            --    DATA_WIDTH => 16
            --)
        port map(
            dataa => shift_out,
            datab => product8x8,
            sum   => sum
        );

    shifter : entity work.shifter
        port map(
            input       => input,
            shift_cntrl => shift_cntrl,
            shift_out   => shift_out
        );

    counter : entity work.counter
        port map(
            clk       => clk,
            aclr_n    => start,
            count_out => count
        );

    mult4x4 : entity work.mult4x4
            --generic map(
            --    DATA_WIDTH => 4
            --)
        port map(
            dataa   => aout(3 downto 0),
            datab   => bout(3 downto 0),
            product => product(7 downto 0)
        );

    mux4 : entity work.mux4
            --generic map(
            --   DATA_WIDTH => DATA_WIDTH
            --)
        port map(
            mux_in_a => dataa(3 downto 0),
            mux_in_b => dataa(7 downto 4),
            mux_sel  => sel(1),
            mux_out  => aout(3 downto 0)
        );

    mux_when : entity work.mux_when
            --generic map(
            --    DATA_WIDTH => DATA_WIDTH
            --)
        port map(
            mux_in_a => dataa(3 downto 0),
            mux_in_b => dataa(7 downto 4),
            mux_sel  => sel(0),
            mux_out  => bout(3 downto 0)
        );

    reg16 : entity work.reg16
            --generic map(
            --   WIDTH => WIDTH
            --)
        port map(
            clk     => clk,
            sclr_n  => sclr_n,
            clk_ena => clk_ena,
            datain  => sum,
            reg_out => product8x8
        );

    seven_segment_cntrl : entity work.seven_segment_cntrl
        port map(
            input            => state_out,
            segs(1 downto 0) => segs(1 downto 0),
            segs(2 downto 1) => segs(2 downto 1),
            segs(3 downto 2) => segs(3 downto 2),
            segs(4 downto 3) => segs(4 downto 3),
            segs(5 downto 4) => segs(5 downto 4),
            segs(6 downto 5) => segs(6 downto 5),
            segs(7 downto 6) => segs(7 downto 6)
        );

end architecture RTL;
