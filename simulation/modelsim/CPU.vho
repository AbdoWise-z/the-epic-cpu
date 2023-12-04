-- Copyright (C) 2022  Intel Corporation. All rights reserved.
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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"

-- DATE "12/04/2023 17:47:38"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RegisterFile IS
    PORT (
	clk : IN std_logic;
	Rsrc1 : IN std_logic_vector(2 DOWNTO 0);
	Rsrc2 : IN std_logic_vector(2 DOWNTO 0);
	Rdst : IN std_logic_vector(2 DOWNTO 0);
	WB : IN std_logic;
	Value : IN std_logic_vector(31 DOWNTO 0);
	Rout1 : OUT std_logic_vector(31 DOWNTO 0);
	Rout2 : OUT std_logic_vector(31 DOWNTO 0)
	);
END RegisterFile;

-- Design Ports Information
-- Rout1[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[1]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[2]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[3]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[4]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[5]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[6]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[7]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[8]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[9]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[10]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[11]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[12]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[13]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[14]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[15]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[16]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[17]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[18]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[19]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[20]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[21]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[22]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[23]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[24]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[25]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[26]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[27]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[28]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[29]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[30]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout1[31]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[0]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[1]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[2]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[3]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[4]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[5]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[6]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[7]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[8]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[9]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[10]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[11]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[12]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[13]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[14]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[15]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[16]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[17]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[18]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[19]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[20]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[21]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[22]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[23]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[24]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[25]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[26]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[27]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[28]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[29]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[30]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rout2[31]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WB	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[0]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rdst[0]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rdst[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rdst[2]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rsrc1[0]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rsrc1[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rsrc1[2]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[1]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[2]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[3]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[4]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[5]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[6]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[7]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[8]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[9]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[10]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[11]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[12]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[13]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[14]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[15]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[16]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[17]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[18]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[19]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[20]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[21]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[22]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[23]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[24]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[25]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[26]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[27]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[28]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[29]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[30]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Value[31]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rsrc2[0]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rsrc2[1]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rsrc2[2]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RegisterFile IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_Rsrc1 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Rsrc2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Rdst : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_WB : std_logic;
SIGNAL ww_Value : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_Rout1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_Rout2 : std_logic_vector(31 DOWNTO 0);
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \WB~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Value[0]~input_o\ : std_logic;
SIGNAL \Rdst[0]~input_o\ : std_logic;
SIGNAL \Rdst[1]~input_o\ : std_logic;
SIGNAL \Rdst[2]~input_o\ : std_logic;
SIGNAL \Rsrc1[0]~input_o\ : std_logic;
SIGNAL \Rsrc1[1]~input_o\ : std_logic;
SIGNAL \Rsrc1[2]~input_o\ : std_logic;
SIGNAL \Value[1]~input_o\ : std_logic;
SIGNAL \Value[2]~input_o\ : std_logic;
SIGNAL \Value[3]~input_o\ : std_logic;
SIGNAL \Value[4]~input_o\ : std_logic;
SIGNAL \Value[5]~input_o\ : std_logic;
SIGNAL \Value[6]~input_o\ : std_logic;
SIGNAL \Value[7]~input_o\ : std_logic;
SIGNAL \Value[8]~input_o\ : std_logic;
SIGNAL \Value[9]~input_o\ : std_logic;
SIGNAL \Value[10]~input_o\ : std_logic;
SIGNAL \Value[11]~input_o\ : std_logic;
SIGNAL \Value[12]~input_o\ : std_logic;
SIGNAL \Value[13]~input_o\ : std_logic;
SIGNAL \Value[14]~input_o\ : std_logic;
SIGNAL \Value[15]~input_o\ : std_logic;
SIGNAL \Value[16]~input_o\ : std_logic;
SIGNAL \Value[17]~input_o\ : std_logic;
SIGNAL \Value[18]~input_o\ : std_logic;
SIGNAL \Value[19]~input_o\ : std_logic;
SIGNAL \Value[20]~input_o\ : std_logic;
SIGNAL \Value[21]~input_o\ : std_logic;
SIGNAL \Value[22]~input_o\ : std_logic;
SIGNAL \Value[23]~input_o\ : std_logic;
SIGNAL \Value[24]~input_o\ : std_logic;
SIGNAL \Value[25]~input_o\ : std_logic;
SIGNAL \Value[26]~input_o\ : std_logic;
SIGNAL \Value[27]~input_o\ : std_logic;
SIGNAL \Value[28]~input_o\ : std_logic;
SIGNAL \Value[29]~input_o\ : std_logic;
SIGNAL \Value[30]~input_o\ : std_logic;
SIGNAL \Value[31]~input_o\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a16\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a17\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a18\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a19\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a20\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a21\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a22\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a23\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a24\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a25\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a26\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a27\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a28\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a29\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a30\ : std_logic;
SIGNAL \rgFile_rtl_0|auto_generated|ram_block1a31\ : std_logic;
SIGNAL \Rsrc2[0]~input_o\ : std_logic;
SIGNAL \Rsrc2[1]~input_o\ : std_logic;
SIGNAL \Rsrc2[2]~input_o\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a16\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a17\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a18\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a19\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a20\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a21\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a22\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a23\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a24\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a25\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a26\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a27\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a28\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a29\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a30\ : std_logic;
SIGNAL \rgFile_rtl_1|auto_generated|ram_block1a31\ : std_logic;
SIGNAL \ALT_INV_clk~inputCLKENA0_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_Rsrc1 <= Rsrc1;
ww_Rsrc2 <= Rsrc2;
ww_Rdst <= Rdst;
ww_WB <= WB;
ww_Value <= Value;
Rout1 <= ww_Rout1;
Rout2 <= ww_Rout2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rgFile_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \Value[31]~input_o\ & \Value[30]~input_o\ & \Value[29]~input_o\ & \Value[28]~input_o\ & \Value[27]~input_o\ & \Value[26]~input_o\ & 
\Value[25]~input_o\ & \Value[24]~input_o\ & \Value[23]~input_o\ & \Value[22]~input_o\ & \Value[21]~input_o\ & \Value[20]~input_o\ & \Value[19]~input_o\ & \Value[18]~input_o\ & \Value[17]~input_o\ & \Value[16]~input_o\ & \Value[15]~input_o\ & 
\Value[14]~input_o\ & \Value[13]~input_o\ & \Value[12]~input_o\ & \Value[11]~input_o\ & \Value[10]~input_o\ & \Value[9]~input_o\ & \Value[8]~input_o\ & \Value[7]~input_o\ & \Value[6]~input_o\ & \Value[5]~input_o\ & \Value[4]~input_o\ & \Value[3]~input_o\
& \Value[2]~input_o\ & \Value[1]~input_o\ & \Value[0]~input_o\);

\rgFile_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\Rdst[2]~input_o\ & \Rdst[1]~input_o\ & \Rdst[0]~input_o\);

\rgFile_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\Rsrc1[2]~input_o\ & \Rsrc1[1]~input_o\ & \Rsrc1[0]~input_o\);

