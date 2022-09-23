-------------------------------------------------------
--! Multiplexador usando with/select
--! Aluno: André Adami Tanaka
--! Data: 10/11/2021
-------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity mux_sel is
  -- N define o tamanho dos sinais de entrada/saída do multiplexador
  generic(
			N : integer := 4
  );
  --Entradas e saidas do sistema
  port (
		 mux_sel  : in   std_logic;
		 mux_in_a : in   unsigned (N-1 downto 0);
		 mux_in_b : in   unsigned (N-1 downto 0);
		 mux_out  : out  unsigned (N-1 downto 0)
  );
end entity mux_sel;

architecture behave of mux_sel is
  begin
    with mux_sel select
			mux_out <= mux_in_a when '0',
			mux_in_b when others;	--se usa (when others), pois, não temo apenas '0' ou '1' como estados para a variável mux_sel e assim evitar uma indeterminacao.
  end architecture behave;
