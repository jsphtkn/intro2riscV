library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_gate is
    Port ( INA1 : in  STD_LOGIC;
           INA2 : in  STD_LOGIC;
           OA   : out STD_LOGIC);
end OR_gate;

architecture Behavioral of OR_gate is
begin
    OA <= INA1 or INA2;    -- 2 input OR gate
end Behavioral;