\rgFile_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\rgFile_rtl_0|auto_generated|ram_block1a1\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\rgFile_rtl_0|auto_generated|ram_block1a2\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\rgFile_rtl_0|auto_generated|ram_block1a3\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\rgFile_rtl_0|auto_generated|ram_block1a4\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\rgFile_rtl_0|auto_generated|ram_block1a5\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\rgFile_rtl_0|auto_generated|ram_block1a6\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\rgFile_rtl_0|auto_generated|ram_block1a7\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\rgFile_rtl_0|auto_generated|ram_block1a8\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\rgFile_rtl_0|auto_generated|ram_block1a9\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\rgFile_rtl_0|auto_generated|ram_block1a10\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\rgFile_rtl_0|auto_generated|ram_block1a11\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\rgFile_rtl_0|auto_generated|ram_block1a12\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\rgFile_rtl_0|auto_generated|ram_block1a13\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\rgFile_rtl_0|auto_generated|ram_block1a14\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\rgFile_rtl_0|auto_generated|ram_block1a15\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);
\rgFile_rtl_0|auto_generated|ram_block1a16\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(16);
\rgFile_rtl_0|auto_generated|ram_block1a17\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(17);
\rgFile_rtl_0|auto_generated|ram_block1a18\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(18);
\rgFile_rtl_0|auto_generated|ram_block1a19\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(19);
\rgFile_rtl_0|auto_generated|ram_block1a20\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(20);
\rgFile_rtl_0|auto_generated|ram_block1a21\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(21);
\rgFile_rtl_0|auto_generated|ram_block1a22\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(22);
\rgFile_rtl_0|auto_generated|ram_block1a23\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(23);
\rgFile_rtl_0|auto_generated|ram_block1a24\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(24);
\rgFile_rtl_0|auto_generated|ram_block1a25\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(25);
\rgFile_rtl_0|auto_generated|ram_block1a26\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(26);
\rgFile_rtl_0|auto_generated|ram_block1a27\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(27);
\rgFile_rtl_0|auto_generated|ram_block1a28\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(28);
\rgFile_rtl_0|auto_generated|ram_block1a29\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(29);
\rgFile_rtl_0|auto_generated|ram_block1a30\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(30);
\rgFile_rtl_0|auto_generated|ram_block1a31\ <= \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(31);

