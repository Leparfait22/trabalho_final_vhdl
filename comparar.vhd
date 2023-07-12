library ieee;
use ieee.std_logic_1164.all;

entity Elevador is
    port (
        clock: in std_logic;
        reset: in std_logic;
        andar: in std_logic_vector(1 downto 0);
        andar1, andar2, andar3, andar4: out std_logic
    );
end entity Elevador;

architecture mainElevador of Elevador is
    type Estado_Type is (Andar_A, Andar_B, Andar_C, Andar_D);
    signal estado_atual: Estado_Type := Andar_A;



begin
    process (reset,clock)
    variable contador: integer := 0;
    begin
        if reset = '1' then 
            estado_atual <= Andar_A;
        end if;
        case estado_atual is
            when Andar_A =>
                if andar = "00" then 
                    if clock'event and clock = '1' then
                        estado_atual <= Andar_A;
                    end if;
                elsif andar = "01" then
                    if clock'event and clock = '1' then 
                        estad'o_atual <= Andar_B;
                    end if;
                elsif andar = "10" then
                        if clock'event and clock = '1' then
                            contador := contador + 1;
                            if contador = 1 then 
                                estado_atual <= Andar_B; 
                            elsif contador = 2 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';
                            end if;
                        end if;
                    ----end loop;
                elsif andar = "11" then
                    --for contador in 1 to 3 loop
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_B;
                                --andar1 <= '0';
                                --andar2 <= '1';
                                --andar3 <= '0';
                                --andar4 <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';
                            elsif contador = 3 then 
                                estado_atual <= Andar_D;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '0';
                                --andar4 <= '1';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_B =>
                if andar = "01" then 
                    if clock'event and clock = '1' then
                        estado_atual <= andar_B;
                        --andar1 <= '0';
                        --andar2 <= '1';
                        --andar3 <= '0';
                        --andar4 <= '0';
                    end if;
                elsif andar = "10" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_C;
                        --andar1 <= '0';
                        --andar2 <= '0';
                        --andar3 <= '1';
                        --andar4 <= '0';
                    end if;
                elsif andar = "00" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_A;
                        --andar1 <= '1';
                        --andar2 <= '0';
                        --andar3 <= '0';
                        --andar4 <= '0';
                        end if;
                elsif andar = "11" then
                    --for contador in 1 to 2 loop
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_D;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '0';
                                --andar4 <= '1';
                            end if;
                        end if;
                    --end loop;     
                end if;
            when Andar_C =>
                if andar = "10" then 
                    if clock'event and clock = '1' then
                        estado_atual <= Andar_C;
                    end if;
                elsif andar = "01" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_B;
                    end if;
                elsif andar = "11" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_D;
                        end if;
                elsif andar = "00" then
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_B; 
                            elsif contador = 2 then 
                                estado_atual <= Andar_A;
                            end if;
                        end if;
                end if;
            when Andar_D =>
                if andar = "11" then 
                    if clock'event and clock = '1' then
                        estado_atual <= Andar_D;
                    end if;
                elsif andar = "10" then
                    if clock'event and clock = '1' then 
                        estado_atual <= Andar_C;
                    end if;
                elsif andar = "01" then
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_C; 
                            elsif contador = 2 then 
                                estado_atual <= Andar_B;
                            end if;
                        end if;
                elsif andar = "00" then
                        if clock'event and clock = '1' then
                            if contador = 1 then 
                                estado_atual <= Andar_C;
                                --andar1 <= '0';
                                --andar2 <= '0';
                                --andar3 <= '1';
                                --andar4 <= '0';  
                            elsif contador = 2 then 
                                estado_atual <= Andar_B;
                                --andar1 <= '0';
                                --andar2 <= '1';
                                --andar3 <= '0';
                                --andar4 <= '0';
                            elsif contador = 3 then 
                                estado_atual <= Andar_A;
                                --andar1 <= '1';
                                --andar2 <= '0';
                                --andar3 <= '0';
                                --andar4 <= '0';
                            end if;
                        end if;
                    --end loop;     
                end if;
            end case;
    end process;
       


    process (estado_atual)
    begin
        case estado_atual is
            when Andar_A =>
                andar1 <= '1';
                andar2 <= '0';
                andar3 <= '0';
                andar4 <= '0';
            when Andar_B =>
                andar1 <= '0';
                andar2 <= '1';
                andar3 <= '0';
                andar4 <= '0';
           when Andar_C =>
                andar1 <= '0';
                andar2 <= '0';
                andar3 <= '1';
                andar4 <= '0';
            when Andar_D =>
                andar1 <= '0';
                andar2 <= '0';
                andar3 <= '0';
                andar4 <= '1';
        end case;
    end process;
