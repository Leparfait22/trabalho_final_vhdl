library ieee;
use ieee.std_logic_1164.all;

-- Definição da entidade
entity BatalhaNaval is
    port (
        -- Entradas do dono do mar
        navio_1 : in std_logic_vector(3 downto 0);
        navio_2 : in std_logic_vector(3 downto 0);
        navio_3a : in std_logic_vector(3 downto 0);
        navio_3b : in std_logic_vector(3 downto 0);

        --clock : in std_logic;
        disparar : in std_logic;
        alvo : in std_logic_vector(3 downto 0);
        
        -- Saídas
        acertou : out std_logic;
        errou : out std_logic;
        display : out std_logic_vector(3 downto 0);
        vitoria : out std_logic;
        derota  : out std_logic
        --display_seg   : out std_logic_vector(6 downto 0)

    );
end entity BatalhaNaval;

architecture mainBatalhaNaval of BatalhaNaval is
       -- type Navio_Type is (navio_1,navio_2,navio_3);
       -- signal navio_atual: Navio_Type := navio_1;
    
         -- Sinais internos
    signal navio_1_pos :integer range 0 to 16;
    signal navio_2_pos :integer range 0 to 16;
    signal navio_3_pos1 :integer range 0 to 16;
    signal navio_3_pos2 :integer range 0 to 16;
    signal linha_alvo : integer range 0 to 3;
    signal coluna_alvo : integer range 0 to 3;
    signal pos_alvo : integer range 0 to 15;
    signal num_disparos : integer range 0 to 15:=10;
    signal num_vitorias : integer range 0 to 3;
    signal num_derotas : integer range 0 to 10;


    
    begin

        -- Processo para posicionar os navios
        process(navio_1, navio_2, navio_3a,navio_3b,navio_1_pos,navio_2_pos,navio_3_pos1,navio_3_pos2)
        begin
            if navio_1 =  "1011" then
                navio_1_pos <= 0;
            elsif navio_1 =  "1000" then
                navio_1_pos <= 1;
            elsif navio_1 =  "1110" then
                navio_1_pos <= 2;
            elsif navio_1 =  "1100" then
                navio_1_pos <= 3;
            elsif navio_1 =  "0011" then
                navio_1_pos <= 4;
            elsif navio_1 =  "0000" then
                navio_1_pos <= 5;
            elsif navio_1 =  "0010" then
                navio_1_pos <= 6;
            elsif navio_1 =  "1101" then
                navio_1_pos <= 7;
            elsif navio_1 =  "1111" then
                navio_1_pos <= 8;
            elsif navio_1 =  "0110" then
                navio_1_pos <= 9;
            elsif navio_1 =  "0100" then
                navio_1_pos <= 10;
            elsif navio_1 =  "1001" then
                navio_1_pos <= 11;
            elsif navio_1 =  "0111" then
                navio_1_pos <= 12;
            elsif navio_1 =  "0101" then
                navio_1_pos <= 13;
            elsif navio_1 =  "0001" then
                navio_1_pos <= 14;
            elsif navio_1 =  "1010" then
                navio_1_pos <= 15;
            end if;
            if navio_2 = "1011" then
                navio_2_pos <= 0 ;
            elsif navio_2 = "1000" then
                navio_2_pos <= 1;
            elsif navio_2 = "1110" then
                navio_2_pos <= 2;
            elsif navio_2 = "1100" then
                navio_2_pos <= 3;
            elsif navio_2 = "0011" then
                navio_2_pos <= 4;
            elsif navio_2 = "0000" then
                navio_2_pos <= 5;
            elsif navio_2 = "0010" then
                navio_2_pos <= 6;
            elsif navio_2 = "1101" then
                navio_2_pos <= 7;
            elsif navio_2 = "1111" then
                navio_2_pos <= 8;
            elsif navio_2 = "0110" then
                navio_2_pos <= 9;
            elsif navio_2 = "0100" then
                navio_2_pos <= 10;
            elsif navio_2 = "1001" then
                navio_2_pos <= 11;
            elsif navio_2 = "0111" then
                navio_2_pos <= 12;
            elsif navio_2 = "0101" then
                navio_2_pos <= 13;
            elsif navio_2 = "0001" then
                navio_2_pos <= 14;
            elsif navio_2 = "1010" then
                navio_2_pos <= 15;
            end if;
            if navio_3a = "1011" then
                navio_3_pos1 <= 0 ;
            elsif navio_3a = "1000" then
                navio_3_pos1 <= 1;
            elsif navio_3a = "1110" then
                navio_3_pos1 <= 2;
            elsif navio_3a = "1100" then
                navio_3_pos1 <= 3;
            elsif navio_3a = "0011" then
                navio_3_pos1 <= 4;
            elsif navio_3a = "0000" then
                navio_3_pos1 <= 5;
            elsif navio_3a = "0010" then
                navio_3_pos1 <= 6;
            elsif navio_3a = "1101" then
                navio_3_pos1 <= 7;
            elsif navio_3a = "1111" then
                navio_3_pos1 <= 8;
            elsif navio_3a = "0110" then
                navio_3_pos1 <= 9;
            elsif navio_3a = "0100" then
                navio_3_pos1 <= 10;
            elsif navio_3a = "1001" then
                navio_3_pos1 <= 11;
            elsif navio_3a = "0111" then
                navio_3_pos1 <= 12;
            elsif navio_3a = "0101" then
                navio_3_pos1 <= 13;
            elsif navio_3a = "0001" then
                navio_3_pos1 <= 14;
            elsif navio_3a = "1010" then
                navio_3_pos1 <= 15;
            end if;
            if navio_3b = "1011" then
                    navio_3_pos2 <= 0 ;
            elsif navio_3b = "1000" then
                navio_3_pos2 <= 1;
            elsif navio_3b = "1110" then
                navio_3_pos2 <= 2;
            elsif navio_3b = "1100" then
                navio_3_pos2 <= 3;
            elsif navio_3b = "0011" then
                navio_3_pos2 <= 4;
            elsif navio_3b = "0000" then
                navio_3_pos2 <= 5;
            elsif navio_3b = "0010" then
                navio_3_pos2 <= 6;
            elsif navio_3b = "1101" then
                navio_3_pos2 <= 7;
            elsif navio_3b = "1111" then
                navio_3_pos2 <= 8;
            elsif navio_3b = "0110" then
                navio_3_pos2 <= 9;
            elsif navio_3b = "0100" then
                navio_3_pos2 <= 10;
            elsif navio_3b = "1001" then
                navio_3_pos2 <= 11;
            elsif navio_3b = "0111" then
                navio_3_pos2 <= 12;
            elsif navio_3b = "0101" then
                navio_3_pos2 <= 13;
            elsif navio_3b = "0001" then
                navio_3_pos2 <= 14;
            elsif navio_3b = "1010" then
                navio_3_pos2 <= 15;
            end if;
        end process;


        process(alvo,pos_alvo)
            begin
                if alvo =  "1100" then
                    pos_alvo <=0;
                elsif alvo = "1101" then
                    pos_alvo <= 1;
                elsif alvo = "1110" then
                    pos_alvo <= 2;
                elsif alvo = "1111" then
                    pos_alvo <= 3;
                elsif alvo = "1000" then
                    pos_alvo <= 4;
                elsif alvo = "1001" then
                    pos_alvo <= 5;
                elsif alvo = "1010" then
                    pos_alvo <= 6;
                elsif alvo = "1011" then
                    pos_alvo <= 7;
                elsif alvo = "0100" then
                    pos_alvo <= 8;
                elsif alvo = "0101" then
                    pos_alvo <= 9;
                elsif alvo = "0110" then
                    pos_alvo <= 10;
                elsif alvo = "0111" then
                    pos_alvo <= 11;
                elsif alvo = "0000" then
                    pos_alvo <= 12;
                elsif alvo = "0001" then
                    pos_alvo <= 13;
                elsif alvo = "0010" then
                    pos_alvo <= 14;
                elsif alvo = "0011" then
                    pos_alvo <= 15;
                end if;
        end process;

        --para comparar e disparar
        process(navio_1_pos, navio_2_pos, navio_3_pos1, navio_3_pos2, disparar)
            variable contador : integer range 0 to 2 := 0;
            begin
                acertou <= '0';
                errou <= '0';
                if disparar'event and disparar = '1' then
                    if num_disparos = 1 then 
                        if pos_alvo = navio_1_pos  then
                            acertou <= '1';
                            --num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_1_pos <= 16;
                        elsif pos_alvo = navio_2_pos  then
                            acertou <= '1';
                            --num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_2_pos <= 16;
                        elsif pos_alvo = navio_3_pos1 or pos_alvo = navio_3_pos2 then
                            contador := contador + 1;
                            if contador = 2 then
                                acertou <= '1';
                                --num_disparos <= num_disparos - 1;
                                num_vitorias <= num_vitorias + 1;
                            -- navio_3_pos1 <= 16;
                            -- navio_3_pos2 <= 16;
                            end if;
                        else
                            errou <= '1';
                            num_disparos <= num_disparos - 1;
                        end if;
                    else 
                        if pos_alvo = navio_1_pos  then
                            acertou <= '1';
                            num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_1_pos <= 16;
                        elsif pos_alvo = navio_2_pos  then
                            acertou <= '1';
                            num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_2_pos <= 16;
                        elsif pos_alvo = navio_3_pos1 or pos_alvo = navio_3_pos2 then
                            contador := contador + 1;
                            if contador = 2 then
                                acertou <= '1';
                                num_disparos <= num_disparos - 1;
                                num_vitorias <= num_vitorias + 1;
                            -- navio_3_pos1 <= 16;
                            -- navio_3_pos2 <= 16;
                            end if;
                        else
                            errou <= '1';
                            num_disparos <= num_disparos - 1;
                        end if;
                    end if;
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
            --when 11 =>
              --  display <= "1011";
            when others =>
                display <= "1011"; -- Exemplo: manter o último número de disparos exibido
        end case;
    end process;

    process(num_disparos,num_vitorias,num_derotas)
        begin
            if num_vitorias = 3 then 
                vitoria <= '1';
            end if;
            if num_disparos = 0 and num_vitorias < 3 then
                derota <= '1';
            end if;
    end process;

end architecture mainBatalhaNaval;