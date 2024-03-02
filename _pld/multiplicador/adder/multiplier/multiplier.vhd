library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    generic (
        constant DATA_WIDTH : integer := 16  -- Largura padrão para os vetores UNSIGNED
    );
    port (
        clk       : in  std_logic;
        dataa     : in  unsigned(DATA_WIDTH - 1 downto 0);
        datab     : in  unsigned(DATA_WIDTH - 1 downto 0);
		result    : out unsigned((2 * DATA_WIDTH) - 1 downto 0)    );
end entity multiplier;

architecture RTL of multiplier is
    constant RESULT_WIDTH : integer := (2 * DATA_WIDTH) - 1;
    signal result_temp : unsigned(RESULT_WIDTH downto 0) := (others => '0');  -- Inicializa result_temp com zeros
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rising_edge(clk) then
                result_temp <= dataa * datab; -- Realiza a multiplicação na borda de subida do clock
            end if;
        end if;
    end process;

    result <= result_temp;  -- Atribui o valor de result_temp a result

end architecture RTL;
