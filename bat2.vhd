library ieee;
use ieee.std_logic_1164.all;

-- Definição da entidade
entity BatalhaNaval is
    port (
        -- Entradas do dono do mar
        navio : in std_logic_vector(3 downto 0);
        clock : in std_logic;
        navio_prox: in std_logic;
        reset : in std_logic;
        disparar : in std_logic;
        alvo : in std_logic_vector(3 downto 0);

        
        -- Saídas
        acertou : out std_logic;
        errou : out std_logic;
        led_1 : out std_logic;
        led_2 : out std_logic;
        led_3a : out std_logic;
        led_3b : out std_logic;
        display : out std_logic_vector(3 downto 0);
        vitoria : out std_logic;
        derota  : out std_logic
    
        --display_seg   : out std_logic_vector(6 downto 0)

    );
end entity BatalhaNaval;

architecture mainBatalhaNaval of BatalhaNaval is
        type Navio_Type is (navio_1,navio_2,navio_3a,navio_3b);
        signal navio_atual: Navio_Type := navio_1;
    
         -- Sinais internos
    signal navio_pos :integer range 0 to 16;
    signal navio_1_pos :integer range 0 to 16;
    signal navio_2_pos :integer range 0 to 16;
    signal navio_3_pos1 :integer range 0 to 16;
    signal navio_3_pos2 :integer range 0 to 16;
    signal pos_alvo : integer range 0 to 15;
    signal num_disparos : integer range 0 to 15:=10;
    signal num_vitorias : integer range 0 to 3;
    signal num_derotas : integer range 0 to 10;


    
    begin
        --selecao dos navios 
        process(clock,reset)
            variable count: integer := 0;
        begin
            if reset = '1' then
                navio_atual <= navio_1;
            elsif clock'event and clock = '1' then
                count := count + 1;
                if count = 1 then 
                    navio_atual <= navio_1;
                elsif count = 2 then 
                    navio_atual <= navio_2;
                elsif count = 3 then 
                    navio_atual <= navio_3a;
                elsif count = 4 then 
                    navio_atual <= navio_3b;
                end if;
            end if;
        end process;
        
        --codifficacao das posicoes  dos navios 
        process(navio)
        begin
            if navio =  "1011" then
                navio_pos <= 0;
            elsif navio =  "1000" then
                navio_pos <= 1;
            elsif navio =  "1110" then
                navio_pos <= 2;
            elsif navio =  "1100" then
                navio_pos <= 3;
            elsif navio =  "0011" then
                navio_pos <= 4;
            elsif navio =  "0000" then
                navio_pos <= 5;
            elsif navio =  "0010" then
                navio_pos <= 6;
            elsif navio =  "1101" then
                navio_pos <= 7;
            elsif navio =  "1111" then
                navio_pos <= 8;
            elsif navio =  "0110" then
                navio_pos <= 9;
            elsif navio =  "0100" then
                navio_pos <= 10;
            elsif navio =  "1001" then
                navio_pos <= 11;
            elsif navio =  "0111" then
                navio_pos <= 12;
            elsif navio =  "0101" then
                navio_pos <= 13;
            elsif navio =  "0001" then
                navio_pos <= 14;
            elsif navio =  "1010" then
                navio_pos <= 15;
            end if;
        end process;


        -- atribuiçao das posições 
        process(navio_atual)
            begin
                case navio_atual is 
                    when navio_1 =>
                        led_1 <= '1';
                        led_2 <= '0';
                        led_3a <= '0';
                        led_3b <= '0';
                        navio_1_pos <= navio_pos;
                    when navio_2 =>
                        led_1 <= '0';
                        led_2 <= '1';
                        led_3a <= '0';
                        led_3b <= '0';
                        navio_2_pos <= navio_pos;
                    when navio_3a =>
                        led_1 <= '0';
                        led_2 <= '0';
                        led_3a <= '1';
                        led_3b <= '0';
                        navio_3_pos1 <= navio_pos;
                    when navio_3b =>
                        led_1 <= '0';
                        led_2 <= '0';
                        led_3a <= '0';
                        led_3b <= '1';
                        navio_3_pos2 <= navio_pos;
                end case;
        end process;

        
        -- codificacao das posições do alvo
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

        -- processo para comparar e disparar
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