library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY verkeerslicht IS
	PORT( clk, reset : IN STD_LOGIC;
			button : IN STD_LOGIC;
			P_R, P_gr, C_gr, C_yel, C_R : OUT STD_LOGIC);
END verkeerslicht;

ARCHITECTURE A OF verkeerslicht IS
-- Enumerated Data Type for State
TYPE STATE_TYPE IS (state_A, state_B, state_C);
	SIGNAL state: STATE_TYPE;
BEGIN
	PROCESS (reset, clk)
BEGIN
	IF reset = '1' THEN -- Reset State
		state <= state_A;
	ELSIF clk'EVENT AND clk = '1' THEN
CASE state IS -- Define State Transistions in Case Statement
	WHEN state_A =>
	IF button = '0' THEN
	state <= state_A;
	ELSE
	state <= state_B;
	END IF;
	WHEN state_B =>
	state <= state_C;
	WHEN state_C =>
	IF button = '1' THEN
	state <= state_C;
	ELSE 
	state <= state_A;
	END IF;
	WHEN OTHERS =>
	State <= state_A;
	END CASE;
	END IF;
END PROCESS;
WITH state SELECT -- Define State Machine Outputs
P_R <= '1' when state_A,
		 '1' when state_B,
		 '0' when state_C;
With state select	 
P_gr <= '0' when state_A,
		  '0' when state_B,
		  '1' when state_C;
With state select		 
C_R <= '0' when state_A,
		 '0' when state_B,
		 '1' when state_C;
With state select		 
C_yel <= '0' when state_A,
			'1' when state_B,
			'0' when state_C;
With state select			
C_gr <= '1' when state_A,
		  '0' when state_B,
		  '0' when state_C;
END architecture;