\rgFile_rtl_1|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \Value[31]~input_o\ & \Value[30]~input_o\ & \Value[29]~input_o\ & \Value[28]~input_o\ & \Value[27]~input_o\ & \Value[26]~input_o\ & 
\Value[25]~input_o\ & \Value[24]~input_o\ & \Value[23]~input_o\ & \Value[22]~input_o\ & \Value[21]~input_o\ & \Value[20]~input_o\ & \Value[19]~input_o\ & \Value[18]~input_o\ & \Value[17]~input_o\ & \Value[16]~input_o\ & \Value[15]~input_o\ & 
\Value[14]~input_o\ & \Value[13]~input_o\ & \Value[12]~input_o\ & \Value[11]~input_o\ & \Value[10]~input_o\ & \Value[9]~input_o\ & \Value[8]~input_o\ & \Value[7]~input_o\ & \Value[6]~input_o\ & \Value[5]~input_o\ & \Value[4]~input_o\ & \Value[3]~input_o\
& \Value[2]~input_o\ & \Value[1]~input_o\ & \Value[0]~input_o\);

\rgFile_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\Rdst[2]~input_o\ & \Rdst[1]~input_o\ & \Rdst[0]~input_o\);

\rgFile_rtl_1|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\Rsrc2[2]~input_o\ & \Rsrc2[1]~input_o\ & \Rsrc2[0]~input_o\);