end architecture mainElevador; 





when "0000" =>
display_seg <= "1111110"; -- dígito 0
when "0001" =>
display_seg <= "0110000"; -- dígito 1
when "0010" =>
display_seg <= "1101101"; -- dígito 2
when "0011" =>
display_seg <= "1111001"; -- dígito 3
when "0100" =>
display_seg <= "0110011"; -- dígito 4
when "0101" =>
display_seg <= "1011011"; -- dígito 5
when "0110" =>
display_seg <= "1011111"; -- dígito 6
when "0111" =>
display_seg <= "1110000"; -- dígito 7
when "1000" =>
display_seg <= "1111111"; -- dígito 8
when "1001" =>
display_seg <= "1111011"; -- dígito 9
when others =>
display_seg <= "0000000"; -- desligar o display se o valor for inválido




process(navio_1_pos,navio_2_pos,navio_3_pos1,navio_3_pos2,disparar)
variable contador : integer range 0 to 2 := 0;

begin
    acertou <= '0';
    errou <= '0';
    if disparar'event and disparar = '1' then
        if pos_alvo = navio_1_pos or pos_alvo  = navio_2_pos then
            acertou <= '1';
            num_disparos <= num_disparos + 1;
        elsif pos_alvo = navio_3_pos1 or pos_alvo = navio_3_pos2 then
            contador := contador + 1;
            if disparar'event and disparar = '1'  and contador = 1 then 
                acertou <= '1';
                num_disparos <= num_disparos + 1;
            end if;
        else
            errou <= '1';
            num_disparos <= num_disparos + 1;
        end if;
    end if;
end process;













library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
	
	entity disp7seg is
	port(
	    Data_In          :   in  std_logic_vector(3 downto 0);
        a,b,c,d,e,f,g,h  :  out  std_logic;
		dig_uni          :  out  std_logic;
        dig_dez          :  out  std_logic;
        dig_cen          :  out  std_logic;
        dig_mil          :  out  std_logic);
		  
   end disp7seg;
	
	
	architecture hardware of disp7seg is
	begin
		process(Data_In)
		begin
		  case Data_In is
		  when "0000"   => a <= '1'; b <= '1'; c <= '1'; d <= '1'; e <= '1'; f <= '1'; g <= '0'; h <= '0';
	      when "0001"   => a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '0';
	      when "0010"   => a <= '1'; b <= '1'; c <= '0'; d <= '1'; e <= '1'; f <= '0'; g <= '1'; h <= '0';	
	      when "0011"   => a <= '1'; b <= '1'; c <= '1'; d <= '1'; e <= '0'; f <= '0'; g <= '1'; h <= '0'; 
	      when "0100"   => a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '1'; g <= '1'; h <= '0';	
	      when "0101"   => a <= '1'; b <= '0'; c <= '1'; d <= '1'; e <= '0'; f <= '1'; g <= '1'; h <= '0';	
	      when "0110"   => a <= '1'; b <= '0'; c <= '1'; d <= '1'; e <= '1'; f <= '1'; g <= '1'; h <= '0';	
	      when "0111"   => a <= '1'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '0';	
	      when "1000"   => a <= '1'; b <= '1'; c <= '1'; d <= '1'; e <= '1'; f <= '1'; g <= '1'; h <= '0';
	      when "1001"   => a <= '1'; b <= '1'; c <= '1'; d <= '1'; e <= '0'; f <= '1'; g <= '1'; h <= '0';			
	      when others   => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '0';	
	     end case;
		end process;
		
		dig_mil <= '1';
		dig_cen <= '1';
		dig_dez <= '1';
		dig_uni <= '1';
		
		
   end hardware;
	