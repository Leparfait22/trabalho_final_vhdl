library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Definição da entidade
entity BatalhaNaval is
    port (
        -- Entradas do dono do mar
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
		
        -- Saídas
        ledR: out std_logic_vector(9 downto 0);
        HEX0, HEX1, HEX2, HEX3: out std_logic_vector(6 downto 0);

        ledG: out std_logic_vector(7 downto 0)
        
    
        --display_seg   : out std_logic_vector(6 downto 0)

    );
end entity BatalhaNaval;

architecture mainBatalhaNaval of BatalhaNaval is
        type Navio_Type is (navio_1,navio_2,navio_3a,navio_3b,disp);
        signal navio_atual: Navio_Type := navio_1;
        signal display : integer range 0 to 16 ;
    
         -- Sinais internos
    signal navio_pos :integer range 0 to 16;
    signal navio_1_pos :integer range 0 to 16;
    signal navio_2_pos :integer range 0 to 16;
    signal navio_3_pos1 :integer range 0 to 16;
    signal navio_3_pos2 :integer range 0 to 16;
    signal pos_alvo : integer range 0 to 15;
    signal num_disparos : integer range 0 to 10:=6;
    signal num_vitorias : integer range 0 to 3;
    signal num_derotas : integer range 0 to 10;


    
    begin
        --selecao dos navios 
        process(key(0),key(1))
            variable count: integer := 0;
        begin
            if key(1) = '0' then
                navio_atual <= navio_1;
            elsif key(0)'event and key(0) = '0' then
                count := count + 1;
                if count = 1 then 
                    navio_atual <= navio_1;
                elsif count = 2 then 
                    navio_atual <= navio_2;
                elsif count = 3 then 
                    navio_atual <= navio_3a;
                elsif count = 4 then 
                    navio_atual <= navio_3b;
                elsif count = 5 then 
                    navio_atual <= disp;
                end if;
            end if;
        end process;
        
        --codifficacao das posicoes  dos navios 
        process(sw(3),sw(2),sw(1),sw(0))
        begin
            if sw(3) = '1' and  sw(2) = '0' and sw(1) = '1' and sw(0) = '1' then
                navio_pos <= 0;
            elsif sw(3) = '1' and  sw(2) = '0' and sw(1) = '0' and sw(0) = '0' then
                navio_pos <= 1;
            elsif sw(3) = '1' and  sw(2) = '1' and sw(1) = '1' and sw(0) = '0' then
                navio_pos <= 2;
            elsif sw(3) = '1' and  sw(2) = '1' and sw(1) = '0' and sw(0) = '0' then
                navio_pos <= 3;
            elsif sw(3) = '0' and  sw(2) = '0' and sw(1) = '1' and sw(0) = '1' then
                navio_pos <= 4;
            elsif sw(3) = '0' and  sw(2) = '0' and sw(1) = '0' and sw(0) = '0' then
                navio_pos <= 5;
            elsif sw(3) = '0' and  sw(2) = '0' and sw(1) = '1' and sw(0) = '0' then
                navio_pos <= 6;
            elsif sw(3) = '1' and  sw(2) = '1' and sw(1) = '0' and sw(0) = '1' then
                navio_pos <= 7;
            elsif sw(3) = '1' and  sw(2) = '1' and sw(1) = '1' and sw(0) = '1' then
                navio_pos <= 8;
            elsif sw(3) = '0' and  sw(2) = '1' and sw(1) = '1' and sw(0) = '0' then
                navio_pos <= 9;
            elsif sw(3) = '0' and  sw(2) = '1' and sw(1) = '0' and sw(0) = '0' then
                navio_pos <= 10;
            elsif sw(3) = '1' and  sw(2) = '0' and sw(1) = '0' and sw(0) = '1' then
                navio_pos <= 11;
            elsif sw(3) = '0' and  sw(2) = '1' and sw(1) = '1' and sw(0) = '1' then
                navio_pos <= 12;
            elsif sw(3) = '0' and  sw(2) = '1' and sw(1) = '0' and sw(0) = '1' then
                navio_pos <= 13;
            elsif sw(3) = '0' and  sw(2) = '0' and sw(1) = '0' and sw(0) = '1' then
                navio_pos <= 14;
            elsif sw(3) = '1' and  sw(2) = '0' and sw(1) = '1' and sw(0) = '0' then
                navio_pos <= 15;
            end if;
        end process;


        -- atribuiçao das posições 
        process(navio_atual)
            begin
                case navio_atual is 
                    when navio_1 =>
                        ledG(1) <= '1';
                        ledG(2) <= '0';
                        ledG(3) <= '0';
                        ledG(4) <= '0';
                        navio_1_pos <= navio_pos;
                    when navio_2 =>
                        ledG(1) <= '0';
                        ledG(2) <= '1';
                        ledG(3) <= '0';
                        ledG(4) <= '0';
                        navio_2_pos <= navio_pos;
                    when navio_3a =>
                        ledG(1) <= '0';
                        ledG(2) <= '0';
                        ledG(3) <= '1';
                        ledG(4) <= '0';
                        navio_3_pos1 <= navio_pos;
                    when navio_3b =>
                        ledG(1) <= '0';
                        ledG(2) <= '0';
                        ledG(3) <= '0';
                        ledG(4) <= '1';
                        navio_3_pos2 <= navio_pos;
                    when disp =>
                        ledG(1) <= '0';
                        ledG(2) <= '0';
                        ledG(3) <= '0';
                        ledG(4) <= '0';
                        ledG(5) <= '1';
                    when others =>
                        ledG(1) <= '0';
                        ledG(2) <= '0';
                        ledG(3) <= '0';
                        ledG(4) <= '0';
                        ledG(5) <= '1';
                end case;
        end process;

        
        -- codificacao das posições do alvo
        process(sw(9),sw(8),sw(7),sw(6),pos_alvo)
            begin
                if sw(9) = '1' and  sw(8) = '1' and sw(7) = '0' and sw(6) = '0' then
                    pos_alvo <= 0;
                elsif sw(9) = '1' and  sw(8) = '1' and sw(7) = '0' and sw(6) = '1' then
                    pos_alvo <= 1;
                elsif sw(9) = '1' and  sw(8) = '1' and sw(7) = '1' and sw(6) = '0' then
                    pos_alvo <= 2;
                elsif sw(9) = '1' and  sw(8) = '1' and sw(7) = '1' and sw(6) = '1' then
                    pos_alvo <= 3;
                elsif sw(9) = '1' and  sw(8) = '0' and sw(7) = '0' and sw(6) = '0' then
                    pos_alvo <= 4;
                elsif sw(9) = '1' and  sw(8) = '0' and sw(7) = '0' and sw(6) = '1' then
                    pos_alvo <= 5;
                elsif sw(9) = '1' and  sw(8) = '0' and sw(7) = '1' and sw(6) = '0' then
                    pos_alvo <= 6;
                elsif sw(9) = '1' and  sw(8) = '0' and sw(7) = '1' and sw(6) = '1' then
                    pos_alvo <= 7;
                elsif sw(9) = '0' and  sw(8) = '1' and sw(7) = '0' and sw(6) = '0' then
                    pos_alvo <= 8;
                elsif sw(9) = '0' and  sw(8) = '1' and sw(7) = '0' and sw(6) = '1' then
                    pos_alvo <= 9;
                elsif sw(9) = '0' and  sw(8) = '1' and sw(7) = '1' and sw(6) = '0' then
                    pos_alvo <= 10;
                elsif sw(9) = '0' and  sw(8) = '1' and sw(7) = '1' and sw(6) = '1' then
                    pos_alvo <= 11;
                elsif sw(9) = '0' and  sw(8) = '0' and sw(7) = '0' and sw(6) = '0' then
                    pos_alvo <= 12;
                elsif sw(9) = '0' and  sw(8) = '0' and sw(7) = '0' and sw(6) = '1' then
                    pos_alvo <= 13;
                elsif sw(9) = '0' and  sw(8) = '0' and sw(7) = '1' and sw(6) = '0' then
                    pos_alvo <= 14;
                elsif sw(9) = '0' and  sw(8) = '0' and sw(7) = '1' and sw(6) = '1' then
                    pos_alvo <= 15;
                end if;
        end process;

        -- processo para comparar e disparar
        process(navio_1_pos, navio_2_pos, navio_3_pos1, navio_3_pos2, key(3))
            variable contador : integer range 0 to 2 := 0;
            begin
                --ledG(7) <= '0';
             --   ledR(0) <= '0';
                if key(3)'event and key(3) = '1' then
                    if num_disparos = 1 then 
                        if pos_alvo = navio_1_pos  then
                            ledG(7) <= '0';
                            --num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_1_pos <= 16;
                        elsif pos_alvo = navio_2_pos  then
                            ledG(7) <= '0';
                            --num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_2_pos <= 16;
                        elsif pos_alvo = navio_3_pos1 or pos_alvo = navio_3_pos2 then
                            contador := contador + 1;
                            if contador = 2 then
                                ledG(7) <= '0';
                                --num_disparos <= num_disparos - 1;
                                num_vitorias <= num_vitorias + 1;
                            -- navio_3_pos1 <= 16;
                            -- navio_3_pos2 <= 16;
                            end if;
                        else
                            ledR(0) <= '1';
                            num_disparos <= num_disparos - 1;
                        end if;
                    else 
                        if pos_alvo = navio_1_pos  then
                            ledG(7) <= '0';
                            num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_1_pos <= 16;
                        elsif pos_alvo = navio_2_pos  then
                            ledG(7) <= '0';
                            num_disparos <= num_disparos - 1;
                            num_vitorias <= num_vitorias + 1;
                            --navio_2_pos <= 16;
                        elsif pos_alvo = navio_3_pos1 or pos_alvo = navio_3_pos2 then
                            contador := contador + 1;
                            if contador = 2 then
                                ledG(7) <= '0';
                                num_disparos <= num_disparos - 1;
                                num_vitorias <= num_vitorias + 1;
                            -- navio_3_pos1 <= 16;
                            -- navio_3_pos2 <= 16;
                            end if;
                        else
                            ledR(0) <= '1';
                            num_disparos <= num_disparos - 1;
                        end if;
                    end if;
                end if;
        end process;
    
            
    process(num_disparos)
    begin
        case num_disparos is
            when 0 =>
                HEX0(0)<='0';
                HEX0(1)<='0';
                HEX0(2)<='0';
                HEX0(3)<='0';
                HEX0(4)<='0';
                HEX0(5)<='0';
                HEX0(6)<='1';
            when 1 =>
                HEX0(0)<='1';
                HEX0(1)<='0';
                HEX0(2)<='0';
                HEX0(3)<='1';
                HEX0(4)<='1';
                HEX0(5)<='1';
                HEX0(6)<='1';
            when 2 =>
                HEX0(0)<='0';
                HEX0(1)<='0';
                HEX0(2)<='1';
                HEX0(3)<='0';
                HEX0(4)<='0';
                HEX0(5)<='1';
                HEX0(6)<='0';
            when 3 =>
                HEX0(0)<='0';
                HEX0(1)<='0';
                HEX0(2)<='0';
                HEX0(3)<='0';
                HEX0(4)<='1';
                HEX0(5)<='1';
                HEX0(6)<='0';
            when 4 =>
                HEX0(0)<='1';
                HEX0(1)<='0';
                HEX0(2)<='0';
                HEX0(3)<='1';
                HEX0(4)<='1';
                HEX0(5)<='0';
                HEX0(6)<='0';
            when 5 =>
                HEX0(0)<='0';
                HEX0(1)<='1';
                HEX0(2)<='0';
                HEX0(3)<='0';
                HEX0(4)<='1';
                HEX0(5)<='0';
                HEX0(6)<='0';
            when 6 =>
                HEX0(0)<='0';
                HEX0(1)<='1';
                HEX0(2)<='0';
                HEX0(3)<='0';
                HEX0(4)<='0';
                HEX0(5)<='0';
                HEX0(6)<='0';
            when others =>
            HEX0(0)<='0';
            HEX0(1)<='0';
            HEX0(2)<='0';
            HEX0(3)<='0';
            HEX0(4)<='0';
            HEX0(5)<='0';
            HEX0(6)<='1';--  Exemplo: manter o último número de disparos exibido
        end case;
        -- desativa os outros displays ----------------------------------------------
        HEX1(0)<='1';
        HEX1(1)<='1';
        HEX1(2)<='1';
        HEX1(3)<='1';
        HEX1(4)<='1';
        HEX1(5)<='1';
        HEX1(6)<='1';
        
        HEX2(0)<='1';
        HEX2(1)<='1';
        HEX2(2)<='1';
        HEX2(3)<='1';
        HEX2(4)<='1';
        HEX2(5)<='1';
        HEX2(6)<='1';
        
        HEX3(0)<='1';
        HEX3(1)<='1';
        HEX3(2)<='1';
        HEX3(3)<='1';
        HEX3(4)<='1';
        HEX3(5)<='1';
        HEX3(6)<='1';
        -----------------------------------------------------------------------------
    end process;

    process(num_disparos,num_vitorias,num_derotas)
        begin
            if num_vitorias = 3 then 
                ledG(0) <= '1';
            end if;
            if num_disparos = 0 and num_vitorias < 3 then
                ledR(9) <= '0';
            end if;
    end process;

end architecture mainBatalhaNaval;





