-- ==============================================================
-- Generated by Vitis HLS v2023.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity wsrsa1024 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    privexp_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    privexp_ce0 : OUT STD_LOGIC;
    privexp_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    mode : IN STD_LOGIC_VECTOR (31 downto 0);
    base_r : IN STD_LOGIC_VECTOR (1023 downto 0);
    publexp : IN STD_LOGIC_VECTOR (1023 downto 0);
    modulus : IN STD_LOGIC_VECTOR (1023 downto 0);
    result : OUT STD_LOGIC_VECTOR (1023 downto 0);
    result_ap_vld : OUT STD_LOGIC );
end;


architecture behav of wsrsa1024 is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "wsrsa1024_wsrsa1024,hls_ip_2023_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.184660,HLS_SYN_LAT=2106048,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=38080,HLS_SYN_LUT=43965,HLS_VERSION=2023_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1024_lc_1 : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal priv : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal mode_read_read_fu_70_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal priv_load_reg_143 : STD_LOGIC_VECTOR (1023 downto 0);
    signal grp_rsaModExp_fu_84_ap_start : STD_LOGIC;
    signal grp_rsaModExp_fu_84_ap_done : STD_LOGIC;
    signal grp_rsaModExp_fu_84_ap_idle : STD_LOGIC;
    signal grp_rsaModExp_fu_84_ap_ready : STD_LOGIC;
    signal grp_rsaModExp_fu_84_e_val : STD_LOGIC_VECTOR (1023 downto 0);
    signal grp_rsaModExp_fu_84_ap_return : STD_LOGIC_VECTOR (1023 downto 0);
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start : STD_LOGIC;
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done : STD_LOGIC;
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_idle : STD_LOGIC;
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_ready : STD_LOGIC;
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_ce0 : STD_LOGIC;
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out : STD_LOGIC_VECTOR (1023 downto 0);
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out_ap_vld : STD_LOGIC;
    signal grp_rsaModExp_fu_84_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component wsrsa1024_rsaModExp IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        M_val : IN STD_LOGIC_VECTOR (1023 downto 0);
        e_val : IN STD_LOGIC_VECTOR (1023 downto 0);
        n_val : IN STD_LOGIC_VECTOR (1023 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (1023 downto 0) );
    end component;


    component wsrsa1024_wsrsa1024_Pipeline_VITIS_LOOP_18_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        priv_load : IN STD_LOGIC_VECTOR (1023 downto 0);
        privexp_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        privexp_ce0 : OUT STD_LOGIC;
        privexp_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        shr_i_i_i3_out : OUT STD_LOGIC_VECTOR (1023 downto 0);
        shr_i_i_i3_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_rsaModExp_fu_84 : component wsrsa1024_rsaModExp
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_rsaModExp_fu_84_ap_start,
        ap_done => grp_rsaModExp_fu_84_ap_done,
        ap_idle => grp_rsaModExp_fu_84_ap_idle,
        ap_ready => grp_rsaModExp_fu_84_ap_ready,
        M_val => base_r,
        e_val => grp_rsaModExp_fu_84_e_val,
        n_val => modulus,
        ap_return => grp_rsaModExp_fu_84_ap_return);

    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95 : component wsrsa1024_wsrsa1024_Pipeline_VITIS_LOOP_18_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start,
        ap_done => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done,
        ap_idle => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_idle,
        ap_ready => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_ready,
        priv_load => priv,
        privexp_address0 => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_address0,
        privexp_ce0 => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_ce0,
        privexp_q0 => privexp_q0,
        shr_i_i_i3_out => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out,
        shr_i_i_i3_out_ap_vld => grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out_ap_vld);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_rsaModExp_fu_84_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_rsaModExp_fu_84_ap_start_reg <= ap_const_logic_0;
            else
                if (((not((mode_read_read_fu_70_p2 = ap_const_lv32_2)) and not((mode_read_read_fu_70_p2 = ap_const_lv32_0)) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1)) or ((mode_read_read_fu_70_p2 = ap_const_lv32_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1)))) then 
                    grp_rsaModExp_fu_84_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_rsaModExp_fu_84_ap_ready = ap_const_logic_1)) then 
                    grp_rsaModExp_fu_84_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg <= ap_const_logic_0;
            else
                if (((mode_read_read_fu_70_p2 = ap_const_lv32_2) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_ready = ap_const_logic_1)) then 
                    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((mode_read_read_fu_70_p2 = ap_const_lv32_2) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                priv <= grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                priv_load_reg_143 <= priv;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, mode_read_read_fu_70_p2, grp_rsaModExp_fu_84_ap_done, grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not((mode_read_read_fu_70_p2 = ap_const_lv32_2)) and not((mode_read_read_fu_70_p2 = ap_const_lv32_0)) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                elsif (((mode_read_read_fu_70_p2 = ap_const_lv32_2) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                elsif (((mode_read_read_fu_70_p2 = ap_const_lv32_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_rsaModExp_fu_84_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when ap_ST_fsm_state5 => 
                if (((grp_rsaModExp_fu_84_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_rsaModExp_fu_84_ap_done)
    begin
        if ((grp_rsaModExp_fu_84_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done)
    begin
        if ((grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_rsaModExp_fu_84_ap_done)
    begin
        if ((grp_rsaModExp_fu_84_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_rsaModExp_fu_84_ap_start <= grp_rsaModExp_fu_84_ap_start_reg;

    grp_rsaModExp_fu_84_e_val_assign_proc : process(publexp, priv_load_reg_143, ap_CS_fsm_state2, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_rsaModExp_fu_84_e_val <= priv_load_reg_143;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_rsaModExp_fu_84_e_val <= publexp;
        else 
            grp_rsaModExp_fu_84_e_val <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start <= grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg;
    mode_read_read_fu_70_p2 <= mode;
    privexp_address0 <= grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_address0;
    privexp_ce0 <= grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_ce0;

    result_assign_proc : process(mode_read_read_fu_70_p2, grp_rsaModExp_fu_84_ap_done, grp_rsaModExp_fu_84_ap_return, ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state4)
    begin
        if (((mode_read_read_fu_70_p2 = ap_const_lv32_2) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            result <= ap_const_lv1024_lc_1;
        elsif ((((grp_rsaModExp_fu_84_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5)) or ((grp_rsaModExp_fu_84_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            result <= grp_rsaModExp_fu_84_ap_return;
        else 
            result <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    result_ap_vld_assign_proc : process(mode_read_read_fu_70_p2, grp_rsaModExp_fu_84_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state4)
    begin
        if ((((mode_read_read_fu_70_p2 = ap_const_lv32_2) and (ap_const_logic_1 = ap_CS_fsm_state4)) or ((grp_rsaModExp_fu_84_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5)) or ((grp_rsaModExp_fu_84_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            result_ap_vld <= ap_const_logic_1;
        else 
            result_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;
