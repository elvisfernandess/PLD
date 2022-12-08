library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.std_logic_arith.all; -- don't use this
use IEEE.numeric_std.all;               -- use that, it's a better coding guideline

-- Also, never ever use IEEE.std_unsigned.all or IEEE.std_signed.all, these
-- are the worst libraries ever. They automatically cast all your vectors
-- to signed or unsigned. Talk about maintainability and strong typed language...

entity uc is
    port(
        rst      : in  std_logic;
        clk      : in  std_logic;
        -- sinais da ROM	 
        data_rom : in  unsigned(7 downto 0);
        -- sinais da ULA	 
        --    ula_reg0 : out   unsigned(7 downto 0);
        --    ula_reg1 : out   unsigned(7 downto 0);
        --    ula_out  : in    unsigned(7 downto 0);
        --    ula_sel  : out   unsigned(2 downto 0);
        --	flag_Z   : in    std_logic;
        --	flag_C   : in    std_logic;

        -- sinais da UR	 
        --    data_reg : inout unsigned(7 downto 0);
        --	 reg_sel  : out   unsigned(1 downto 0);
        --	 reg_we   : out   std_logic;

        -- sinais do PC	 
        ld_pc    : out std_logic;       -- para conexao com o PC  
        en_pc    : out std_logic;       -- para conexao com o PC  
        load_pc  : out unsigned(7 downto 0)
    );
end uc;

architecture Behavior of uc is
    signal estado             : integer range 0 to 3;
    signal estado_new         : integer range 0 to 3;
    signal opcode             : unsigned(7 downto 0);
    signal flagUC_Z, flagUC_C : std_logic;
begin
    Process(CLK, RST)
    begin
        if RST = '1' then
            estado <= 0;
        elsif clk = '1' and clk'event then
            estado <= estado_new;
            --			if estado = 1 then	
            --				opcode <= data_rom;
            --				if data_rom = x"41" then
            --					ula_reg0 <= data_reg;
            --				elsif data_rom = x"11" then
            --					ula_reg0 <= data_reg;
            --				end if;	
            --			elsif estado = 2 then	
            --				if opcode = x"41" then
            --					ula_reg1 <= data_reg;
            --				elsif opcode = x"11" then
            --					ula_reg1 <= data_reg;
            --				end if;	
            --			elsif estado = 3 then	
            --				if opcode = x"41" then    -- ADD R0,R1
            --					data_reg <= ula_out;
            --					flagUC_Z <= flag_Z;
            --					flagUC_C <= flag_C;
            --				elsif opcode = x"11" then  -- CMP R0,R1
            --					--data_reg <= ula_out;
            --					flagUC_Z <= flag_Z;
            --					flagUC_C <= flag_C;
            --				end if;	
            --			end if;	
        end if;
    end process;

    Process(estado, data_rom, opcode)
    begin
    case estado is
        when 0 =>
            estado_new <= 1;
            en_pc      <= '0';
        when 1 =>

            case data_rom is
                when x"00" =>
                    estado_new <= 1;
                    ld_pc      <= '0';
                    en_pc      <= '1';
                    null;
                when x"41" =>           -- ADD  R0, R1
                    estado_new <= 2;
                    ld_pc      <= '0';
                    en_pc      <= '0';
                --			reg_sel    <= "00";   -- REG 0  		
                --			reg_we     <= '0';    -- leitura do REG	
                --			ula_sel    <= "000";   -- operaÃ§Ã£o SOMA na ula
                when x"11" =>           -- CMP  R0, R1
                    estado_new <= 2;
                    ld_pc      <= '0';
                    en_pc      <= '0';
                    --			reg_sel    <= "00";   -- REG 0  		
                    --			reg_we     <= '0';    -- leitura do REG	
                    --			ula_sel    <= "111";  -- operaÃ§Ã£o CMP na ula
                    null;
                when x"A1" =>
                    estado_new <= 2;
                    ld_pc      <= '0';
                    en_pc      <= '0';
                    --			reg_sel    <= "01";  		
                    --			reg_we     <= '0';  		
                    null;
                when x"55" =>           -- B IMM8
                    estado_new <= 2;    -- é necessário buscar mais informações
                    ld_pc      <= '0';  -- ainda não está pronto (falta informação de endereço de salto)
                    en_pc      <= '1';  -- precisa deixar o contador avançar para buscar o endereço
                    null;
                when x"08" =>           -- B 0x04
                    estado_new <= 1;    -- NÃO é necessário buscar mais informações
                    ld_pc      <= '1';  -- ainda não está pronto (falta informação de endereço de salto)
                    en_pc      <= '1';  -- precisa deixar o contador avançar para buscar o endereço
                    load_pc    <= x"0x04"; -- enedereço estipuladp para o salto
                    null;
                when others =>
                    null;
            end case;
        when 2 =>
            case opcode is
                when x"41" =>
                    estado_new <= 3;
                    ld_pc      <= '0';
                    en_pc      <= '0';
                    --			reg_sel    <= "01";   -- REG 1  		
                    --			reg_we     <= '0';    -- leitura do REG  		
                    --			ula_sel    <= "000";   -- operaÃ§Ã£o SOMA na ula
                    null;
                when x"11" =>           -- CMP  R0, R1
                    estado_new <= 2;    -- ????? VERIFICAR
                    ld_pc      <= '0';
                    en_pc      <= '0';
                --			reg_sel    <= "01";   -- REG 1  		
                --			reg_we     <= '0';    -- leitura do REG	
                --			ula_sel    <= "111";  -- operaÃ§Ã£o CMP na ula
                when x"55" =>           -- B IMM8 
                    estado_new <= 1;
                    ld_pc      <= '1';
                    en_pc      <= '1';
                    load_pc    <= data_rom;
                    null;
                when others =>
                    null;
            end case;
        when 3 =>
        case opcode is
        when x"41" => 
        estado_new <= 1;
        ld_pc         <= '0';
        en_pc         <= '1'; 
        --					reg_sel    <= "00";   --  REG 0  		
        --					reg_we     <= '1';     -- escrita no REG
        --					ula_sel    <= "000";   -- operaÃ§Ã£o SOMA na ula
        --					null;
        --				when x"11" =>             -- CMP R0, R1 
        --					estado_new <= 1;
        --					ld_pc      <= '0';
        --					en_pc      <= '1'; 
        --					reg_sel    <= "00";   --  DO NOT CARE REG 0  		
        --					reg_we     <= '0';     -- escrita nÃ£o permitida no REG
        --					ula_sel    <= "000";   -- operaÃ§Ã£o SOMA na ula
        when others =>
            null;
    end case;

    when others => 
				null;

end case;                               -- estado

end process;		




end architecture Behavior;



	-- signal TMP : integer range 0 to 15;
	-- signal VETOR : unsigned(3 downto 0);
	-- begin
			-- else
				-- if(CLK'event and CLK = '1') then -- Borda de subida em clk
				  -- if tmp = 15 then 
  				    -- TMP <= 0;
			    -- else  
					  -- TMP<=TMP+1;
	 			  -- End if;
				-- End if;
			-- End if;
		-- End Process;
	--Q<=std_logic_vector(to_unsigned(TMP,4));	
	-- VETOR<=to_unsigned(TMP,4);	
	-- Q(3) <=VETOR(3);
	-- Q(2) <=VETOR(2);
	-- Q(1) <=VETOR(1);
	-- Q(0) <=VETOR(0);