\rgFile_rtl_1|auto_generated|ram_block1a0~portbdataout\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\rgFile_rtl_1|auto_generated|ram_block1a1\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\rgFile_rtl_1|auto_generated|ram_block1a2\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\rgFile_rtl_1|auto_generated|ram_block1a3\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\rgFile_rtl_1|auto_generated|ram_block1a4\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\rgFile_rtl_1|auto_generated|ram_block1a5\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\rgFile_rtl_1|auto_generated|ram_block1a6\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\rgFile_rtl_1|auto_generated|ram_block1a7\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\rgFile_rtl_1|auto_generated|ram_block1a8\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\rgFile_rtl_1|auto_generated|ram_block1a9\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\rgFile_rtl_1|auto_generated|ram_block1a10\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\rgFile_rtl_1|auto_generated|ram_block1a11\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\rgFile_rtl_1|auto_generated|ram_block1a12\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\rgFile_rtl_1|auto_generated|ram_block1a13\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\rgFile_rtl_1|auto_generated|ram_block1a14\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\rgFile_rtl_1|auto_generated|ram_block1a15\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);
\rgFile_rtl_1|auto_generated|ram_block1a16\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(16);
\rgFile_rtl_1|auto_generated|ram_block1a17\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(17);
\rgFile_rtl_1|auto_generated|ram_block1a18\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(18);
\rgFile_rtl_1|auto_generated|ram_block1a19\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(19);
\rgFile_rtl_1|auto_generated|ram_block1a20\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(20);
\rgFile_rtl_1|auto_generated|ram_block1a21\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(21);
\rgFile_rtl_1|auto_generated|ram_block1a22\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(22);
\rgFile_rtl_1|auto_generated|ram_block1a23\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(23);
\rgFile_rtl_1|auto_generated|ram_block1a24\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(24);
\rgFile_rtl_1|auto_generated|ram_block1a25\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(25);
\rgFile_rtl_1|auto_generated|ram_block1a26\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(26);
\rgFile_rtl_1|auto_generated|ram_block1a27\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(27);
\rgFile_rtl_1|auto_generated|ram_block1a28\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(28);
\rgFile_rtl_1|auto_generated|ram_block1a29\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(29);
\rgFile_rtl_1|auto_generated|ram_block1a30\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(30);
\rgFile_rtl_1|auto_generated|ram_block1a31\ <= \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(31);
\ALT_INV_clk~inputCLKENA0_outclk\ <= NOT \clk~inputCLKENA0_outclk\;

-- Location: IOOBUF_X62_Y0_N53
\Rout1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => ww_Rout1(0));

-- Location: IOOBUF_X60_Y0_N2
\Rout1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => ww_Rout1(1));

-- Location: IOOBUF_X70_Y0_N36
\Rout1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => ww_Rout1(2));

-- Location: IOOBUF_X64_Y0_N19
\Rout1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => ww_Rout1(3));

-- Location: IOOBUF_X70_Y0_N53
\Rout1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => ww_Rout1(4));

-- Location: IOOBUF_X54_Y0_N2
\Rout1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => ww_Rout1(5));

-- Location: IOOBUF_X60_Y0_N19
\Rout1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => ww_Rout1(6));

-- Location: IOOBUF_X70_Y0_N2
\Rout1[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => ww_Rout1(7));

-- Location: IOOBUF_X66_Y0_N76
\Rout1[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a8\,
	devoe => ww_devoe,
	o => ww_Rout1(8));

-- Location: IOOBUF_X64_Y0_N36
\Rout1[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a9\,
	devoe => ww_devoe,
	o => ww_Rout1(9));

-- Location: IOOBUF_X58_Y0_N59
\Rout1[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a10\,
	devoe => ww_devoe,
	o => ww_Rout1(10));

-- Location: IOOBUF_X60_Y0_N36
\Rout1[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a11\,
	devoe => ww_devoe,
	o => ww_Rout1(11));

-- Location: IOOBUF_X68_Y0_N2
\Rout1[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a12\,
	devoe => ww_devoe,
	o => ww_Rout1(12));

-- Location: IOOBUF_X66_Y0_N59
\Rout1[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a13\,
	devoe => ww_devoe,
	o => ww_Rout1(13));

-- Location: IOOBUF_X60_Y0_N53
\Rout1[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a14\,
	devoe => ww_devoe,
	o => ww_Rout1(14));

-- Location: IOOBUF_X56_Y0_N2
\Rout1[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a15\,
	devoe => ww_devoe,
	o => ww_Rout1(15));

-- Location: IOOBUF_X89_Y4_N96
\Rout1[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a16\,
	devoe => ww_devoe,
	o => ww_Rout1(16));

-- Location: IOOBUF_X58_Y0_N76
\Rout1[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a17\,
	devoe => ww_devoe,
	o => ww_Rout1(17));

-- Location: IOOBUF_X62_Y0_N36
\Rout1[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a18\,
	devoe => ww_devoe,
	o => ww_Rout1(18));

