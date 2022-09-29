-------------------------------------------------------
--! Tarefa 2 - ULA - Registradorde 16 bits
--! Aluno: Elvis Fernandes
--! Data: 28/09/2022
--! Arquivo: testbench.vhd
-------------------------------------------------------

-- bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------
entity testbench is
end entity testbench;
------------------------------
architecture stimulus of testbench is

    -- declaração de sinais
    signal clk : std_logic := '0';
    signal rst_clear : std_logic := '1';
    signal w_flag : std_logic := '1';	
    signal datain : std_logic_vector(15 downto 0) := x"045a";
    signal reg_out   : std_logic_vector(15 downto 0);	
    			
	

begin -- inicio do corpo da arquitetura

 dut : entity work.reg16
        port map(
            clk         => clk,
            rst_clear   => rst_clear,
            w_flag    	=> w_flag,
            datain    	=> datain,
            reg_out     => reg_out);

 -- gera um clok
    process
    begin
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        clk <= '1';    
    end process;
    
    --gera enable
    process
    begin
        wait for 60 ns;
        w_flag <= '1';           
        wait;
    end process; 

end architecture stimulus;