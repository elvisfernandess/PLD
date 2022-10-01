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
	w_addr  : in unsigned(3 downto 0); --! pporta com os dados a serem gravados
        w_data  : in  unsigned(BITS downto 0); --! pporta com os dados a serem gravados
	ra_addr  : in unsigned(3 downto 0); --! pporta com os dados a serem gravados
	rb_addr  : in unsigned(3 downto 0); --! pporta com os dados a serem gravados
        ra_data : out unsigned(BITS downto 0); --! porta de saída da leitura (a)
        rb_data : out unsigned(BITS downto 0) --! porta de saída da leitura (b)
    );
end entity reg;

architecture rtl of reg is
    signal value_ra_data : unsigned(BITS downto 0);
    signal value_rb_data : unsigned(BITS downto 0);
    signal value_w_addr : unsigned(3 downto 0);
    signal value_ra_addr : unsigned(3 downto 0);
    signal value_rb_addr : unsigned(3 downto 0);		

begin
    process(reset, clk)
    begin
        if reset = '1' then
            value_ra_data <= (others => '0');
            value_rb_data <= (others => '0');
	    value_w_addr <= (others => '0');
	    value_ra_addr <= (others => '0');
	    value_rb_addr <= (others => '0');

        elsif rising_edge(clk) then
            if w_wr = '1' then
                value_ra_data <= w_data;
                value_rb_data <= w_data;
		value_w_addr <= w_addr;
		value_ra_addr <= ra_addr;
		value_rb_addr <= rb_addr;
            end if;
        end if;

    end process;

    ra_data <= value_ra_data;
    rb_data <= value_rb_data;
    
end architecture rtl;