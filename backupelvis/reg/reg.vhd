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
    );

    port(
        clk     : in  std_logic;        --! porta de entrada de clock
        reset   : in  std_logic;        --! reset assíncrono (clear)
        w_wr    : in  std_logic;        --! bit de controle de escrita
        w_data  : in  unsigned(BITS downto 0); --! pporta com os dados a serem gravados
        ra_data : out unsigned(BITS downto 0); --! porta de saída da leitura (a)
        rb_data : out unsigned(BITS downto 0) --! porta de saída da leitura (b)
    );
end entity reg;

architecture rtl of reg is
    signal value_ra_data : unsigned(BITS downto 0);
    signal value_rb_data : unsigned(BITS downto 0);

begin
    process(reset, clk)
    begin
        if reset = '1' then
            value_ra_data <= (others => '0');
            value_rb_data <= (others => '0');

        elsif rising_edge(clk) then
            if w_wr = '1' then
                value_ra_data <= w_data;
                value_rb_data <= w_data;

            end if;
        end if;

    end process;

    ra_data <= value_ra_data;
    rb_data <= value_rb_data;

end architecture rtl;
