library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pll is
    port (
        clk_in  : in  std_logic;             -- Clock de entrada
        rst     : in  std_logic;
        sel_pr  : in  std_logic_vector (2 downto 0);
        counter : out unsigned(7 downto 0);  -- Sinal de contador de 8 bits
        clk_out : out std_logic              -- Clock de saída
    );
end entity pll;

architecture behavioral of pll is
    signal clk4          : std_logic;
    signal counter_sig   : unsigned(7 downto 0) := (others => '0'); -- Contador de 8 bits
begin
    process (clk_in, rst)
        variable cont4    : integer range 0 to 3;    -- Ajustado para 3 para cobrir 4 estados
    begin
        if rst = '1' then
            clk4    <= '0';
            cont4   := 0;
            counter_sig <= (others => '0'); -- Reset do contador
        elsif rising_edge(clk_in) then
            -- Gerar as divisões de frequência /4, /16, /32, /64, /128 e /256
            cont4   := cont4 + 1;
			
            if cont4 = 3 then -- Ajustado para 3 para cobrir 4 estados
                clk4  <= not clk4;
                cont4 := 0;
            end if;
		
            -- Contador de 8 bits
            if counter_sig = 3 then
                counter_sig <= (others => '0');
            else
                counter_sig <= counter_sig + 1;
            end if;
        end if;
    end process;
	
    -- Mux 8:1
    -- Seleciona o clk_in escolhido
    with sel_pr select
        clk_out <= clk_in and (not rst) when "000",
                   clk4     when "001",
                   '0'      when others;
	
    -- Saída do contador
    counter <= counter_sig;
end architecture behavioral;
