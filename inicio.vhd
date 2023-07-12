library ieee;
use ieee.std_logic_1164.all;

-- Definição da entidade
entity BatalhaNaval is
    port (
        -- Entradas do dono do mar
        navio_1 : in std_logic;
        navio_2 : in std_logic;
        navio_3 : in std_logic_vector(1 downto 0);
        disparar : in std_logic;
        
        -- Entradas do adversário
        alvo : in std_logic_vector(3 downto 0);
        
        -- Saídas
        acertou : out std_logic;
        errou : out std_logic;
        display : out std_logic_vector(3 downto 0)
    );
end BatalhaNaval;

-- Arquitetura da entidade
architecture Behavioral of BatalhaNaval is
    -- Sinais internos
    signal navio_1_pos : std_logic;
    signal navio_2_pos : std_logic;
    signal navio_3_pos : std_logic_vector(1 downto 0);
    signal linha_alvo : integer range 0 to 3;
    signal coluna_alvo : integer range 0 to 3;
    signal num_disparos : integer range 0 to 10;
    
begin
    -- Processo para posicionar os navios
    process(navio_1, navio_2, navio_3)
    begin
        if navio_1 = '1' then
            navio_1_pos <= '1';
        else
            navio_1_pos <= '0';
        end if;
        
        if navio_2 = '1' then
            navio_2_pos <= '1';
        else
            navio_2_pos <= '0';
        end if;
        
        navio_3_pos <= navio_3;
    end process;
    
    -- Processo para decodificar a posição do alvo
    process(alvo)
    begin
        case alvo is
            when "0000" =>
                linha_alvo <= 0;
                coluna_alvo <= 0;
            when "0001" =>
                linha_alvo <= 0;
                coluna_alvo <= 1;
            when "0010" =>
                linha_alvo <= 0;
                coluna_alvo <= 2;
            when "0011" =>
                linha_alvo <= 0;
                coluna_alvo <= 3;
            when "0100" =>
                linha_alvo <= 1;
                coluna_alvo <= 0;
            when "0101" =>
                linha_alvo <= 1;
                coluna_alvo <= 1;
            when "0110" =>
                linha_alvo <= 1;
                coluna_alvo <= 2;
            when "0111" =>
                linha_alvo <= 1;
                coluna_alvo <= 3;
            when "1000" =>
                linha_alvo <= 2;
                coluna_alvo <= 0;
            when "1001" =>
                linha_alvo <= 2;
                coluna_alvo <= 1;
            when "1010" =>
                linha_alvo <= 2;
                coluna_alvo <= 2;
            when "1011" =>
                linha_alvo <= 2;
                coluna_alvo <= 3;
            when "1100" =>
                linha_alvo <= 3;
                coluna_alvo <= 0;
            when "1101" =>
                linha_alvo <= 3;
                coluna_alvo <= 1;
            when "1110" =>
                linha_alvo <= 3;
                coluna_alvo <= 2;
            when "1111" =>
                linha_alvo <= 3;
                coluna_alvo <= 3;
            when others =>
                linha_alvo <= 0;
                coluna_alvo <= 0;
        end case;
    end process;
    
    -- Processo para comparar a posição do alvo com as posições dos navios
    process(navio_1_pos, navio_2_pos, navio_3_pos, linha_alvo, coluna_alvo, disparar)
    begin
        acertou <= '0';
        errou <= '0';
        
        if disparar = '1' then
            if (navio_1_pos = '1' and linha_alvo = 0 and coluna_alvo = 0) or
               (navio_2_pos = '1' and linha_alvo = 1 and coluna_alvo = 1) or
               (navio_3_pos = "00" and linha_alvo = 2 and coluna_alvo = 2) or
               (navio_3_pos = "01" and linha_alvo = 2 and coluna_alvo = 3) then
                acertou <= '1';
            else
                errou <= '1';
            end if;
            
            num_disparos <= num_disparos + 1;
        end if;
    end process;
    
    -- Processo para determinar o resultado do jogo e exibir o número de disparos no display
    process(num_disparos)
    begin
        case num_disparos is
            when 0 =>
                display <= "0000";
            when 1 =>
                display <= "0001";
            when 2 =>
                display <= "0010";
            when 3 =>
                display <= "0011";
            when 4 =>
                display <= "0100";
            when 5 =>
                display <= "0101";
            when 6 =>
                display <= "0110";
            when 7 =>
                display <= "0111";
            when 8 =>
                display <= "1000";
            when 9 =>
                display <= "1001";
            when 10 =>
                display <= "1010";
            when others =>
                display <= "1010"; -- Exemplo: manter o último número de disparos exibido
        end case;
    end process;
    
end Behavioral;