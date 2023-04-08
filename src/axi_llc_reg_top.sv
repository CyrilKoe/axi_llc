// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`


`include "common_cells/assertions.svh"

module axi_llc_reg_top #(
    parameter type reg_req_t = logic,
    parameter type reg_rsp_t = logic,
    parameter int AW = 8
) (
  input clk_i,
  input rst_ni,
  input  reg_req_t reg_req_i,
  output reg_rsp_t reg_rsp_o,
  // To HW
  output axi_llc_reg_pkg::axi_llc_reg2hw_t reg2hw, // Write
  input  axi_llc_reg_pkg::axi_llc_hw2reg_t hw2reg, // Read


  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import axi_llc_reg_pkg::* ;

  localparam int DW = 32;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  // Below register interface can be changed
  reg_req_t  reg_intf_req;
  reg_rsp_t  reg_intf_rsp;


  assign reg_intf_req = reg_req_i;
  assign reg_rsp_o = reg_intf_rsp;


  assign reg_we = reg_intf_req.valid & reg_intf_req.write;
  assign reg_re = reg_intf_req.valid & ~reg_intf_req.write;
  assign reg_addr = reg_intf_req.addr;
  assign reg_wdata = reg_intf_req.wdata;
  assign reg_be = reg_intf_req.wstrb;
  assign reg_intf_rsp.rdata = reg_rdata;
  assign reg_intf_rsp.error = reg_error;
  assign reg_intf_rsp.ready = 1'b1;

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err;


  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic [31:0] cfg_spm_low_qs;
  logic [31:0] cfg_spm_low_wd;
  logic cfg_spm_low_we;
  logic [31:0] cfg_spm_high_qs;
  logic [31:0] cfg_spm_high_wd;
  logic cfg_spm_high_we;
  logic [31:0] cfg_flush_low_qs;
  logic [31:0] cfg_flush_low_wd;
  logic cfg_flush_low_we;
  logic [31:0] cfg_flush_high_qs;
  logic [31:0] cfg_flush_high_wd;
  logic cfg_flush_high_we;
  logic [31:0] cfg_flush_set0_low_qs;
  logic [31:0] cfg_flush_set0_low_wd;
  logic cfg_flush_set0_low_we;
  logic [31:0] cfg_flush_set0_high_qs;
  logic [31:0] cfg_flush_set0_high_wd;
  logic cfg_flush_set0_high_we;
  logic [31:0] cfg_set_partition0_low_qs;
  logic [31:0] cfg_set_partition0_low_wd;
  logic cfg_set_partition0_low_we;
  logic [31:0] cfg_set_partition0_high_qs;
  logic [31:0] cfg_set_partition0_high_wd;
  logic cfg_set_partition0_high_we;
  logic [31:0] cfg_set_partition1_low_qs;
  logic [31:0] cfg_set_partition1_low_wd;
  logic cfg_set_partition1_low_we;
  logic [31:0] cfg_set_partition1_high_qs;
  logic [31:0] cfg_set_partition1_high_wd;
  logic cfg_set_partition1_high_we;
  logic [31:0] cfg_set_partition2_low_qs;
  logic [31:0] cfg_set_partition2_low_wd;
  logic cfg_set_partition2_low_we;
  logic [31:0] cfg_set_partition2_high_qs;
  logic [31:0] cfg_set_partition2_high_wd;
  logic cfg_set_partition2_high_we;
  logic [31:0] cfg_set_partition3_low_qs;
  logic [31:0] cfg_set_partition3_low_wd;
  logic cfg_set_partition3_low_we;
  logic [31:0] cfg_set_partition3_high_qs;
  logic [31:0] cfg_set_partition3_high_wd;
  logic cfg_set_partition3_high_we;
  logic [31:0] cfg_set_partition4_low_qs;
  logic [31:0] cfg_set_partition4_low_wd;
  logic cfg_set_partition4_low_we;
  logic [31:0] cfg_set_partition4_high_qs;
  logic [31:0] cfg_set_partition4_high_wd;
  logic cfg_set_partition4_high_we;
  logic [31:0] cfg_set_partition5_low_qs;
  logic [31:0] cfg_set_partition5_low_wd;
  logic cfg_set_partition5_low_we;
  logic [31:0] cfg_set_partition5_high_qs;
  logic [31:0] cfg_set_partition5_high_wd;
  logic cfg_set_partition5_high_we;
  logic [31:0] cfg_set_partition6_low_qs;
  logic [31:0] cfg_set_partition6_low_wd;
  logic cfg_set_partition6_low_we;
  logic [31:0] cfg_set_partition6_high_qs;
  logic [31:0] cfg_set_partition6_high_wd;
  logic cfg_set_partition6_high_we;
  logic commit_cfg_qs;
  logic commit_cfg_wd;
  logic commit_cfg_we;
  logic commit_partition_cfg_qs;
  logic commit_partition_cfg_wd;
  logic commit_partition_cfg_we;
  logic [31:0] flushed_low_qs;
  logic [31:0] flushed_high_qs;
  logic [31:0] bist_out_low_qs;
  logic [31:0] bist_out_high_qs;
  logic [31:0] set_asso_low_qs;
  logic [31:0] set_asso_high_qs;
  logic [31:0] num_lines_low_qs;
  logic [31:0] num_lines_high_qs;
  logic [31:0] num_blocks_low_qs;
  logic [31:0] num_blocks_high_qs;
  logic [31:0] version_low_qs;
  logic [31:0] version_high_qs;
  logic [31:0] flushed_set0_low_qs;
  logic [31:0] flushed_set0_high_qs;

  // Register instances
  // R[cfg_spm_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_spm_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_spm_low_we),
    .wd     (cfg_spm_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_spm_low.de),
    .d      (hw2reg.cfg_spm_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_spm_low.q ),

    // to register interface (read)
    .qs     (cfg_spm_low_qs)
  );


  // R[cfg_spm_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_spm_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_spm_high_we),
    .wd     (cfg_spm_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_spm_high.de),
    .d      (hw2reg.cfg_spm_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_spm_high.q ),

    // to register interface (read)
    .qs     (cfg_spm_high_qs)
  );


  // R[cfg_flush_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_flush_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_flush_low_we),
    .wd     (cfg_flush_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_flush_low.de),
    .d      (hw2reg.cfg_flush_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_flush_low.q ),

    // to register interface (read)
    .qs     (cfg_flush_low_qs)
  );


  // R[cfg_flush_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_flush_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_flush_high_we),
    .wd     (cfg_flush_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_flush_high.de),
    .d      (hw2reg.cfg_flush_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_flush_high.q ),

    // to register interface (read)
    .qs     (cfg_flush_high_qs)
  );


  // R[cfg_flush_set0_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_flush_set0_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_flush_set0_low_we),
    .wd     (cfg_flush_set0_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_flush_set0_low.de),
    .d      (hw2reg.cfg_flush_set0_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_flush_set0_low.q ),

    // to register interface (read)
    .qs     (cfg_flush_set0_low_qs)
  );


  // R[cfg_flush_set0_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_flush_set0_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_flush_set0_high_we),
    .wd     (cfg_flush_set0_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_flush_set0_high.de),
    .d      (hw2reg.cfg_flush_set0_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_flush_set0_high.q ),

    // to register interface (read)
    .qs     (cfg_flush_set0_high_qs)
  );


  // R[cfg_set_partition0_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition0_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition0_low_we),
    .wd     (cfg_set_partition0_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition0_low.de),
    .d      (hw2reg.cfg_set_partition0_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition0_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition0_low_qs)
  );


  // R[cfg_set_partition0_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition0_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition0_high_we),
    .wd     (cfg_set_partition0_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition0_high.de),
    .d      (hw2reg.cfg_set_partition0_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition0_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition0_high_qs)
  );


  // R[cfg_set_partition1_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition1_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition1_low_we),
    .wd     (cfg_set_partition1_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition1_low.de),
    .d      (hw2reg.cfg_set_partition1_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition1_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition1_low_qs)
  );


  // R[cfg_set_partition1_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition1_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition1_high_we),
    .wd     (cfg_set_partition1_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition1_high.de),
    .d      (hw2reg.cfg_set_partition1_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition1_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition1_high_qs)
  );


  // R[cfg_set_partition2_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition2_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition2_low_we),
    .wd     (cfg_set_partition2_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition2_low.de),
    .d      (hw2reg.cfg_set_partition2_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition2_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition2_low_qs)
  );


  // R[cfg_set_partition2_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition2_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition2_high_we),
    .wd     (cfg_set_partition2_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition2_high.de),
    .d      (hw2reg.cfg_set_partition2_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition2_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition2_high_qs)
  );


  // R[cfg_set_partition3_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition3_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition3_low_we),
    .wd     (cfg_set_partition3_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition3_low.de),
    .d      (hw2reg.cfg_set_partition3_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition3_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition3_low_qs)
  );


  // R[cfg_set_partition3_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition3_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition3_high_we),
    .wd     (cfg_set_partition3_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition3_high.de),
    .d      (hw2reg.cfg_set_partition3_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition3_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition3_high_qs)
  );


  // R[cfg_set_partition4_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition4_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition4_low_we),
    .wd     (cfg_set_partition4_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition4_low.de),
    .d      (hw2reg.cfg_set_partition4_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition4_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition4_low_qs)
  );


  // R[cfg_set_partition4_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition4_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition4_high_we),
    .wd     (cfg_set_partition4_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition4_high.de),
    .d      (hw2reg.cfg_set_partition4_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition4_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition4_high_qs)
  );


  // R[cfg_set_partition5_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition5_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition5_low_we),
    .wd     (cfg_set_partition5_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition5_low.de),
    .d      (hw2reg.cfg_set_partition5_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition5_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition5_low_qs)
  );


  // R[cfg_set_partition5_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition5_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition5_high_we),
    .wd     (cfg_set_partition5_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition5_high.de),
    .d      (hw2reg.cfg_set_partition5_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition5_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition5_high_qs)
  );


  // R[cfg_set_partition6_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition6_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition6_low_we),
    .wd     (cfg_set_partition6_low_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition6_low.de),
    .d      (hw2reg.cfg_set_partition6_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition6_low.q ),

    // to register interface (read)
    .qs     (cfg_set_partition6_low_qs)
  );


  // R[cfg_set_partition6_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_cfg_set_partition6_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_set_partition6_high_we),
    .wd     (cfg_set_partition6_high_wd),

    // from internal hardware
    .de     (hw2reg.cfg_set_partition6_high.de),
    .d      (hw2reg.cfg_set_partition6_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.cfg_set_partition6_high.q ),

    // to register interface (read)
    .qs     (cfg_set_partition6_high_qs)
  );


  // R[commit_cfg]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("W1S"),
    .RESVAL  (1'h0)
  ) u_commit_cfg (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (commit_cfg_we),
    .wd     (commit_cfg_wd),

    // from internal hardware
    .de     (hw2reg.commit_cfg.de),
    .d      (hw2reg.commit_cfg.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.commit_cfg.q ),

    // to register interface (read)
    .qs     (commit_cfg_qs)
  );


  // R[commit_partition_cfg]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("W1S"),
    .RESVAL  (1'h0)
  ) u_commit_partition_cfg (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (commit_partition_cfg_we),
    .wd     (commit_partition_cfg_wd),

    // from internal hardware
    .de     (hw2reg.commit_partition_cfg.de),
    .d      (hw2reg.commit_partition_cfg.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.commit_partition_cfg.q ),

    // to register interface (read)
    .qs     (commit_partition_cfg_qs)
  );


  // R[flushed_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_flushed_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.flushed_low.de),
    .d      (hw2reg.flushed_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.flushed_low.q ),

    // to register interface (read)
    .qs     (flushed_low_qs)
  );


  // R[flushed_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_flushed_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.flushed_high.de),
    .d      (hw2reg.flushed_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.flushed_high.q ),

    // to register interface (read)
    .qs     (flushed_high_qs)
  );


  // R[bist_out_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_bist_out_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.bist_out_low.de),
    .d      (hw2reg.bist_out_low.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (bist_out_low_qs)
  );


  // R[bist_out_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_bist_out_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.bist_out_high.de),
    .d      (hw2reg.bist_out_high.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (bist_out_high_qs)
  );


  // R[set_asso_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_set_asso_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.set_asso_low.de),
    .d      (hw2reg.set_asso_low.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (set_asso_low_qs)
  );


  // R[set_asso_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_set_asso_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.set_asso_high.de),
    .d      (hw2reg.set_asso_high.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (set_asso_high_qs)
  );


  // R[num_lines_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_num_lines_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.num_lines_low.de),
    .d      (hw2reg.num_lines_low.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (num_lines_low_qs)
  );


  // R[num_lines_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_num_lines_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.num_lines_high.de),
    .d      (hw2reg.num_lines_high.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (num_lines_high_qs)
  );


  // R[num_blocks_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_num_blocks_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.num_blocks_low.de),
    .d      (hw2reg.num_blocks_low.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (num_blocks_low_qs)
  );


  // R[num_blocks_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_num_blocks_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.num_blocks_high.de),
    .d      (hw2reg.num_blocks_high.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (num_blocks_high_qs)
  );


  // R[version_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_version_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.version_low.de),
    .d      (hw2reg.version_low.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (version_low_qs)
  );


  // R[version_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_version_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.version_high.de),
    .d      (hw2reg.version_high.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (version_high_qs)
  );


  // R[flushed_set0_low]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_flushed_set0_low (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.flushed_set0_low.de),
    .d      (hw2reg.flushed_set0_low.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.flushed_set0_low.q ),

    // to register interface (read)
    .qs     (flushed_set0_low_qs)
  );


  // R[flushed_set0_high]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_flushed_set0_high (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.flushed_set0_high.de),
    .d      (hw2reg.flushed_set0_high.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.flushed_set0_high.q ),

    // to register interface (read)
    .qs     (flushed_set0_high_qs)
  );




  logic [35:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == AXI_LLC_CFG_SPM_LOW_OFFSET);
    addr_hit[ 1] = (reg_addr == AXI_LLC_CFG_SPM_HIGH_OFFSET);
    addr_hit[ 2] = (reg_addr == AXI_LLC_CFG_FLUSH_LOW_OFFSET);
    addr_hit[ 3] = (reg_addr == AXI_LLC_CFG_FLUSH_HIGH_OFFSET);
    addr_hit[ 4] = (reg_addr == AXI_LLC_CFG_FLUSH_SET0_LOW_OFFSET);
    addr_hit[ 5] = (reg_addr == AXI_LLC_CFG_FLUSH_SET0_HIGH_OFFSET);
    addr_hit[ 6] = (reg_addr == AXI_LLC_CFG_SET_PARTITION0_LOW_OFFSET);
    addr_hit[ 7] = (reg_addr == AXI_LLC_CFG_SET_PARTITION0_HIGH_OFFSET);
    addr_hit[ 8] = (reg_addr == AXI_LLC_CFG_SET_PARTITION1_LOW_OFFSET);
    addr_hit[ 9] = (reg_addr == AXI_LLC_CFG_SET_PARTITION1_HIGH_OFFSET);
    addr_hit[10] = (reg_addr == AXI_LLC_CFG_SET_PARTITION2_LOW_OFFSET);
    addr_hit[11] = (reg_addr == AXI_LLC_CFG_SET_PARTITION2_HIGH_OFFSET);
    addr_hit[12] = (reg_addr == AXI_LLC_CFG_SET_PARTITION3_LOW_OFFSET);
    addr_hit[13] = (reg_addr == AXI_LLC_CFG_SET_PARTITION3_HIGH_OFFSET);
    addr_hit[14] = (reg_addr == AXI_LLC_CFG_SET_PARTITION4_LOW_OFFSET);
    addr_hit[15] = (reg_addr == AXI_LLC_CFG_SET_PARTITION4_HIGH_OFFSET);
    addr_hit[16] = (reg_addr == AXI_LLC_CFG_SET_PARTITION5_LOW_OFFSET);
    addr_hit[17] = (reg_addr == AXI_LLC_CFG_SET_PARTITION5_HIGH_OFFSET);
    addr_hit[18] = (reg_addr == AXI_LLC_CFG_SET_PARTITION6_LOW_OFFSET);
    addr_hit[19] = (reg_addr == AXI_LLC_CFG_SET_PARTITION6_HIGH_OFFSET);
    addr_hit[20] = (reg_addr == AXI_LLC_COMMIT_CFG_OFFSET);
    addr_hit[21] = (reg_addr == AXI_LLC_COMMIT_PARTITION_CFG_OFFSET);
    addr_hit[22] = (reg_addr == AXI_LLC_FLUSHED_LOW_OFFSET);
    addr_hit[23] = (reg_addr == AXI_LLC_FLUSHED_HIGH_OFFSET);
    addr_hit[24] = (reg_addr == AXI_LLC_BIST_OUT_LOW_OFFSET);
    addr_hit[25] = (reg_addr == AXI_LLC_BIST_OUT_HIGH_OFFSET);
    addr_hit[26] = (reg_addr == AXI_LLC_SET_ASSO_LOW_OFFSET);
    addr_hit[27] = (reg_addr == AXI_LLC_SET_ASSO_HIGH_OFFSET);
    addr_hit[28] = (reg_addr == AXI_LLC_NUM_LINES_LOW_OFFSET);
    addr_hit[29] = (reg_addr == AXI_LLC_NUM_LINES_HIGH_OFFSET);
    addr_hit[30] = (reg_addr == AXI_LLC_NUM_BLOCKS_LOW_OFFSET);
    addr_hit[31] = (reg_addr == AXI_LLC_NUM_BLOCKS_HIGH_OFFSET);
    addr_hit[32] = (reg_addr == AXI_LLC_VERSION_LOW_OFFSET);
    addr_hit[33] = (reg_addr == AXI_LLC_VERSION_HIGH_OFFSET);
    addr_hit[34] = (reg_addr == AXI_LLC_FLUSHED_SET0_LOW_OFFSET);
    addr_hit[35] = (reg_addr == AXI_LLC_FLUSHED_SET0_HIGH_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = (reg_we &
              ((addr_hit[ 0] & (|(AXI_LLC_PERMIT[ 0] & ~reg_be))) |
               (addr_hit[ 1] & (|(AXI_LLC_PERMIT[ 1] & ~reg_be))) |
               (addr_hit[ 2] & (|(AXI_LLC_PERMIT[ 2] & ~reg_be))) |
               (addr_hit[ 3] & (|(AXI_LLC_PERMIT[ 3] & ~reg_be))) |
               (addr_hit[ 4] & (|(AXI_LLC_PERMIT[ 4] & ~reg_be))) |
               (addr_hit[ 5] & (|(AXI_LLC_PERMIT[ 5] & ~reg_be))) |
               (addr_hit[ 6] & (|(AXI_LLC_PERMIT[ 6] & ~reg_be))) |
               (addr_hit[ 7] & (|(AXI_LLC_PERMIT[ 7] & ~reg_be))) |
               (addr_hit[ 8] & (|(AXI_LLC_PERMIT[ 8] & ~reg_be))) |
               (addr_hit[ 9] & (|(AXI_LLC_PERMIT[ 9] & ~reg_be))) |
               (addr_hit[10] & (|(AXI_LLC_PERMIT[10] & ~reg_be))) |
               (addr_hit[11] & (|(AXI_LLC_PERMIT[11] & ~reg_be))) |
               (addr_hit[12] & (|(AXI_LLC_PERMIT[12] & ~reg_be))) |
               (addr_hit[13] & (|(AXI_LLC_PERMIT[13] & ~reg_be))) |
               (addr_hit[14] & (|(AXI_LLC_PERMIT[14] & ~reg_be))) |
               (addr_hit[15] & (|(AXI_LLC_PERMIT[15] & ~reg_be))) |
               (addr_hit[16] & (|(AXI_LLC_PERMIT[16] & ~reg_be))) |
               (addr_hit[17] & (|(AXI_LLC_PERMIT[17] & ~reg_be))) |
               (addr_hit[18] & (|(AXI_LLC_PERMIT[18] & ~reg_be))) |
               (addr_hit[19] & (|(AXI_LLC_PERMIT[19] & ~reg_be))) |
               (addr_hit[20] & (|(AXI_LLC_PERMIT[20] & ~reg_be))) |
               (addr_hit[21] & (|(AXI_LLC_PERMIT[21] & ~reg_be))) |
               (addr_hit[22] & (|(AXI_LLC_PERMIT[22] & ~reg_be))) |
               (addr_hit[23] & (|(AXI_LLC_PERMIT[23] & ~reg_be))) |
               (addr_hit[24] & (|(AXI_LLC_PERMIT[24] & ~reg_be))) |
               (addr_hit[25] & (|(AXI_LLC_PERMIT[25] & ~reg_be))) |
               (addr_hit[26] & (|(AXI_LLC_PERMIT[26] & ~reg_be))) |
               (addr_hit[27] & (|(AXI_LLC_PERMIT[27] & ~reg_be))) |
               (addr_hit[28] & (|(AXI_LLC_PERMIT[28] & ~reg_be))) |
               (addr_hit[29] & (|(AXI_LLC_PERMIT[29] & ~reg_be))) |
               (addr_hit[30] & (|(AXI_LLC_PERMIT[30] & ~reg_be))) |
               (addr_hit[31] & (|(AXI_LLC_PERMIT[31] & ~reg_be))) |
               (addr_hit[32] & (|(AXI_LLC_PERMIT[32] & ~reg_be))) |
               (addr_hit[33] & (|(AXI_LLC_PERMIT[33] & ~reg_be))) |
               (addr_hit[34] & (|(AXI_LLC_PERMIT[34] & ~reg_be))) |
               (addr_hit[35] & (|(AXI_LLC_PERMIT[35] & ~reg_be)))));
  end

  assign cfg_spm_low_we = addr_hit[0] & reg_we & !reg_error;
  assign cfg_spm_low_wd = reg_wdata[31:0];

  assign cfg_spm_high_we = addr_hit[1] & reg_we & !reg_error;
  assign cfg_spm_high_wd = reg_wdata[31:0];

  assign cfg_flush_low_we = addr_hit[2] & reg_we & !reg_error;
  assign cfg_flush_low_wd = reg_wdata[31:0];

  assign cfg_flush_high_we = addr_hit[3] & reg_we & !reg_error;
  assign cfg_flush_high_wd = reg_wdata[31:0];

  assign cfg_flush_set0_low_we = addr_hit[4] & reg_we & !reg_error;
  assign cfg_flush_set0_low_wd = reg_wdata[31:0];

  assign cfg_flush_set0_high_we = addr_hit[5] & reg_we & !reg_error;
  assign cfg_flush_set0_high_wd = reg_wdata[31:0];

  assign cfg_set_partition0_low_we = addr_hit[6] & reg_we & !reg_error;
  assign cfg_set_partition0_low_wd = reg_wdata[31:0];

  assign cfg_set_partition0_high_we = addr_hit[7] & reg_we & !reg_error;
  assign cfg_set_partition0_high_wd = reg_wdata[31:0];

  assign cfg_set_partition1_low_we = addr_hit[8] & reg_we & !reg_error;
  assign cfg_set_partition1_low_wd = reg_wdata[31:0];

  assign cfg_set_partition1_high_we = addr_hit[9] & reg_we & !reg_error;
  assign cfg_set_partition1_high_wd = reg_wdata[31:0];

  assign cfg_set_partition2_low_we = addr_hit[10] & reg_we & !reg_error;
  assign cfg_set_partition2_low_wd = reg_wdata[31:0];

  assign cfg_set_partition2_high_we = addr_hit[11] & reg_we & !reg_error;
  assign cfg_set_partition2_high_wd = reg_wdata[31:0];

  assign cfg_set_partition3_low_we = addr_hit[12] & reg_we & !reg_error;
  assign cfg_set_partition3_low_wd = reg_wdata[31:0];

  assign cfg_set_partition3_high_we = addr_hit[13] & reg_we & !reg_error;
  assign cfg_set_partition3_high_wd = reg_wdata[31:0];

  assign cfg_set_partition4_low_we = addr_hit[14] & reg_we & !reg_error;
  assign cfg_set_partition4_low_wd = reg_wdata[31:0];

  assign cfg_set_partition4_high_we = addr_hit[15] & reg_we & !reg_error;
  assign cfg_set_partition4_high_wd = reg_wdata[31:0];

  assign cfg_set_partition5_low_we = addr_hit[16] & reg_we & !reg_error;
  assign cfg_set_partition5_low_wd = reg_wdata[31:0];

  assign cfg_set_partition5_high_we = addr_hit[17] & reg_we & !reg_error;
  assign cfg_set_partition5_high_wd = reg_wdata[31:0];

  assign cfg_set_partition6_low_we = addr_hit[18] & reg_we & !reg_error;
  assign cfg_set_partition6_low_wd = reg_wdata[31:0];

  assign cfg_set_partition6_high_we = addr_hit[19] & reg_we & !reg_error;
  assign cfg_set_partition6_high_wd = reg_wdata[31:0];

  assign commit_cfg_we = addr_hit[20] & reg_we & !reg_error;
  assign commit_cfg_wd = reg_wdata[0];

  assign commit_partition_cfg_we = addr_hit[21] & reg_we & !reg_error;
  assign commit_partition_cfg_wd = reg_wdata[0];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[31:0] = cfg_spm_low_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[31:0] = cfg_spm_high_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[31:0] = cfg_flush_low_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[31:0] = cfg_flush_high_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[31:0] = cfg_flush_set0_low_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[31:0] = cfg_flush_set0_high_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[31:0] = cfg_set_partition0_low_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[31:0] = cfg_set_partition0_high_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[31:0] = cfg_set_partition1_low_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[31:0] = cfg_set_partition1_high_qs;
      end

      addr_hit[10]: begin
        reg_rdata_next[31:0] = cfg_set_partition2_low_qs;
      end

      addr_hit[11]: begin
        reg_rdata_next[31:0] = cfg_set_partition2_high_qs;
      end

      addr_hit[12]: begin
        reg_rdata_next[31:0] = cfg_set_partition3_low_qs;
      end

      addr_hit[13]: begin
        reg_rdata_next[31:0] = cfg_set_partition3_high_qs;
      end

      addr_hit[14]: begin
        reg_rdata_next[31:0] = cfg_set_partition4_low_qs;
      end

      addr_hit[15]: begin
        reg_rdata_next[31:0] = cfg_set_partition4_high_qs;
      end

      addr_hit[16]: begin
        reg_rdata_next[31:0] = cfg_set_partition5_low_qs;
      end

      addr_hit[17]: begin
        reg_rdata_next[31:0] = cfg_set_partition5_high_qs;
      end

      addr_hit[18]: begin
        reg_rdata_next[31:0] = cfg_set_partition6_low_qs;
      end

      addr_hit[19]: begin
        reg_rdata_next[31:0] = cfg_set_partition6_high_qs;
      end

      addr_hit[20]: begin
        reg_rdata_next[0] = commit_cfg_qs;
      end

      addr_hit[21]: begin
        reg_rdata_next[0] = commit_partition_cfg_qs;
      end

      addr_hit[22]: begin
        reg_rdata_next[31:0] = flushed_low_qs;
      end

      addr_hit[23]: begin
        reg_rdata_next[31:0] = flushed_high_qs;
      end

      addr_hit[24]: begin
        reg_rdata_next[31:0] = bist_out_low_qs;
      end

      addr_hit[25]: begin
        reg_rdata_next[31:0] = bist_out_high_qs;
      end

      addr_hit[26]: begin
        reg_rdata_next[31:0] = set_asso_low_qs;
      end

      addr_hit[27]: begin
        reg_rdata_next[31:0] = set_asso_high_qs;
      end

      addr_hit[28]: begin
        reg_rdata_next[31:0] = num_lines_low_qs;
      end

      addr_hit[29]: begin
        reg_rdata_next[31:0] = num_lines_high_qs;
      end

      addr_hit[30]: begin
        reg_rdata_next[31:0] = num_blocks_low_qs;
      end

      addr_hit[31]: begin
        reg_rdata_next[31:0] = num_blocks_high_qs;
      end

      addr_hit[32]: begin
        reg_rdata_next[31:0] = version_low_qs;
      end

      addr_hit[33]: begin
        reg_rdata_next[31:0] = version_high_qs;
      end

      addr_hit[34]: begin
        reg_rdata_next[31:0] = flushed_set0_low_qs;
      end

      addr_hit[35]: begin
        reg_rdata_next[31:0] = flushed_set0_high_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Unused signal tieoff

  // wdata / byte enable are not always fully used
  // add a blanket unused statement to handle lint waivers
  logic unused_wdata;
  logic unused_be;
  assign unused_wdata = ^reg_wdata;
  assign unused_be = ^reg_be;

  // Assertions for Register Interface
  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

endmodule