-- Location: IOOBUF_X70_Y0_N19
\Rout1[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a19\,
	devoe => ww_devoe,
	o => ww_Rout1(19));

-- Location: IOOBUF_X64_Y0_N53
\Rout1[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a20\,
	devoe => ww_devoe,
	o => ww_Rout1(20));

-- Location: IOOBUF_X89_Y4_N79
\Rout1[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a21\,
	devoe => ww_devoe,
	o => ww_Rout1(21));

-- Location: IOOBUF_X68_Y0_N53
\Rout1[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a22\,
	devoe => ww_devoe,
	o => ww_Rout1(22));

-- Location: IOOBUF_X72_Y0_N36
\Rout1[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a23\,
	devoe => ww_devoe,
	o => ww_Rout1(23));

-- Location: IOOBUF_X58_Y0_N42
\Rout1[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a24\,
	devoe => ww_devoe,
	o => ww_Rout1(24));

-- Location: IOOBUF_X58_Y0_N93
\Rout1[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a25\,
	devoe => ww_devoe,
	o => ww_Rout1(25));

-- Location: IOOBUF_X62_Y0_N2
\Rout1[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a26\,
	devoe => ww_devoe,
	o => ww_Rout1(26));

-- Location: IOOBUF_X62_Y0_N19
\Rout1[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a27\,
	devoe => ww_devoe,
	o => ww_Rout1(27));

-- Location: IOOBUF_X56_Y0_N19
\Rout1[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a28\,
	devoe => ww_devoe,
	o => ww_Rout1(28));

-- Location: IOOBUF_X89_Y4_N62
\Rout1[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a29\,
	devoe => ww_devoe,
	o => ww_Rout1(29));

-- Location: IOOBUF_X68_Y0_N36
\Rout1[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a30\,
	devoe => ww_devoe,
	o => ww_Rout1(30));

-- Location: IOOBUF_X68_Y0_N19
\Rout1[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_0|auto_generated|ram_block1a31\,
	devoe => ww_devoe,
	o => ww_Rout1(31));

-- Location: IOOBUF_X26_Y0_N59
\Rout2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => ww_Rout2(0));

-- Location: IOOBUF_X2_Y0_N93
\Rout2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => ww_Rout2(1));

-- Location: IOOBUF_X32_Y0_N2
\Rout2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => ww_Rout2(2));

-- Location: IOOBUF_X36_Y0_N2
\Rout2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => ww_Rout2(3));

-- Location: IOOBUF_X36_Y0_N53
\Rout2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => ww_Rout2(4));

-- Location: IOOBUF_X32_Y0_N19
\Rout2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => ww_Rout2(5));

-- Location: IOOBUF_X38_Y0_N36
\Rout2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => ww_Rout2(6));

-- Location: IOOBUF_X89_Y6_N39
\Rout2[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => ww_Rout2(7));

-- Location: IOOBUF_X30_Y0_N19
\Rout2[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a8\,
	devoe => ww_devoe,
	o => ww_Rout2(8));

-- Location: IOOBUF_X32_Y0_N53
\Rout2[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a9\,
	devoe => ww_devoe,
	o => ww_Rout2(9));

-- Location: IOOBUF_X4_Y0_N36
\Rout2[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a10\,
	devoe => ww_devoe,
	o => ww_Rout2(10));

-- Location: IOOBUF_X28_Y0_N19
\Rout2[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a11\,
	devoe => ww_devoe,
	o => ww_Rout2(11));

-- Location: IOOBUF_X28_Y0_N36
\Rout2[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a12\,
	devoe => ww_devoe,
	o => ww_Rout2(12));

-- Location: IOOBUF_X28_Y0_N53
\Rout2[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a13\,
	devoe => ww_devoe,
	o => ww_Rout2(13));

-- Location: IOOBUF_X26_Y0_N93
\Rout2[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a14\,
	devoe => ww_devoe,
	o => ww_Rout2(14));

