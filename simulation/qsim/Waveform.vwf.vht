-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/15/2021 14:18:03"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          verkeerslicht
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY verkeerslicht_vhd_vec_tst IS
END verkeerslicht_vhd_vec_tst;
ARCHITECTURE verkeerslicht_arch OF verkeerslicht_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL button : STD_LOGIC;
SIGNAL C_gr : STD_LOGIC;
SIGNAL C_R : STD_LOGIC;
SIGNAL C_yel : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL P_gr : STD_LOGIC;
SIGNAL P_R : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT verkeerslicht
	PORT (
	button : IN STD_LOGIC;
	C_gr : OUT STD_LOGIC;
	C_R : OUT STD_LOGIC;
	C_yel : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	P_gr : OUT STD_LOGIC;
	P_R : OUT STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : verkeerslicht
	PORT MAP (
-- list connections between master ports and signals
	button => button,
	C_gr => C_gr,
	C_R => C_R,
	C_yel => C_yel,
	clk => clk,
	P_gr => P_gr,
	P_R => P_R,
	reset => reset
	);

-- button
t_prcs_button: PROCESS
BEGIN
	button <= '0';
	WAIT FOR 140000 ps;
	button <= '1';
	WAIT FOR 70000 ps;
	button <= '0';
	WAIT FOR 140000 ps;
	button <= '1';
	WAIT FOR 460000 ps;
	button <= '0';
WAIT;
END PROCESS t_prcs_button;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 50000 ps;
	clk <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 450000 ps;
	reset <= '1';
	WAIT FOR 50000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END verkeerslicht_arch;
