// ==============================================================
// Generated by Vitis HLS v2023.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="wsrsa1024_wsrsa1024,hls_ip_2023_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.184660,HLS_SYN_LAT=2106048,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=38080,HLS_SYN_LUT=43965,HLS_VERSION=2023_1}" *)

module wsrsa1024 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        privexp_address0,
        privexp_ce0,
        privexp_q0,
        mode,
        base_r,
        publexp,
        modulus,
        result,
        result_ap_vld
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] privexp_address0;
output   privexp_ce0;
input  [31:0] privexp_q0;
input  [31:0] mode;
input  [1023:0] base_r;
input  [1023:0] publexp;
input  [1023:0] modulus;
output  [1023:0] result;
output   result_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[1023:0] result;
reg result_ap_vld;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [1023:0] priv;
wire   [31:0] mode_read_read_fu_70_p2;
reg   [1023:0] priv_load_reg_143;
wire    grp_rsaModExp_fu_84_ap_start;
wire    grp_rsaModExp_fu_84_ap_done;
wire    grp_rsaModExp_fu_84_ap_idle;
wire    grp_rsaModExp_fu_84_ap_ready;
reg   [1023:0] grp_rsaModExp_fu_84_e_val;
wire   [1023:0] grp_rsaModExp_fu_84_ap_return;
wire    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start;
wire    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done;
wire    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_idle;
wire    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_ready;
wire   [4:0] grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_address0;
wire    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_ce0;
wire   [1023:0] grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out;
wire    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out_ap_vld;
reg    grp_rsaModExp_fu_84_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state5;
reg    grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 priv = 1024'd0;
#0 grp_rsaModExp_fu_84_ap_start_reg = 1'b0;
#0 grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg = 1'b0;
end

wsrsa1024_rsaModExp grp_rsaModExp_fu_84(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_rsaModExp_fu_84_ap_start),
    .ap_done(grp_rsaModExp_fu_84_ap_done),
    .ap_idle(grp_rsaModExp_fu_84_ap_idle),
    .ap_ready(grp_rsaModExp_fu_84_ap_ready),
    .M_val(base_r),
    .e_val(grp_rsaModExp_fu_84_e_val),
    .n_val(modulus),
    .ap_return(grp_rsaModExp_fu_84_ap_return)
);

wsrsa1024_wsrsa1024_Pipeline_VITIS_LOOP_18_1 grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start),
    .ap_done(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done),
    .ap_idle(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_idle),
    .ap_ready(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_ready),
    .priv_load(priv),
    .privexp_address0(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_address0),
    .privexp_ce0(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_ce0),
    .privexp_q0(privexp_q0),
    .shr_i_i_i3_out(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out),
    .shr_i_i_i3_out_ap_vld(grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out_ap_vld)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_rsaModExp_fu_84_ap_start_reg <= 1'b0;
    end else begin
        if (((~(mode_read_read_fu_70_p2 == 32'd2) & ~(mode_read_read_fu_70_p2 == 32'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((mode_read_read_fu_70_p2 == 32'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
            grp_rsaModExp_fu_84_ap_start_reg <= 1'b1;
        end else if ((grp_rsaModExp_fu_84_ap_ready == 1'b1)) begin
            grp_rsaModExp_fu_84_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg <= 1'b0;
    end else begin
        if (((mode_read_read_fu_70_p2 == 32'd2) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg <= 1'b1;
        end else if ((grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_ready == 1'b1)) begin
            grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((mode_read_read_fu_70_p2 == 32'd2) & (1'b1 == ap_CS_fsm_state4))) begin
        priv <= grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_shr_i_i_i3_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        priv_load_reg_143 <= priv;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_rsaModExp_fu_84_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_rsaModExp_fu_84_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_rsaModExp_fu_84_e_val = priv_load_reg_143;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_rsaModExp_fu_84_e_val = publexp;
    end else begin
        grp_rsaModExp_fu_84_e_val = 'bx;
    end
end

always @ (*) begin
    if (((mode_read_read_fu_70_p2 == 32'd2) & (1'b1 == ap_CS_fsm_state4))) begin
        result = 1024'd0;
    end else if ((((grp_rsaModExp_fu_84_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((grp_rsaModExp_fu_84_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        result = grp_rsaModExp_fu_84_ap_return;
    end else begin
        result = 'bx;
    end
end

always @ (*) begin
    if ((((mode_read_read_fu_70_p2 == 32'd2) & (1'b1 == ap_CS_fsm_state4)) | ((grp_rsaModExp_fu_84_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((grp_rsaModExp_fu_84_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        result_ap_vld = 1'b1;
    end else begin
        result_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~(mode_read_read_fu_70_p2 == 32'd2) & ~(mode_read_read_fu_70_p2 == 32'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if (((mode_read_read_fu_70_p2 == 32'd2) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if (((mode_read_read_fu_70_p2 == 32'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_rsaModExp_fu_84_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_rsaModExp_fu_84_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign grp_rsaModExp_fu_84_ap_start = grp_rsaModExp_fu_84_ap_start_reg;

assign grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start = grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_ap_start_reg;

assign mode_read_read_fu_70_p2 = mode;

assign privexp_address0 = grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_address0;

assign privexp_ce0 = grp_wsrsa1024_Pipeline_VITIS_LOOP_18_1_fu_95_privexp_ce0;

endmodule //wsrsa1024