-- Location: IOOBUF_X4_Y0_N2
\Rout2[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a15\,
	devoe => ww_devoe,
	o => ww_Rout2(15));

-- Location: IOOBUF_X36_Y0_N19
\Rout2[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a16\,
	devoe => ww_devoe,
	o => ww_Rout2(16));

-- Location: IOOBUF_X6_Y0_N19
\Rout2[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a17\,
	devoe => ww_devoe,
	o => ww_Rout2(17));

-- Location: IOOBUF_X30_Y0_N2
\Rout2[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a18\,
	devoe => ww_devoe,
	o => ww_Rout2(18));

-- Location: IOOBUF_X26_Y0_N76
\Rout2[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a19\,
	devoe => ww_devoe,
	o => ww_Rout2(19));

-- Location: IOOBUF_X6_Y0_N53
\Rout2[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a20\,
	devoe => ww_devoe,
	o => ww_Rout2(20));

-- Location: IOOBUF_X34_Y0_N93
\Rout2[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a21\,
	devoe => ww_devoe,
	o => ww_Rout2(21));

-- Location: IOOBUF_X34_Y0_N76
\Rout2[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a22\,
	devoe => ww_devoe,
	o => ww_Rout2(22));

-- Location: IOOBUF_X30_Y0_N36
\Rout2[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a23\,
	devoe => ww_devoe,
	o => ww_Rout2(23));

-- Location: IOOBUF_X89_Y6_N5
\Rout2[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a24\,
	devoe => ww_devoe,
	o => ww_Rout2(24));

-- Location: IOOBUF_X34_Y0_N59
\Rout2[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a25\,
	devoe => ww_devoe,
	o => ww_Rout2(25));

-- Location: IOOBUF_X30_Y0_N53
\Rout2[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a26\,
	devoe => ww_devoe,
	o => ww_Rout2(26));

-- Location: IOOBUF_X32_Y0_N36
\Rout2[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a27\,
	devoe => ww_devoe,
	o => ww_Rout2(27));

-- Location: IOOBUF_X34_Y0_N42
\Rout2[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a28\,
	devoe => ww_devoe,
	o => ww_Rout2(28));

-- Location: IOOBUF_X6_Y0_N36
\Rout2[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a29\,
	devoe => ww_devoe,
	o => ww_Rout2(29));

-- Location: IOOBUF_X6_Y0_N2
\Rout2[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a30\,
	devoe => ww_devoe,
	o => ww_Rout2(30));

-- Location: IOOBUF_X2_Y0_N42
\Rout2[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rgFile_rtl_1|auto_generated|ram_block1a31\,
	devoe => ww_devoe,
	o => ww_Rout2(31));

-- Location: IOIBUF_X52_Y0_N52
\WB~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WB,
	o => \WB~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X52_Y0_N18
