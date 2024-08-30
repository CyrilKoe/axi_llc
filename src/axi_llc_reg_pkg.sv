// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package axi_llc_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 8;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_spm_low_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_spm_high_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_flush_low_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_flush_high_reg_t;

  typedef struct packed {
    logic        q;
  } axi_llc_reg2hw_commit_cfg_reg_t;

  typedef struct packed {
    logic        q;
  } axi_llc_reg2hw_bypass_en_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_flushed_low_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_flushed_high_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_flush_partition_low_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_flush_partition_high_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_set_partition_low_mreg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_cfg_set_partition_high_mreg_t;

  typedef struct packed {
    logic        q;
  } axi_llc_reg2hw_commit_partition_cfg_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_flushed_set_low_mreg_t;

  typedef struct packed {
    logic [31:0] q;
  } axi_llc_reg2hw_flushed_set_high_mreg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_spm_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_spm_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_flush_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_flush_high_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } axi_llc_hw2reg_commit_cfg_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_flushed_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_flushed_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_bist_out_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_bist_out_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_set_asso_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_set_asso_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_num_lines_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_num_lines_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_num_blocks_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_num_blocks_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_version_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_version_high_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } axi_llc_hw2reg_bist_status_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_flush_partition_low_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_flush_partition_high_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_set_partition_low_mreg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_cfg_set_partition_high_mreg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } axi_llc_hw2reg_commit_partition_cfg_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_flushed_set_low_mreg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } axi_llc_hw2reg_flushed_set_high_mreg_t;

  // Register -> HW type
  typedef struct packed {
    axi_llc_reg2hw_cfg_spm_low_reg_t cfg_spm_low; // [642:611]
    axi_llc_reg2hw_cfg_spm_high_reg_t cfg_spm_high; // [610:579]
    axi_llc_reg2hw_cfg_flush_low_reg_t cfg_flush_low; // [578:547]
    axi_llc_reg2hw_cfg_flush_high_reg_t cfg_flush_high; // [546:515]
    axi_llc_reg2hw_commit_cfg_reg_t commit_cfg; // [514:514]
    axi_llc_reg2hw_bypass_en_reg_t bypass_en; // [513:513]
    axi_llc_reg2hw_flushed_low_reg_t flushed_low; // [512:481]
    axi_llc_reg2hw_flushed_high_reg_t flushed_high; // [480:449]
    axi_llc_reg2hw_cfg_flush_partition_low_reg_t cfg_flush_partition_low; // [448:417]
    axi_llc_reg2hw_cfg_flush_partition_high_reg_t cfg_flush_partition_high; // [416:385]
    axi_llc_reg2hw_cfg_set_partition_low_mreg_t [1:0] cfg_set_partition_low; // [384:321]
    axi_llc_reg2hw_cfg_set_partition_high_mreg_t [1:0] cfg_set_partition_high; // [320:257]
    axi_llc_reg2hw_commit_partition_cfg_reg_t commit_partition_cfg; // [256:256]
    axi_llc_reg2hw_flushed_set_low_mreg_t [3:0] flushed_set_low; // [255:128]
    axi_llc_reg2hw_flushed_set_high_mreg_t [3:0] flushed_set_high; // [127:0]
  } axi_llc_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    axi_llc_hw2reg_cfg_spm_low_reg_t cfg_spm_low; // [995:963]
    axi_llc_hw2reg_cfg_spm_high_reg_t cfg_spm_high; // [962:930]
    axi_llc_hw2reg_cfg_flush_low_reg_t cfg_flush_low; // [929:897]
    axi_llc_hw2reg_cfg_flush_high_reg_t cfg_flush_high; // [896:864]
    axi_llc_hw2reg_commit_cfg_reg_t commit_cfg; // [863:862]
    axi_llc_hw2reg_flushed_low_reg_t flushed_low; // [861:829]
    axi_llc_hw2reg_flushed_high_reg_t flushed_high; // [828:796]
    axi_llc_hw2reg_bist_out_low_reg_t bist_out_low; // [795:763]
    axi_llc_hw2reg_bist_out_high_reg_t bist_out_high; // [762:730]
    axi_llc_hw2reg_set_asso_low_reg_t set_asso_low; // [729:697]
    axi_llc_hw2reg_set_asso_high_reg_t set_asso_high; // [696:664]
    axi_llc_hw2reg_num_lines_low_reg_t num_lines_low; // [663:631]
    axi_llc_hw2reg_num_lines_high_reg_t num_lines_high; // [630:598]
    axi_llc_hw2reg_num_blocks_low_reg_t num_blocks_low; // [597:565]
    axi_llc_hw2reg_num_blocks_high_reg_t num_blocks_high; // [564:532]
    axi_llc_hw2reg_version_low_reg_t version_low; // [531:499]
    axi_llc_hw2reg_version_high_reg_t version_high; // [498:466]
    axi_llc_hw2reg_bist_status_reg_t bist_status; // [465:464]
    axi_llc_hw2reg_cfg_flush_partition_low_reg_t cfg_flush_partition_low; // [463:431]
    axi_llc_hw2reg_cfg_flush_partition_high_reg_t cfg_flush_partition_high; // [430:398]
    axi_llc_hw2reg_cfg_set_partition_low_mreg_t [1:0] cfg_set_partition_low; // [397:332]
    axi_llc_hw2reg_cfg_set_partition_high_mreg_t [1:0] cfg_set_partition_high; // [331:266]
    axi_llc_hw2reg_commit_partition_cfg_reg_t commit_partition_cfg; // [265:264]
    axi_llc_hw2reg_flushed_set_low_mreg_t [3:0] flushed_set_low; // [263:132]
    axi_llc_hw2reg_flushed_set_high_mreg_t [3:0] flushed_set_high; // [131:0]
  } axi_llc_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_SPM_LOW_OFFSET = 8'h 0;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_SPM_HIGH_OFFSET = 8'h 4;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_FLUSH_LOW_OFFSET = 8'h 8;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_FLUSH_HIGH_OFFSET = 8'h c;
  parameter logic [BlockAw-1:0] AXI_LLC_COMMIT_CFG_OFFSET = 8'h 10;
  parameter logic [BlockAw-1:0] AXI_LLC_BYPASS_EN_OFFSET = 8'h 14;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_LOW_OFFSET = 8'h 18;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_HIGH_OFFSET = 8'h 1c;
  parameter logic [BlockAw-1:0] AXI_LLC_BIST_OUT_LOW_OFFSET = 8'h 20;
  parameter logic [BlockAw-1:0] AXI_LLC_BIST_OUT_HIGH_OFFSET = 8'h 24;
  parameter logic [BlockAw-1:0] AXI_LLC_SET_ASSO_LOW_OFFSET = 8'h 28;
  parameter logic [BlockAw-1:0] AXI_LLC_SET_ASSO_HIGH_OFFSET = 8'h 2c;
  parameter logic [BlockAw-1:0] AXI_LLC_NUM_LINES_LOW_OFFSET = 8'h 30;
  parameter logic [BlockAw-1:0] AXI_LLC_NUM_LINES_HIGH_OFFSET = 8'h 34;
  parameter logic [BlockAw-1:0] AXI_LLC_NUM_BLOCKS_LOW_OFFSET = 8'h 38;
  parameter logic [BlockAw-1:0] AXI_LLC_NUM_BLOCKS_HIGH_OFFSET = 8'h 3c;
  parameter logic [BlockAw-1:0] AXI_LLC_VERSION_LOW_OFFSET = 8'h 40;
  parameter logic [BlockAw-1:0] AXI_LLC_VERSION_HIGH_OFFSET = 8'h 44;
  parameter logic [BlockAw-1:0] AXI_LLC_BIST_STATUS_OFFSET = 8'h 48;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_FLUSH_PARTITION_LOW_OFFSET = 8'h 4c;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_FLUSH_PARTITION_HIGH_OFFSET = 8'h 50;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_SET_PARTITION_LOW_0_OFFSET = 8'h 54;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_SET_PARTITION_LOW_1_OFFSET = 8'h 58;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_SET_PARTITION_HIGH_0_OFFSET = 8'h 5c;
  parameter logic [BlockAw-1:0] AXI_LLC_CFG_SET_PARTITION_HIGH_1_OFFSET = 8'h 60;
  parameter logic [BlockAw-1:0] AXI_LLC_COMMIT_PARTITION_CFG_OFFSET = 8'h 64;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_LOW_0_OFFSET = 8'h 6c;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_LOW_1_OFFSET = 8'h 70;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_LOW_2_OFFSET = 8'h 74;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_LOW_3_OFFSET = 8'h 78;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_HIGH_0_OFFSET = 8'h 7c;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_HIGH_1_OFFSET = 8'h 80;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_HIGH_2_OFFSET = 8'h 84;
  parameter logic [BlockAw-1:0] AXI_LLC_FLUSHED_SET_HIGH_3_OFFSET = 8'h 88;

  // Register index
  typedef enum int {
    AXI_LLC_CFG_SPM_LOW,
    AXI_LLC_CFG_SPM_HIGH,
    AXI_LLC_CFG_FLUSH_LOW,
    AXI_LLC_CFG_FLUSH_HIGH,
    AXI_LLC_COMMIT_CFG,
    AXI_LLC_BYPASS_EN,
    AXI_LLC_FLUSHED_LOW,
    AXI_LLC_FLUSHED_HIGH,
    AXI_LLC_BIST_OUT_LOW,
    AXI_LLC_BIST_OUT_HIGH,
    AXI_LLC_SET_ASSO_LOW,
    AXI_LLC_SET_ASSO_HIGH,
    AXI_LLC_NUM_LINES_LOW,
    AXI_LLC_NUM_LINES_HIGH,
    AXI_LLC_NUM_BLOCKS_LOW,
    AXI_LLC_NUM_BLOCKS_HIGH,
    AXI_LLC_VERSION_LOW,
    AXI_LLC_VERSION_HIGH,
    AXI_LLC_BIST_STATUS,
    AXI_LLC_CFG_FLUSH_PARTITION_LOW,
    AXI_LLC_CFG_FLUSH_PARTITION_HIGH,
    AXI_LLC_CFG_SET_PARTITION_LOW_0,
    AXI_LLC_CFG_SET_PARTITION_LOW_1,
    AXI_LLC_CFG_SET_PARTITION_HIGH_0,
    AXI_LLC_CFG_SET_PARTITION_HIGH_1,
    AXI_LLC_COMMIT_PARTITION_CFG,
    AXI_LLC_FLUSHED_SET_LOW_0,
    AXI_LLC_FLUSHED_SET_LOW_1,
    AXI_LLC_FLUSHED_SET_LOW_2,
    AXI_LLC_FLUSHED_SET_LOW_3,
    AXI_LLC_FLUSHED_SET_HIGH_0,
    AXI_LLC_FLUSHED_SET_HIGH_1,
    AXI_LLC_FLUSHED_SET_HIGH_2,
    AXI_LLC_FLUSHED_SET_HIGH_3
  } axi_llc_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] AXI_LLC_PERMIT [34] = '{
    4'b 1111, // index[ 0] AXI_LLC_CFG_SPM_LOW
    4'b 1111, // index[ 1] AXI_LLC_CFG_SPM_HIGH
    4'b 1111, // index[ 2] AXI_LLC_CFG_FLUSH_LOW
    4'b 1111, // index[ 3] AXI_LLC_CFG_FLUSH_HIGH
    4'b 0001, // index[ 4] AXI_LLC_COMMIT_CFG
    4'b 0001, // index[ 5] AXI_LLC_BYPASS_EN
    4'b 1111, // index[ 6] AXI_LLC_FLUSHED_LOW
    4'b 1111, // index[ 7] AXI_LLC_FLUSHED_HIGH
    4'b 1111, // index[ 8] AXI_LLC_BIST_OUT_LOW
    4'b 1111, // index[ 9] AXI_LLC_BIST_OUT_HIGH
    4'b 1111, // index[10] AXI_LLC_SET_ASSO_LOW
    4'b 1111, // index[11] AXI_LLC_SET_ASSO_HIGH
    4'b 1111, // index[12] AXI_LLC_NUM_LINES_LOW
    4'b 1111, // index[13] AXI_LLC_NUM_LINES_HIGH
    4'b 1111, // index[14] AXI_LLC_NUM_BLOCKS_LOW
    4'b 1111, // index[15] AXI_LLC_NUM_BLOCKS_HIGH
    4'b 1111, // index[16] AXI_LLC_VERSION_LOW
    4'b 1111, // index[17] AXI_LLC_VERSION_HIGH
    4'b 0001, // index[18] AXI_LLC_BIST_STATUS
    4'b 1111, // index[19] AXI_LLC_CFG_FLUSH_PARTITION_LOW
    4'b 1111, // index[20] AXI_LLC_CFG_FLUSH_PARTITION_HIGH
    4'b 1111, // index[21] AXI_LLC_CFG_SET_PARTITION_LOW_0
    4'b 1111, // index[22] AXI_LLC_CFG_SET_PARTITION_LOW_1
    4'b 1111, // index[23] AXI_LLC_CFG_SET_PARTITION_HIGH_0
    4'b 1111, // index[24] AXI_LLC_CFG_SET_PARTITION_HIGH_1
    4'b 0001, // index[25] AXI_LLC_COMMIT_PARTITION_CFG
    4'b 1111, // index[26] AXI_LLC_FLUSHED_SET_LOW_0
    4'b 1111, // index[27] AXI_LLC_FLUSHED_SET_LOW_1
    4'b 1111, // index[28] AXI_LLC_FLUSHED_SET_LOW_2
    4'b 1111, // index[29] AXI_LLC_FLUSHED_SET_LOW_3
    4'b 1111, // index[30] AXI_LLC_FLUSHED_SET_HIGH_0
    4'b 1111, // index[31] AXI_LLC_FLUSHED_SET_HIGH_1
    4'b 1111, // index[32] AXI_LLC_FLUSHED_SET_HIGH_2
    4'b 1111  // index[33] AXI_LLC_FLUSHED_SET_HIGH_3
  };

endpackage

