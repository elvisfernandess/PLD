library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee. std_logic_unsigned.all ;
use ieee. std_logic_arith.all ;

entity ones_count is
   port (
       invec : in std_logic_vector (31 downto 0);
       outvec : out std_logic_vector (7 downto 0)

);
end entity ones_count;

architecture rtl of ones_count is
    
begin
    
    process(invec)
        variable count : std_logic_vector (7 downto 0);
    begin
        count := (others =>'0');
        for i in invec'range loop
            if (invec(i) /= '0') then
                count := count+1;
            end if;
        end loop;
        
        outvec <= count;
    end process;
            
end architecture rtl;