\Value[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(0),
	o => \Value[0]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\Rdst[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rdst(0),
	o => \Rdst[0]~input_o\);

-- Location: IOIBUF_X54_Y0_N35
\Rdst[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rdst(1),
	o => \Rdst[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N52
\Rdst[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rdst(2),
	o => \Rdst[2]~input_o\);

-- Location: IOIBUF_X66_Y0_N41
\Rsrc1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rsrc1(0),
	o => \Rsrc1[0]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\Rsrc1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rsrc1(1),
	o => \Rsrc1[1]~input_o\);

-- Location: IOIBUF_X66_Y0_N92
\Rsrc1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rsrc1(2),
	o => \Rsrc1[2]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\Value[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(1),
	o => \Value[1]~input_o\);

-- Location: IOIBUF_X50_Y0_N41
\Value[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(2),
	o => \Value[2]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\Value[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(3),
	o => \Value[3]~input_o\);

-- Location: IOIBUF_X72_Y0_N1
\Value[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(4),
	o => \Value[4]~input_o\);

-- Location: IOIBUF_X72_Y0_N18
\Value[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(5),
	o => \Value[5]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\Value[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(6),
	o => \Value[6]~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\Value[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(7),
	o => \Value[7]~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\Value[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(8),
	o => \Value[8]~input_o\);

-- Location: IOIBUF_X50_Y0_N75
\Value[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(9),
	o => \Value[9]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\Value[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(10),
	o => \Value[10]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\Value[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(11),
	o => \Value[11]~input_o\);

-- Location: IOIBUF_X54_Y0_N52
\Value[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(12),
	o => \Value[12]~input_o\);

-- Location: IOIBUF_X40_Y0_N18
\Value[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(13),
	o => \Value[13]~input_o\);

-- Location: IOIBUF_X72_Y0_N52
\Value[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(14),
	o => \Value[14]~input_o\);

-- Location: IOIBUF_X8_Y0_N18
\Value[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(15),
	o => \Value[15]~input_o\);

-- Location: IOIBUF_X2_Y0_N75
\Value[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(16),
	o => \Value[16]~input_o\);

-- Location: IOIBUF_X54_Y0_N18
\Value[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(17),
	o => \Value[17]~input_o\);

-- Location: IOIBUF_X50_Y0_N92
\Value[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(18),
	o => \Value[18]~input_o\);

-- Location: IOIBUF_X2_Y0_N58
\Value[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(19),
	o => \Value[19]~input_o\);

-- Location: IOIBUF_X89_Y8_N38
\Value[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(20),
	o => \Value[20]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\Value[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(21),
	o => \Value[21]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\Value[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(22),
	o => \Value[22]~input_o\);

-- Location: IOIBUF_X38_Y0_N52
\Value[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(23),
	o => \Value[23]~input_o\);

-- Location: IOIBUF_X40_Y0_N35
\Value[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(24),
	o => \Value[24]~input_o\);

-- Location: IOIBUF_X8_Y0_N52
\Value[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(25),
	o => \Value[25]~input_o\);

-- Location: IOIBUF_X38_Y0_N18
\Value[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(26),
	o => \Value[26]~input_o\);

-- Location: IOIBUF_X56_Y0_N35
\Value[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(27),
	o => \Value[27]~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\Value[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(28),
	o => \Value[28]~input_o\);

-- Location: IOIBUF_X89_Y6_N55
\Value[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(29),
	o => \Value[29]~input_o\);

-- Location: IOIBUF_X50_Y0_N58
\Value[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(30),
	o => \Value[30]~input_o\);

-- Location: IOIBUF_X8_Y0_N1
\Value[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Value(31),
	o => \Value[31]~input_o\);

-- Location: M10K_X58_Y2_N0
\rgFile_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU.ram0_RegisterFile_878b6b30.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:rgFile_rtl_0|altsyncram_cpn1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 3,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 7,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 3,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 7,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \WB~input_o\,
	portbre => VCC,
	clk0 => \ALT_INV_clk~inputCLKENA0_outclk\,
	clk1 => \clk~inputCLKENA0_outclk\,
	portadatain => \rgFile_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \rgFile_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \rgFile_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X4_Y0_N52
\Rsrc2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rsrc2(0),
	o => \Rsrc2[0]~input_o\);

-- Location: IOIBUF_X26_Y0_N41
\Rsrc2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rsrc2(1),
	o => \Rsrc2[1]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\Rsrc2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rsrc2(2),
	o => \Rsrc2[2]~input_o\);

-- Location: M10K_X38_Y2_N0
\rgFile_rtl_1|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU.ram0_RegisterFile_878b6b30.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:rgFile_rtl_1|altsyncram_cpn1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 3,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 7,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 3,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 7,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \WB~input_o\,
	portbre => VCC,
	clk0 => \ALT_INV_clk~inputCLKENA0_outclk\,
	clk1 => \clk~inputCLKENA0_outclk\,
	portadatain => \rgFile_rtl_1|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \rgFile_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \rgFile_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LABCELL_X53_Y51_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


