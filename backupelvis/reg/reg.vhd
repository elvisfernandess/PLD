-------------------------------------------------------
--! Tarefa 04: Banco de Registradores
--! Aluno: Elvis Fernandes
--! Data: 30/09/2022
--! Arquivo: reg.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
    generic(
        BITS : integer := 15
        --BITSS : integer := 3
    );

    port(
        clk     : in  std_logic;        --! porta de entrada de clock
        reset   : in  std_logic;        --! reset assíncrono (clear)
        w_wr    : in  std_logic;        --! bit de controle de escrita
        w_addr  : in  unsigned(3 downto 0); --! pporta com os dados a serem gravados
        w_data  : in  unsigned(BITS downto 0); --! pporta com os dados a serem gravados
        ra_addr : in  unsigned(3 downto 0); --! pporta com os dados a serem gravados
        rb_addr : in  unsigned(3 downto 0); --! pporta com os dados a serem gravados
        ra_data : out unsigned(BITS downto 0); --! porta de saída da leitura (a)
        rb_data : out unsigned(BITS downto 0) --! porta de saída da leitura (b)
    );
end entity reg;

architecture rtl of reg is
    signal value_w_addr : unsigned(3 downto 0);
    signal reg_out_0    : std_logic_vector(15 downto 0);
    signal reg_out_1    : std_logic_vector(15 downto 0);
    signal reg_out_2    : std_logic_vector(15 downto 0);
    signal reg_out_3    : std_logic_vector(15 downto 0);
    signal reg_out_4    : std_logic_vector(15 downto 0);
    signal reg_out_5    : std_logic_vector(15 downto 0);
    signal reg_out_6    : std_logic_vector(15 downto 0);
    signal reg_out_7    : std_logic_vector(15 downto 0);
    signal w_flag       : std_logic;
    signal w_data_0     : std_logic_vector(15 downto 0);
    signal w_data_1     : std_logic_vector(15 downto 0);
    signal w_data_2     : std_logic_vector(15 downto 0);
    signal w_data_3     : std_logic_vector(15 downto 0);
    signal w_data_4     : std_logic_vector(15 downto 0);
    signal w_data_5     : std_logic_vector(15 downto 0);
    signal w_data_6     : std_logic_vector(15 downto 0);
    signal w_data_7     : std_logic_vector(15 downto 0);

begin

    reg_0 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_0,
            reg_out   => reg_out_0
        );

    reg_1 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_1,
            reg_out   => reg_out_1
        );

    reg_2 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_2,
            reg_out   => reg_out_2
        );

    reg_3 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_3,
            reg_out   => reg_out_3
        );

    reg_4 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_4,
            reg_out   => reg_out_4
        );
    reg_5 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_5,
            reg_out   => reg_out_5
        );

    reg_6 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_6,
            reg_out   => reg_out_6
        );

    reg_7 : entity work.reg16
        port map(
            clk       => clk,
            rst_clear => reset,
            w_flag    => w_flag,
            datain    => w_data_7,
            reg_out   => reg_out_7
        );

    with ra_addr select ra_data <=
        unsigned(reg_out_0) when "000",
        unsigned(reg_out_1) when "001",
        unsigned(reg_out_2) when "010",
        unsigned(reg_out_3) when "011",
        unsigned(reg_out_4) when "100",
        unsigned(reg_out_5) when "101",
        unsigned(reg_out_6) when "110",
        unsigned(reg_out_7) when "111";

    with rb_addr select rb_data <=
        unsigned(reg_out_0) when "000",
        unsigned(reg_out_1) when "001",
        unsigned(reg_out_2) when "010",
        unsigned(reg_out_3) when "011",
        unsigned(reg_out_4) when "100",
        unsigned(reg_out_5) when "101",
        unsigned(reg_out_6) when "110",
        unsigned(reg_out_7) when "111";

end architecture rtl;
