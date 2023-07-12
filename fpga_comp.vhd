
library ieee;
use ieee.std_logic_1164.all;

entity Elevador is
    port (
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        --andar: in std_logic_vector(1 downto 0);
		ledG: out std_logic_vector(7 downto 0)
    );
end entity Elevador;

architecture mainElevador of Elevador is
    type Estado_Type is (Andar_A, Andar_B, Andar_C, Andar_D);
    signal estado_atual: Estado_Type := Andar_A;
   -- signal proximo_estado: Estado_Type;
   --signal contador : integer range 0 to 3 := 0;


begin
    process (key(1),key(0))
    variable contador: integer := 0;
    variable ledG: std_logic;
    begin
        if key(1) = '0' then 
            estado_atual <= Andar_A;
            
            --ledG(2) <= '0';
            --ledG(3) <= '0';
            --ledG(4) <= '0';
        
        elsif key(0)'event and key(0) = '0' then
            case estado_atual is
            when Andar_A =>
                if sw(9) = '0' and sw(8) = '0' then 
        
                        estado_atual <= Andar_A;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '0';
                        --ledG(4) <= '0';
                elsif sw(9) = '0' and sw(8) = '1' then 
                    
                        estado_atual <= Andar_B;
                        
                        --ledG(2) <= '1';
                        --ledG(3) <= '0';
                        --ledG(4) <= '0';
    
                elsif sw(9) = '1' and sw(8) = '0' then 
                    ----for contador in 1 to 2 loop
                        --if contador < 3 then
                        --end if;
                        if  key(0) = '0' then
                            contador := contador + 1;
                            if contador = 1 then 
                                estado_atual <= Andar_B;
                                
                                --ledG(2) <= '1';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_C;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '1';
                                --ledG(4) <= '0';
                            end if;
                        end if;
                    ----end loop;
                elsif sw(9) = '1' and sw(8) = '1' then 
                    --for contador in 1 to 3 loop
                        if  key(0) = '0' then
                            if contador = 1 then 
                                estado_atual <= Andar_B;
                                
                                --ledG(2) <= '1';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_C;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '1';
                                --ledG(4) <= '0';
                            elsif contador = 3 then 
                                estado_atual <= Andar_D;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '0';
                                --ledG(4) <= '1';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_B =>
                if sw(9) = '0' and sw(8) = '1' then  
                    if  key(0) = '0' then
                        estado_atual <= andar_B;
                        
                        --ledG(2) <= '1';
                        --ledG(3) <= '0';
                        --ledG(4) <= '0';
                    end if;
                elsif sw(9) = '1' and sw(8) = '0' then 
                    if  key(0) = '0' then 
                        estado_atual <= Andar_C;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '1';
                        --ledG(4) <= '0';
                    end if;
                elsif sw(9) = '0' and sw(8) = '0' then 
                    if  key(0) = '0' then 
                        estado_atual <= Andar_A;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '0';
                        --ledG(4) <= '0';
                        end if;
                elsif sw(9) = '1' and sw(8) = '1' then 
                        --for contador in 1 to 2 loop
                        if  key(0) = '0' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '1';
                                --ledG(4) <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_D;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '0';
                                --ledG(4) <= '1';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_C =>
                if sw(9) = '1' and sw(8) = '0' then 
                     if  key(0) = '0' then
                        estado_atual <= Andar_C;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '1';
                        --ledG(4) <= '0';
                    end if;
                elsif sw(9) = '0' and sw(8) = '1' then 
                    if  key(0) = '0' then 
                        estado_atual <= Andar_B;
                        
                        --ledG(2) <= '1';
                        --ledG(3) <= '0';
                        --ledG(4) <= '0';
                    end if;
                elsif sw(9) = '1' and sw(8) = '1' then 
                    if  key(0) = '0' then 
                        estado_atual <= Andar_D;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '0';
                        --ledG(4) <= '1';
                        end if;
                    elsif sw(9) = '0' and sw(8) = '0' then 
                        --for contador in 1 to 2 loop
                        if  key(0) = '0' then
                            if contador = 1 then 
                                estado_atual <= Andar_B;
                                
                                --ledG(2) <= '1';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_A;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_D =>
                 if sw(9) = '1' and sw(8) = '1' then 
                    if  key(0) = '0' then
                        estado_atual <= Andar_D;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '0';
                        --ledG(4) <= '1';
                    end if;
                elsif sw(9) = '1' and sw(8) = '0' then 
                    if  key(0) = '0' then 
                        estado_atual <= Andar_C;
                        
                        --ledG(2) <= '0';
                        --ledG(3) <= '1';
                        --ledG(4) <= '0';
                    end if;
                elsif sw(9) = '0' and sw(8) = '1' then 
                    --for contador in 1 to 2 loop
                        if  key(0) = '0' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '1';
                                --ledG(4) <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_B;
                                
                                --ledG(2) <= '1';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';
                            end if;
                        end if;
                    --end loop;
                elsif sw(9) = '0' and sw(8) = '0' then 
                    --for contador in 1 to 3 loop
                        if  key(0) = '0' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '1';
                                --ledG(4) <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_B;
                                
                                --ledG(2) <= '1';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';
                            elsif contador = 3 then 
                                estado_atual <= Andar_A;
                                
                                --ledG(2) <= '0';
                                --ledG(3) <= '0';
                                --ledG(4) <= '0';
                            end if;
                        end if;
                    --end loop;     
                end if;
            end case;
            end if;
    end process;
       


    process (estado_atual)
    begin
        case estado_atual is
            when Andar_A =>
                ledG(1) <= '1';
                ledG(2) <= '0';
                ledG(3) <= '0';
                ledG(4) <= '0';
            when Andar_B =>
                ledG(1) <= '0';
                ledG(2) <= '1';
                ledG(3) <= '0';
                ledG(4) <= '0';
           when Andar_C =>
                ledG(1) <= '0';
                ledG(2) <= '0';
                ledG(3) <= '1';
                ledG(4) <= '0';
            when Andar_D =>
                ledG(1) <= '0';
                ledG(2) <= '0';
                ledG(3) <= '0';
                ledG(4) <= '1';
        end case;
    end process;
end architecture mainElevador;
	
