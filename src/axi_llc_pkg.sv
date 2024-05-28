// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Author: Wolfgang Roenninger <wroennin@iis.ee.ethz.ch>
// Date:   30.04.2019

/// Contains the configuration and internal messages structs of the `axi_llc`.
/// Parameter contained in this package are for fine grain configuration of the modules.
/// They can be changed to adapt the cache to a specific design for optimal performance.
package axi_llc_pkg;
  /// AxiCfgStruct to be set internally in [`axi_llc_top`](module.axi_llc_top). It bundles the
  /// AXI parameters together.
  typedef struct packed {
    /// AXI4+ATOP ID width of the slave port, CPU side, in bits
    int unsigned SlvPortIdWidth;
    /// AXI4+ATOP address width of the ports for accessing the LLC, in bits
    int unsigned AddrWidthFull;
    /// AXI4+ATOP data width of the ports for accessing the LLC, in bits
    int unsigned DataWidthFull;
  } llc_axi_cfg_t;

  /// Version parameter, can be read out from configuration port.
  ///
  /// This is ASCII encoded after the semantic versioning: `vAA.BB.C`
  parameter logic [63:0] AxiLlcVersion = 64'h7630_302E_3032_2E31;

  /// Cache configuration, used internally as localparam in the LLC submodules.
  /// Automatically set in (module.axi_llc_top).
  typedef struct packed {
    /// Set-associativity of the cache.
    int unsigned SetAssociativity;
    /// Number of cache lines per way.
    int unsigned NumLines;
    /// Number of blocks (words) in a cache line.
    int unsigned NumBlocks;
    /// Size of a block (word) in bit.
    int unsigned BlockSize;
    /// Length of the address tag, in bits.
    int unsigned TagLength;
    /// Length of the index ( line address ), in bits.
    int unsigned IndexLength;
    /// Length of the block offset in bits.
    int unsigned BlockOffsetLength;
    /// Length of the byte offset in bits.
    int unsigned ByteOffsetLength;
    /// SPM address region length, in bytes.
    int unsigned SPMLength;
    /// Data SRAM ECC granularity
    int unsigned DataEccGranularity;
    /// Tag SRAM ECC granularity
    int unsigned TagEccGranularity;
  } llc_cfg_t;

  /// Number of bytes transfered in an Ax transfer. Is used in `evens_t`. There they correspond to
  /// the fields labeled `*_num_bytes`. They are valid if the corresponding `active` field is `1`
  /// Can be used for bandwidth estimation.
  typedef struct packed {
    /// The value will be calculated by the function `axi_llc_pkg::event_num_bytes`
    logic [15:0] num_bytes;
    /// The `event_num_bytes` is valid/active.
    ///
    /// This corresponds to either a descriptor being handed from one LLC unit to another, or
    /// an AXI Ax vector being transfered within the LLC.
    logic        active;
  } event_num_bytes_t;

  /// Calculation of the event_num_bytes_t from descriptor, or AXI Ax values.
  function automatic event_num_bytes_t event_num_bytes (
      axi_pkg::len_t len, axi_pkg::size_t size, logic valid, logic ready);
    event_num_bytes = event_num_bytes_t'{
      num_bytes: (len + 16'd1) << size,
      active:    valid & ready,
      default: '0
    };
  endfunction : event_num_bytes

  /// The reporter module of the ECC event
  typedef enum logic [2:0] {
    SCRUBBER, 
    HIT_MISS_UNIT, 
    EVICT_UNIT, 
    READ_UNIT, 
    WRITE_UNIT
  } ecc_multierror_rpt_e;

  /// The source module of the ECC event
  typedef enum logic [1:0] {
    TAG_SRAM,
    DATA_SRAM,
    TAG_DATA_SRAM
  } ecc_multierror_src_e;

  /// The data state of the ECC event
  typedef enum logic {
    DIRTY,
    CLEAN
  } ecc_multierror_state_e;

  /// ECC info report to the system bus
  typedef struct packed {
    ecc_multierror_rpt_e    reporter;
    ecc_multierror_src_e    source;
    ecc_multierror_state_e  data_state;

    logic [63:0] data_line_addr;
    // logic [5:0]  offset;
    logic [5:0]  way;

    logic        active;
  } event_ecc_multierror_info_t;

  // /// Compose the ECC multierror info
  // function automatic event_ecc_multierror_info_t event_ecc_multierror_info (
  //     ecc_multierror_rpt_e rpt, ecc_multierror_src_e src, ecc_multierror_state_e data_state,
  //     logic [63:0] data_line_addr, logic [5:0]  offset, logic [5:0]  way,
  //     logic valid, logic ready);
  //   event_ecc_multierror_info = event_ecc_multierror_info_t'{
  //     reporter  : rpt,
  //     source    : src,
  //     data_state: data_state,

  //     data_line_addr : data_line_addr,
  //     offset    : offset,
  //     way       : way,

  //     active    : valid & ready,

  //     default: '0
  //   };
  // endfunction : event_ecc_multierror_info



  /// The signals bundled here indicate certain events happening in `axi_llc`.
  /// This is an output on `axi_llc_top` and can be used for example for performance counters.
  typedef struct packed {
    /// Event triggered by an individual AXI4 AW vector entering the LLC AW splitter unit from the
    /// slave port.
    event_num_bytes_t aw_slv_transfer;
    /// Event triggered by an individual AXI4 AR vector entering the LLC AR splitter unit from the
    /// slave port.
    event_num_bytes_t ar_slv_transfer;
    /// Event triggered by an individual AW vector taking the LLC bypass.
    event_num_bytes_t aw_bypass_transfer;
    /// Event triggered by an individual AR vector taking the LLC bypass.
    event_num_bytes_t ar_bypass_transfer;
    /// Event triggered by an individual AXI4 AW vector generated by the LLC eviction pipeline on
    /// the master port.
    event_num_bytes_t aw_mst_transfer;
    /// Event triggered by an individual AXI4 AR vector generated by the LLC refill pipeline on the
    /// master port.
    event_num_bytes_t ar_mst_transfer;
    /// Event triggered by an individual AW descriptor generated from the AW splitter unit.
    /// The descriptor is accessing the SPM mapped region of the LLC. This value includes every
    /// access, including to not SPM mapped sets! Only accurate when accesses are on the right
    /// portions.
    event_num_bytes_t aw_desc_spm;
    /// Event triggered by an individual AR descriptor generated from the AR splitter unit.
    /// The descriptor is accessing the SPM mapped region of the LLC. This value includes every
    /// access, including to not SPM mapped sets! Only accurate when accesses are on the right
    /// portions.
    event_num_bytes_t ar_desc_spm;
    /// Event triggered by an individual AW descriptor generated from the AW splitter unit.
    /// The descriptor is accessing the cache mapped region of the LLC.
    event_num_bytes_t aw_desc_cache;
    /// Event triggered by an individual AW descriptor generated from the AW splitter unit.
    /// The descriptor is accessing the cache mapped region of the LLC.
    event_num_bytes_t ar_desc_cache;
    /// Event triggered by an individual descriptor generated from the `axi_llc_config` unit.
    /// Usually a flush descriptor.
    event_num_bytes_t config_desc;
    /// Event triggered by an individual write descriptor onto the SPM region taking the hit bypass
    /// after the `hit_miss_unit`.
    event_num_bytes_t hit_write_spm;
    /// Event triggered by an individual read descriptor onto the SPM region taking the hit bypass
    /// after the `hit_miss_unit`.
    event_num_bytes_t hit_read_spm;
    /// Event triggered by an individual write descriptor onto the SPM region taking the miss
    /// pipeline after the `hit_miss_unit`.
    /// This should only happen to preserve ordering between the different AXI IDs.
    /// Writes are in order per AXI protocol spec (see A5.3.2).
    event_num_bytes_t miss_write_spm;
    /// Event triggered by an individual read descriptor onto the SPM region taking the miss
    /// pipeline after the `hit_miss_unit`.
    /// This should only happen to preserve ordering between the different AXI IDs.
    /// Consider using different AXI IDs if these events are numerous.
    event_num_bytes_t miss_read_spm;
    /// Event triggered by an individual write descriptor onto the cache region taking the hit
    /// bypass after the `hit_miss_unit`.
    event_num_bytes_t hit_write_cache;
    /// Event triggered by an individual read descriptor onto the cache region taking the hit
    /// bypass after the `hit_miss_unit`.
    event_num_bytes_t hit_read_cache;
    /// Event triggered by an individual write descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`.
    event_num_bytes_t miss_write_cache;
    /// Event triggered by an individual read descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`.
    event_num_bytes_t miss_read_cache;
    /// Event triggered by an individual write descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`. This only counts descriptors which cause a cache line
    /// refill.
    event_num_bytes_t refill_write;
    /// Event triggered by an individual read descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`. This only counts descriptors which cause a cache line
    /// refill.
    event_num_bytes_t refill_read;
    /// Event triggered by an individual write descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`. This only counts descriptors which cause a cache line
    /// eviction due to writing back dirty data.
    event_num_bytes_t evict_write;
    /// Event triggered by an individual read descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`. This only counts descriptors which cause a cache line
    /// eviction due to writing back dirty data.
    event_num_bytes_t evict_read;
    /// Event triggered by an individual flush descriptor onto the cache region taking the miss
    /// pipeline after the `hit_miss_unit`. This only counts descriptors which cause a cache line
    /// eviction due to writing back dirty data.
    event_num_bytes_t evict_flush;
    /// The `EvictUnit` transfers a request (successful handshake) to the data storage macros.
    logic evict_unit_req;
    /// The `RefilUnit` transfers a request (successful handshake) to the data storage macros.
    logic refill_unit_req;
    /// The `WChanUnit` transfers a request (successful handshake) to the data storage macros.
    logic w_chan_unit_req;
    /// The `RChanUnit` transfers a request (successful handshake) to the data storage macros.
    logic r_chan_unit_req;
    /// Multiple ECC error detected.
    event_ecc_multierror_info_t ecc_multierror_info;
  } events_t;

  /// Maximum concurrent AXI transactions on both ports
  parameter int unsigned MaxTrans = 32'd10;

  /// Request Id for refill operations (is constant so that no read interleaving is happening)
  /// Casted/extended to the required ID width in `ax_master`.
  parameter logic [3:0] AxReqId = 4'b1001;

  /// Tag storage request enumeration definition
  typedef enum logic [1:0] {
    /// Run BIST/INIT
    BIST   = 2'b00,
    /// Flush the requested position (output tells if to evict)
    FLUSH  = 2'b01,
    /// Lookup, Performs Hit detection
    LOOKUP = 2'b10,
    /// Store, Writes a tag at the position set with `way_ind_i`
    STORE  = 2'b11
  } tag_req_e;

  /// Tag storage request enumeration definition
  typedef enum logic [1:0] {
    /// Run BIST/INIT
    Bist   = 2'b00,
    /// Flush the requested position (output tells if to evict)
    Flush  = 2'b01,
    /// Lookup, Performs Hit detection
    Lookup = 2'b10
  } tag_mode_e;

  // Configuration of the counting bloom filter in `lock_box_bloom` located in `hit_miss`.
  // Change these parameters if you want to optimize the false positive rate.
  /// Number of different hashes used in (`module.lock_box_bloom`).
  parameter int unsigned BloomKHashes     = 32'd3;
  /// Width of the calculated hash function.
  ///
  /// Restriction has to be wider than TODO.
  parameter int unsigned BloomHashWidth   = 32'd6;
  /// Number of hash rounds of the counting bloom filter.
  parameter int unsigned BloomHashRounds  = 32'd1;
  /// Width of the buckets of the counting bloom filter.
  parameter int unsigned BloomBucketWidth = 32'd3;
  parameter cb_filter_pkg::cb_seed_t [BloomKHashes-1:0] BloomSeeds = '{
    cb_filter_pkg::cb_seed_t'{PermuteSeed: 32'd299034753, XorSeed: 32'd4094834  },
    cb_filter_pkg::cb_seed_t'{PermuteSeed: 32'd19921030,  XorSeed: 32'd995713   },
    cb_filter_pkg::cb_seed_t'{PermuteSeed: 32'd294388,    XorSeed: 32'd65146511 }
  };

  /// Depth of the W channel pipeline inside the write unit to reduce W stalling
  /// as long as the corresponding AW is still in lookup.
  parameter int unsigned WChanBufferDepth = 32'd6;
  /// Number of simultaneous eviction transactions.
  parameter int unsigned EvictFifoDepth   = 32'd4;
  /// Number of descriptors between eviction and refill.
  parameter int unsigned MissBufferDepth  = 32'd2;
  /// Number of simultaneous refill transactions.
  parameter int unsigned RefillFifoDepth  = 32'd4;

  /// Miss counter determine how many descriptors of a given ID can go into the miss pipeline before
  /// the module stalls.
  parameter int unsigned MissCntWidth     = 32'd5;
  /// Writes are counted separately. Writes have to be in order, only one counter.
  parameter int unsigned MissCntMaxWWidth = 32'd7;
  /// This number tells us how many bits of the slave port AXI ID are used for pointing on a counter
  /// * Translates in 2**`UseIdBits` counters inferred.
  /// * Set this parameter to the slave port AXI ID width if you want one counter for each AXI ID.
  parameter int unsigned UseIdBits        = 32'd4;

  /// This adds a spill register in the response path of the tag stroage unit.
  /// This should be used to achieve good timing characteristics in synthsis as the longest
  /// path in the design comes out of the tag storage macros.
  /// `0`: no spill register
  /// `1`: add spill register
  parameter bit SpillTagStore             = 1'b1;

  /// Read latency of the memory macros responsible for saving the tags.
  /// This value has to be >= 32'd1.
  parameter int unsigned TagMacroLatency  = 32'd1;

  /// Read latency of the memory macros responsible for saving the data.
  /// This value has to be == 32'd1.
  parameter int unsigned DataMacroLatency = 32'd1;

  /// Indicates which unit does an operation onto a cache line data storage element
  typedef enum logic [1:0] {
    /// Eviction Unit
    EvictUnit = 2'b00,
    /// Refill Unit
    RefilUnit = 2'b01,
    /// Write Unit
    WChanUnit = 2'b10,
    /// Read UNit
    RChanUnit = 2'b11
  } cache_unit_e;

  /// Indicates which unit generates a descriptor
  typedef enum logic [1:0] {
    /// AW channel splitter unit
    AwChanUnit = 2'b00,
    /// AW channel splitter unit
    ArChanUnit = 2'b01,
    /// Configuration module (Flush descriptors)
    ConfigUnit = 2'b10
  } desc_unit_e;

  /// Indicates the algorithm used in index_assigner for partitioning
  typedef enum logic [1:0] {
    /// Modulo
    Modulo = 2'b00,
    /// Multiply-shifting
    Mulsft = 2'b01,
    /// Truncation and mapping on both side
    TruncDual = 2'b10
  } algorithm_e;
endpackage
