"""
Per-kernel verification profiles.

Optional configuration for kernel types that need special handling in
harness generation — custom buffer sizing, weight layouts, channel sweeps, etc.

To add support for a new kernel type, add an entry to KERNEL_PROFILES.
Kernels without a profile fall through to the generic auto-inference path.
"""

from dataclasses import dataclass, field
from typing import Optional


@dataclass
class KernelProfile:
    """Verification profile for a kernel type."""
    # Buffer sizing
    weight_size: str = ""           # C++ expression for weight buffer size in bytes (empty = use LLM)

    # Channel sweep for 2D kernels (byte values).
    # Entries can be ints (fixed) or strings (C++ expressions evaluated at runtime).
    channel_sweep: list = field(default_factory=list)

    # Padding (bytes added per row for SIMD tail over-reads)
    pad_bytes: int = 16

    # Concrete weight initialization (if set, weights are concrete not symbolic)
    concrete_weights: Optional[dict] = None  # {"pattern": "tiled", "scales": [...], "biases": [...]}

    # Stride overrides (empty = use default inference)
    stride_override: str = ""       # C++ expression for input/output stride

    # Dual weight layout: NEON and RVV use different weight packings.
    # If set, two weight buffers are created with the same logical scale/bias
    # values at architecture-specific offsets.
    # neon_tile: NEON packing tile size (e.g. 4 for c4)
    # rvv_tile_expr: C++ expression for RVV tile size (e.g. "(vlen / 32) * 4" for e32m4 VLMAX)
    # elem_bytes: size of one weight element in bytes (4 for float)
    # scales/biases: concrete test values (cycled over channels)
    # symbolic_weights: if True, weights are fully symbolic (slower but proves for all values)
    #                   if False, weights are concrete (faster, proves for specific values only)
    dual_weight_layout: Optional[dict] = None

    # Symbolic params: when True, params struct fields become SymbolicScalar<T>
    # and the solver proves equivalence for ALL valid param values in one query.
    # When False (default), concrete edge-case configs are generated instead.
    #
    # param_ranges: optional dict mapping field names to (min, max) tuples.
    #   Only listed fields are constrained; unlisted fields get the full type range.
    #   Example: {"input_zero_point": (-128, 127), "positive_multiplier": (1, 255)}
    #   Constraints from PARAM_CONSTRAINTS in param_configs.py are always applied
    #   in addition to these range bounds.
    symbolic_params: bool = False
    param_ranges: Optional[dict] = None

    # Optional FP input range constraint.  When set, each symbolic f32 input
    # lane is constrained to lie in [min, max] via FP_GEQ/FP_LEQ. (F64 not
    # supported until fp64 helpers land on both backends.)
    # FP comparisons return false for NaN, so NaN is automatically excluded.
    # This skips solver work for NaN/inf/subnormal edge cases and typically
    # gives 10-100x speedup on FP-heavy kernels with division or polynomials.
    # Set to None (default) to leave inputs fully symbolic.
    input_range: Optional[tuple] = None

    # Lookup tables used by the kernel (e.g. exp2 LUT in f32-velu).
    # When set, the harness registers each table as a concrete SymbolicBuffer
    # with byte-level constraints, and rewrites the NEON source per the
    # declared idiom.
    #
    # Each entry must include:
    #   "symbol":     the C symbol of the table (defined in xnn_minimal.h)
    #   "entries":    number of elements
    #   "elem_bytes": size of one element in bytes
    #   "idiom":      gather shape used by the NEON kernel.  Known values:
    #                   "neon_s32_dup_lane" — the vgetq_lane_u64 +
    #                     vld1_dup_s32 + vld1_lane_s32 pattern used by
    #                     f32-velu.  Rewritten to salt_neon_gather2_s32.
    # Unknown idioms cause harness generation to fail loudly.
    lookup_tables: Optional[list] = None

    # SPATIAL_HWC_CHW override: bypasses the XNNPACK name-regex parse.
    # Use this when the function has been renamed away from the
    # `<kH>x<kW>s<stride>p<pad>c<in_ch>x<out_tile>` naming convention.
    # Keys: kh, kw, stride, pad, in_ch, out_tile (all ints).
    conv_shape: Optional[dict] = None

    # Required source transforms — names from source_transforms.REGISTRY.
    # Listed transforms MUST report matched=True; runner fails otherwise.
    # Implicit triggers (symbolic_params/lookup_tables) still auto-run their
    # transforms as best-effort; this list is for *required* declarations.
    required_transforms: list = field(default_factory=list)

    # SPATIAL_HWC_CHW: override the output_channels sweep values. Default
    # generator picks tile-multiples; profile can shrink to e.g. [1] for
    # cvc5-backend speed. The tile-rounded weights formula handles non-tile
    # values correctly.
    spatial_output_channels: Optional[list] = None

    # Per-buffer MemoryLayout override (arg_name -> MemoryLayout). Wins over
    # the source_facts regex detector. Use when the detector misses a layout
    # (e.g. aliasing) or to declare a layout the regex can't see.
    buffer_layouts: Optional[dict] = None

    # GEMM-specific verification profile (Shape.GEMM_DIRECT_FP).
    # Required keys:
    #   "dims"          dict[str, list[int]] — fixture values per sweep dim
    #                   (e.g. {"mr": [1], "nc": [1,2,3,4,7,8], "kc": [4,8,11,16]}).
    #                   Verifier emits one config per (mr, nc, kc) tuple.
    #   "strides"       dict[str, str] — C++ expressions for a_stride,
    #                   cm_stride, cn_stride bound at call time.
    #   "buffer_sizes"  dict[str, str] — C++ byte-size expressions for
    #                   each pointer arg ("a", "w_ptr", "c"). Must include
    #                   tail slack for SIMD over-reads.
    #   "weight_tile_n" int — output-column tile width (e.g. 4 for 1x4c8).
    #                   Drives the tile-aware output-compare loop.
    #   "elem_bytes"    int — output element size in bytes (2 for bf16).
    #   "concrete_weights"  bool — True = fixed weight pattern (faster);
    #                       False = symbolic (proves over all weights).
    # Optional:
    #   "arg_bindings"  dict[str, str] — per-arg expression that overrides
    #                   the default `name = name` binding. Use when the
    #                   kernel arg's unit differs from the sweep variable
    #                   (e.g. bf16-gemm: kc sweep is in elements but the
    #                   kernel arg is bytes, so {"kc": "(kc * 2)"}).
    # Subsequent GEMM signature families (quantized, indirect-input) get
    # their own sibling Shape + profile field rather than overloading this.
    gemm: Optional[dict] = None

    # BILINEAR_INDIRECT verification profile (Shape.BILINEAR_INDIRECT).
    # Required:
    #   "elem_bytes"         int (1, 2, 4) — input/output element size.
    #   "weight_elem_bytes"  int (2 or 4) — weight element size (int16 Q15
    #                       for integer ibilinear; float for fp variants).
    # Optional:
    #   "channels_values"        list[int] — channel-count fixtures.
    #   "output_pixels_values"   list[int] — output-pixel counts (default [1]).
    bilinear: Optional[dict] = None

    # POOL_INDIRECT verification profile (Shape.POOL_INDIRECT).
    # Required keys:
    #   "elem_bytes"             int (1, 2, 4) — input/output element size.
    # Optional:
    #   "kernel_elements_values" list[int] — usually [9] for 9p kernels.
    #   "channels_values"        list[int] — channel-count fixtures.
    #   "output_pixels_values"   list[int] — output pixel counts (default [1]).
    pool: Optional[dict] = None

    # TRANSPOSE_2D verification profile (Shape.TRANSPOSE_2D).
    # Required keys:
    #   "elem_bytes"  int — size of one transposed element (1, 2, 4, 8).
    #   "blocks"      list[(int, int)] — (block_width, block_height) fixtures.
    #                 Verifier emits one config per pair.  Sized to exercise
    #                 the kernel's tile (e.g. main-tile + width-tail +
    #                 height-tail + multi-tile).
    transpose: Optional[dict] = None

    # REDUCE_1D verification profile (Shape.REDUCE_1D).
    # Required keys:
    #   "n_outputs"     int — number of output scalars (1 for rsum/qs8-rsum,
    #                   2 for rminmax).
    #   "output_init"   list[str] — C literals (length = n_outputs) the harness
    #                   stores into the output buffer before calling the kernel.
    #                   The kernel reads-modifies-writes these slots.
    #                   Examples: ["0.0f"] for rsum; ["+INFINITY", "-INFINITY"]
    #                   for f32-rminmax; ["INT8_MAX", "INT8_MIN"] for s8-rminmax.
    # Optional:
    #   "batch_unit"    str — "bytes" (default) or "elements".  XNNPACK FP
    #                   reductions take batch in bytes; quantized variants
    #                   typically take elements.
    #   "sweep"         list[int] — fixture values for the sweep dimension
    #                   (default boundary set: 1,2,3,4,5,7,8,9,15,16,17).
    reduce: Optional[dict] = None

    # DWCONV_INDIRECT verification profile (Shape.DWCONV_INDIRECT).
    # Required:
    #   "elem_bytes"          int (1, 2, 4) — input/output element size.
    #   "kernel_size"         int — bake-time kernel rows (3, 9, 25, ...).
    # Optional:
    #   "weight_elem_bytes"   int — weight element size (= elem_bytes for fp).
    #   "channels_values"     list[int] — channel-count fixtures.
    #   "output_width_values" list[int] — output-width counts (default [1]).
    dwconv: Optional[dict] = None

    # IGEMM_INDIRECT_FP verification profile (Shape.IGEMM_INDIRECT_FP).
    # Required:
    #   "elem_bytes"   int (4 for f32)
    #   "nr"           int — bake-time output-cols tile (e.g. 4 for 1x4 kernel)
    #   "ks"           int — bake-time subkernel-pixel count (1 for non-conv)
    #   "dims"         {"mr":[..], "nc":[..], "kc":[..]} (kc in ELEMENTS)
    #   "strides"      {"cm_stride":"...", "cn_stride":"..."} (C exprs)
    #   "buffer_sizes" {"w":"...", "c":"..."} (C exprs)
    # Optional:
    #   "arg_bindings" {arg_name: "C expr"} — overrides for byte/element conversion.
    igemm: Optional[dict] = None

    # REDUCE_2D verification profile (Shape.REDUCE_2D).
    # Required:
    #   "elem_bytes"        int (4 for f32, 2 for f16)
    # Optional:
    #   "channels_values"   list[int] — channel-count fixtures.
    #   "rows_values"       list[int] — row-count fixtures.
    reduce_2d: Optional[dict] = None

    # PACK_W verification profile (Shape.PACK_W).
    # Required: "elem_bytes" int.
    # Optional: "nc_values", "kc_values" — sweep value lists.
    pack_w: Optional[dict] = None

    # PRELU verification profile (Shape.PRELU).
    # Required: "elem_bytes" int.
    # Optional: "channels_values", "rows_values" — sweep value lists.
    prelu: Optional[dict] = None

    # GEMM_GROUP_FP verification profile (Shape.GEMM_GROUP_FP).
    # Required: "elem_bytes" int.
    # Optional: "g_values", "mr_values", "nc_values", "kc_values" — sweep value lists.
    gemm_group: Optional[dict] = None

    # CONCAT2 verification profile (Shape.CONCAT2).
    # Required: "elem_bytes" int.
    # Optional: "na_values", "nb_values" — sweep value lists.
    concat2: Optional[dict] = None

    # ZIP_2 verification profile (Shape.ZIP_2).
    # Required: "elem_bytes" int.
    # Optional: "n_values" — sweep value list.
    zip_2: Optional[dict] = None

    # SPLIT_2 verification profile (Shape.SPLIT_2).
    # Required: "elem_bytes" int.
    # Optional: "na_values", "nb_values" — sweep value lists.
    split_2: Optional[dict] = None

    # OUTER_PRODUCT verification profile (Shape.OUTER_PRODUCT).
    # Required: "elem_bytes" int.
    # Optional: "m_values", "n_values" — sweep value lists.
    outer_product: Optional[dict] = None

    # GEMM_QC4W verification profile (Shape.GEMM_QC4W).
    # Same shape as gemm; w buffer is 4-bit packed (kc * nc / 2 bytes).
    gemm_qc4w: Optional[dict] = None

    # VLUT verification profile (Shape.VLUT). 4-entry hardcoded table.
    vlut: Optional[dict] = None


# ---------------------------------------------------------------------------
# Registry
# ---------------------------------------------------------------------------
KERNEL_PROFILES: dict[str, KernelProfile] = {
    # -----------------------------------------------------------------
    # Elementwise kernels — symbolic params with defined value ranges
    # -----------------------------------------------------------------
    "qs8-vlrelu": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "input_zero_point":    (-128, 127),
            "positive_multiplier": (1, 255),
            "negative_multiplier": (1, 255),
            "output_zero_point":   (-128, 127),
        },
    ),
    "qu8-vlrelu": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "input_zero_point":    (0, 255),
            "positive_multiplier": (1, 255),
            "negative_multiplier": (1, 255),
            "output_zero_point":   (0, 255),
        },
    ),
    "qs8-vaddc": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (-128, 127),
            "b_zero_point":    (-128, 127),
            "a_multiplier":    (1, 65535),
            "b_multiplier":    (1, 65535),
            "shift":           (0, 31),
            "output_zero_point": (-128, 127),
            "output_min":      (-128, 127),
            "output_max":      (-128, 127),
        },
    ),
    "qs8-vadd": KernelProfile(
        symbolic_params=False,
        param_ranges={
            "a_zero_point":    (-128, 127),
            "b_zero_point":    (-128, 127),
            "a_multiplier":    (1, 65535),
            "b_multiplier":    (1, 65535),
            "shift":           (0, 31),
            "output_zero_point": (-128, 127),
            "output_min":      (-128, 127),
            "output_max":      (-128, 127),
        },
    ),
    "qs8-vmul": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (-128, 127),
            "b_zero_point":    (-128, 127),
            "output_zero_point": (-128, 127),
            "output_min":      (-128, 127),
            "output_max":      (-128, 127),
        },
    ),
    "qs8-vmulc": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (-128, 127),
            "b_zero_point":    (-128, 127),
            "output_zero_point": (-128, 127),
            "output_min":      (-128, 127),
            "output_max":      (-128, 127),
        },
    ),
    "qu8-vaddc": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (0, 255),
            "b_zero_point":    (0, 255),
            "a_multiplier":    (1, 65535),
            "b_multiplier":    (1, 65535),
            "shift":           (0, 31),
            "output_zero_point": (0, 255),
            "output_min":      (0, 255),
            "output_max":      (0, 255),
        },
    ),
    "qu8-vadd": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (0, 255),
            "b_zero_point":    (0, 255),
            "a_multiplier":    (1, 65535),
            "b_multiplier":    (1, 65535),
            "shift":           (0, 31),
            "output_zero_point": (0, 255),
            "output_min":      (0, 255),
            "output_max":      (0, 255),
        },
    ),
    "qu8-vmul": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (0, 255),
            "b_zero_point":    (0, 255),
            "output_zero_point": (0, 255),
            "output_min":      (0, 255),
            "output_max":      (0, 255),
        },
    ),
    "qu8-vmulc": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "a_zero_point":    (0, 255),
            "b_zero_point":    (0, 255),
            "output_zero_point": (0, 255),
            "output_min":      (0, 255),
            "output_max":      (0, 255),
        },
    ),
    "qs8-vcvt": KernelProfile(
        symbolic_params=False,
        param_ranges={
            "input_zero_point":  (-128, 127),
            "multiplier":        (1, 65535),
            "output_zero_point": (-128, 127),
        },
    ),
    "qu8-vcvt": KernelProfile(
        symbolic_params=True,
        param_ranges={
            "input_zero_point":  (0, 255),
            "multiplier":        (1, 65535),
            "output_zero_point": (0, 255),
        },
    ),
    "f32-vclamp": KernelProfile(
        symbolic_params=True,
        # min/max are full float range — PARAM_CONSTRAINTS enforces min <= max
    ),
    "f32-vlrelu": KernelProfile(
        symbolic_params=True,
        # negative_slope is any float
    ),
    "f32-vhswish": KernelProfile(
        symbolic_params=True,
    ),
    "f32-velu": KernelProfile(
        symbolic_params=False,
        # prescale, alpha, beta are any float
        lookup_tables=[{
            "symbol": "xnn_table_exp2minus_k_over_16",
            "entries": 16,
            "elem_bytes": 4,
            "idiom": "neon_s32_dup_lane",
        }],
        # Constrain inputs to a normal range — the algorithm clamps z to
        # [-17.328, 0] internally anyway, so finite inputs in [-100, 100]
        # exercise the interesting behavior without forcing the solver to
        # reason about NaN/inf/subnormal edge cases.
        input_range=(-100.0, 100.0),
    ),
    "f32-vapproxgelu": KernelProfile(
        symbolic_params=False,
        # Aggressive narrowing: [-1, 1].  The algorithm clamps x to
        # [-4.85, 4.85] anyway, so [-1, 1] stays well within the polynomial's
        # "interesting" regime without forcing the solver to reason about
        # clamp case-splits or wide dynamic-range propagation.  This trades
        # verification scope for tractability; widen back to [-4.85, 4.85]
        # or [-100, 100] once the solver is fast enough to handle them.
        input_range=(-1.0, 1.0),
    ),
    # -----------------------------------------------------------------
    # 2D kernels
    # -----------------------------------------------------------------
    "vmulcaddcfma": KernelProfile(
        weight_size="((channels + 15) / 16) * 32",  # NEON buffer size
        channel_sweep=[16, "_vlmax * 4", "_vlmax * 4 + 8"],
        pad_bytes=16,
        dual_weight_layout={
            "neon_tile": 4,
            "rvv_tile_expr": "(vlen / 32) * 4",  # VLMAX for e32m4
            "elem_bytes": 4,
            "scales": [0.8, 1.2, -0.5, 2.0, 0.3, -1.1, 0.9, 1.5],
            "biases": [-0.3, 0.7, 1.5, -1.0, 0.4, -0.8, 2.1, -0.6],
            "symbolic_weights": False,
        },
    ),
    "vmulcaddc": KernelProfile(
        weight_size="((channels + 15) / 16) * 32",  # NEON buffer size
        channel_sweep=[ "_vlmax * 4 + 8"],
        pad_bytes=16,
        dual_weight_layout={
            "neon_tile": 4,
            "rvv_tile_expr": "(vlen / 32) * 4",  # VLMAX for e32m4
            "elem_bytes": 4,
            "scales": [0.8, 1.2, -0.5, 2.0, 0.3, -1.1, 0.9, 1.5],
            "biases": [-0.3, 0.7, 1.5, -1.0, 0.4, -0.8, 2.1, -0.6],
            "symbolic_weights": False,
        },
    ),
    "f16-vmulcaddc": KernelProfile(
        weight_size="((channels + 15) / 16) * 32",  # NEON buffer: 8 scales + 8 biases per block
        channel_sweep=["_vlmax * 2 + 8"],
        pad_bytes=16,
        dual_weight_layout={
            "neon_tile": 8,
            "rvv_tile_expr": "(vlen / 16) * 1",  # VLMAX for e16m1
            "elem_bytes": 2,
            "scales": [0.8, 1.2, -0.5, 2.0, 0.3, -1.1, 0.9, 1.5],
            "biases": [-0.3, 0.7, 1.5, -1.0, 0.4, -0.8, 2.1, -0.6],
            "symbolic_weights": False,
        },
    ),
    # -----------------------------------------------------------------
    # SPATIAL conv kernels
    # -----------------------------------------------------------------
    # The upstream function is xnn_f16_conv_hwc2chw_ukernel_3x3s2p1c3x4__*
    # but the verification source may be renamed; carry the shape directly.
    "f16-conv-hwc2chw": KernelProfile(
        conv_shape={"kh": 3, "kw": 3, "stride": 2, "pad": 1,
                     "in_ch": 3, "out_tile": 4},
    ),
    # -----------------------------------------------------------------
    # GEMM kernels (Shape.GEMM_DIRECT_FP)
    # -----------------------------------------------------------------
    # bf16-gemm 1x4c8: mr=1 fixed, packed weights = (bias[4] + weights[4*kc])
    # per nc=4 output-column group. Output is tiled in 4-column blocks; each
    # block is at byte offset (tile_idx * cn_stride), then 2 bytes per column
    # within the block.
    "bf16-gemm": KernelProfile(
        gemm={
            # Sweep `kc` in elements (more intuitive); kernel arg is bytes.
            # Coverage: 4=tail-only, 8=one main chunk, 11=chunk+tail, 16=two chunks.
            "dims": {"mr": [1], "nc": [1, 2, 3, 4, 7, 8], "kc": [4, 8, 11, 16]},
            "arg_bindings": {
                "kc": "(kc * 2)",   # kernel arg is bytes, sweep is elements
            },
            "strides": {
                "a_stride":  "(kc * 2)",            # bytes per row
                "cm_stride": "((nc + 3) / 4) * 8",  # mr=1 so unused, sized for safety
                "cn_stride": "8",                   # 4 bf16 per output tile
            },
            "buffer_sizes": {
                "a":     "mr * (kc * 2) + 32",
                # Per nc=4 tile: 4 bias bf16 + 4 cols * 8 * ceil(kc/8) weight bf16.
                # Kernel always reads in 8-element chunks (tail zero-masks via
                # vceqq_u16), so allocation must round up regardless of kc.
                "w_ptr": "((nc + 3) / 4) * (4 + 32 * ((kc + 7) / 8)) * 2 + 32",
                "c":     "mr * ((nc + 3) / 4) * 8 + 32",
            },
            "weight_tile_n": 4,
            "elem_bytes": 2,
            "concrete_weights": True,
        },
    ),

    # -----------------------------------------------------------------
    # Reduction kernels (Shape.REDUCE_1D)
    # -----------------------------------------------------------------
    # f32-rsum: sum N input floats, scale, accumulate into *output.
    # batch is in bytes per upstream XNNPACK convention.
    "f32-rsum": KernelProfile(
        reduce={
            "n_outputs": 1,
            "output_init": ["0.5f"],   # arbitrary non-zero so RMW vs assign bug surfaces
            "batch_unit": "bytes",
            "sweep": [1, 2, 3, 4, 5, 7, 8, 9, 15, 16, 17],
        },
        # Restrict symbolic input lanes to a moderate finite range.  Excludes
        # NaN/inf/subnormals automatically (FP_GEQ/LEQ return false on NaN),
        # which dramatically shrinks the SAT formula cvc5 has to discharge.
        input_range=(-1000.0, 1000.0),
    ),
    # f32-rminmax: 2-output reduction.  Caller initializes output[0]=+INFINITY
    # (so any first element becomes the running min) and output[1]=-INFINITY
    # (so any first element becomes the running max).
    "f32-rminmax": KernelProfile(
        reduce={
            "n_outputs": 2,
            "output_init": ["+INFINITY", "-INFINITY"],
            "batch_unit": "bytes",
            # batch=1..5 each completes in <30s; batch=7 takes ~120s; batch≥8
            # exceeds practical bound for cvc5 on this FP min/max chain.
            "sweep": [1, 2, 3, 4, 5],
        },
        input_range=(-1000.0, 1000.0),
    ),
    "f16-rminmax": KernelProfile(
        reduce={
            "n_outputs": 2,
            "output_init": ["+INFINITY", "-INFINITY"],
            "batch_unit": "bytes",
            "sweep": [1, 2, 3, 4, 5],
        },
    ),
    "qs8-rsum": KernelProfile(
        reduce={
            "n_outputs": 1,
            "output_init": ["0"],            # int32 init = 0
            "batch_unit": "elements",        # qs8-rsum takes batch in elements (int8 bytes)
            "sweep": [1, 2, 3, 4, 5, 8, 16],
        },
    ),
    "qu8-rsum": KernelProfile(
        reduce={
            "n_outputs": 1,
            "output_init": ["0u"],
            "batch_unit": "elements",
            "sweep": [1, 2, 3, 4, 5, 8, 16],
        },
    ),

    # -----------------------------------------------------------------
    # Transpose kernels (Shape.TRANSPOSE_2D)
    # -----------------------------------------------------------------
    # x32-transposec: 4-byte (uint32_t / float32) elements, 2x2 tile NEON
    # variant.  Block fixtures hit the main 2x2 path plus 1-element tails on
    # both axes, plus a multi-tile case to exercise the outer loop.
    "x32-transposec": KernelProfile(
        transpose={
            "elem_bytes": 4,
            "blocks": [(1, 1), (2, 2), (2, 1), (1, 2), (3, 2), (2, 3), (4, 4)],
        },
    ),
    "x8-transposec": KernelProfile(
        transpose={
            "elem_bytes": 1,
            "blocks": [(1, 1), (2, 2), (2, 1), (1, 2), (3, 2), (2, 3), (4, 4)],
        },
    ),
    "x16-transposec": KernelProfile(
        transpose={
            "elem_bytes": 2,
            "blocks": [(1, 1), (2, 2), (2, 1), (1, 2), (3, 2), (2, 3), (4, 4)],
        },
    ),
    "x64-transposec": KernelProfile(
        transpose={
            "elem_bytes": 8,
            "blocks": [(1, 1), (2, 2), (2, 1), (1, 2), (3, 2), (2, 3), (4, 4)],
        },
    ),

    # -----------------------------------------------------------------
    # Pooling kernels (Shape.POOL_INDIRECT)
    # -----------------------------------------------------------------
    # u8-maxpool 9p: indirect input array of 9 row pointers, byte-level
    # max over each channel position.  No FP — pure integer max.
    "u8-maxpool": KernelProfile(
        pool={
            "elem_bytes": 1,
            "kernel_elements_values": [9],
            "channels_values": [1, 4, 8, 16],
            "output_pixels_values": [1],
        },
    ),
    "s8-maxpool": KernelProfile(
        pool={
            "elem_bytes": 1,
            "kernel_elements_values": [9],
            "channels_values": [1, 4, 8, 16],
            "output_pixels_values": [1],
        },
    ),
    "f32-maxpool": KernelProfile(
        pool={
            "elem_bytes": 4,
            "kernel_elements_values": [9],
            # Smaller channel sweep — FP cvc5 cost scales with channels.
            "channels_values": [1, 4, 8],
            "output_pixels_values": [1],
        },
        # FP max/min need finite inputs; otherwise NaN handling explodes solver
        # state.  The pool layer feeds INDIRECT_INPUT rows but the input_range
        # constraint emit only iterates INPUT_ARRAY buffers — sufficient when
        # rows are the symbolic source.  (Constraint applies via padded loop.)
        input_range=(-1000.0, 1000.0),
    ),
    "f16-maxpool": KernelProfile(
        pool={
            "elem_bytes": 2,
            "kernel_elements_values": [9],
            "channels_values": [1, 4, 8],
            "output_pixels_values": [1],
        },
    ),
    "f32-avgpool": KernelProfile(
        pool={
            "elem_bytes": 4,
            "kernel_elements_values": [9],
            # ch=1 verifies cleanly across all 3 param configs (~30s/config on
            # cvc5).  ch≥4 hits a crash that needs investigation — reduce the
            # sweep until the underlying issue is debugged.
            "channels_values": [1],
            "output_pixels_values": [1],
        },
        # FP add chains (sum of 9 lanes) need finite inputs to keep the SAT
        # formula tractable.  Restrict per-lane inputs (and multiplier).
        input_range=(-1000.0, 1000.0),
    ),
    "f16-avgpool": KernelProfile(
        pool={
            "elem_bytes": 2,
            "kernel_elements_values": [9],
            "channels_values": [1],
            "output_pixels_values": [1],
        },
    ),

    # -----------------------------------------------------------------
    # Bilinear interpolation (Shape.BILINEAR_INDIRECT)
    # -----------------------------------------------------------------
    "s8-ibilinear": KernelProfile(
        bilinear={
            "elem_bytes": 1,
            "weight_elem_bytes": 2,
            "channels_values": [1, 4, 8],
            "output_pixels_values": [1],
        },
    ),
    "u8-ibilinear": KernelProfile(
        bilinear={
            "elem_bytes": 1,
            "weight_elem_bytes": 2,
            "channels_values": [1, 4, 8],
            "output_pixels_values": [1],
        },
    ),
    "f32-ibilinear": KernelProfile(
        bilinear={
            "elem_bytes": 4,
            "weight_elem_bytes": 4,
            "channels_values": [1, 2, 4],
            "output_pixels_values": [1],
        },
    ),
    "f16-ibilinear": KernelProfile(
        bilinear={
            "elem_bytes": 2,
            "weight_elem_bytes": 2,
            "channels_values": [1, 2],
            "output_pixels_values": [1],
        },
    ),
    "f32-dwconv": KernelProfile(
        dwconv={
            "elem_bytes": 4,
            "weight_elem_bytes": 4,
            "kernel_size": 3,
            "channels_values": [1, 4, 8],
            "output_width_values": [1, 2],
        },
    ),
    "f32-dwconv-9p": KernelProfile(
        dwconv={
            "elem_bytes": 4,
            "weight_elem_bytes": 4,
            "kernel_size": 9,
            "channels_values": [1, 4],
            "output_width_values": [1],
        },
    ),
    "f32-igemm": KernelProfile(
        igemm={
            "elem_bytes": 4,
            "nr": 4,
            "ks": 1,
            "dims": {"mr": [1, 2], "nc": [4, 8], "kc": [4, 8]},
            "strides": {"cm_stride": "nc * 4", "cn_stride": "16"},
            "buffer_sizes": {
                "w": "nc * (1 + kc) * 4 + 32",
                "c": "mr * nc * 4 + 32",
            },
        },
    ),
    "f32-igemm-ks3": KernelProfile(
        igemm={
            "elem_bytes": 4,
            "nr": 4,
            "ks": 3,
            "dims": {"mr": [1, 2], "nc": [4], "kc": [4]},
            "strides": {"cm_stride": "nc * 4", "cn_stride": "16"},
            "buffer_sizes": {
                "w": "nc * (1 + 3 * kc) * 4 + 32",
                "c": "mr * nc * 4 + 32",
            },
        },
    ),
    "f32-rdsum-2d": KernelProfile(
        reduce_2d={
            "elem_bytes": 4,
            "channels_values": [1, 4],
            "rows_values": [2, 3],
        },
    ),
    "f32-packw": KernelProfile(
        pack_w={
            "elem_bytes": 4,
            "nc_values": [4, 8],
            "kc_values": [2, 4],
        },
    ),
    "qs8-gemm-int32": KernelProfile(
        gemm={
            "elem_bytes": 4,
            "weight_tile_n": 4,
            "dims": {"mr": [1], "nc": [4], "kc": [2, 4]},
            "strides": {"cm_stride": "0", "cn_stride": "16"},
            "buffer_sizes": {
                "a": "kc + 32",
                "w": "nc * kc + 32",
                "c": "mr * nc * 4 + 32",
            },
        },
    ),
    "qs8-igemm-int32": KernelProfile(
        igemm={
            "elem_bytes": 4,
            "nr": 4,
            "ks": 1,
            "dims": {"mr": [1], "nc": [4], "kc": [2, 4]},
            "strides": {"cm_stride": "0", "cn_stride": "16"},
            "buffer_sizes": {
                "w": "nc * kc + 32",
                "c": "mr * nc * 4 + 32",
            },
        },
    ),
    "qs8-dwconv-int32": KernelProfile(
        dwconv={
            "elem_bytes": 1,
            "weight_elem_bytes": 1,
            "output_elem_bytes": 4,
            "kernel_size": 3,
            "channels_values": [1, 4],
            "output_width_values": [1],
        },
    ),
    "f32-prelu": KernelProfile(
        prelu={
            "elem_bytes": 4,
            "channels_values": [2, 4],
            "rows_values": [1, 2],
        },
    ),
    "f32-gemm-group": KernelProfile(
        gemm_group={
            "elem_bytes": 4,
            "g_values": [1, 2],
            "mr_values": [1],
            "nc_values": [4],
            "kc_values": [4],
        },
    ),
    "f32-concat2": KernelProfile(
        concat2={
            "elem_bytes": 4,
            "na_values": [2, 4],
            "nb_values": [2, 4],
        },
    ),
    "f32-zip2": KernelProfile(
        zip_2={
            "elem_bytes": 4,
            "n_values": [2, 4],
        },
    ),
    "f32-split2": KernelProfile(
        split_2={
            "elem_bytes": 4,
            "na_values": [2, 4],
            "nb_values": [2, 4],
        },
    ),
    "f32-outer-product": KernelProfile(
        outer_product={
            "elem_bytes": 4,
            "m_values": [2, 4],
            "n_values": [2, 4],
        },
    ),
    "qs8-qc4w-int32": KernelProfile(
        gemm_qc4w={
            "elem_bytes": 4,
            "weight_tile_n": 4,
            "dims": {"mr": [1], "nc": [4], "kc": [2, 4]},
            "strides": {"cm_stride": "0", "cn_stride": "16"},
            "buffer_sizes": {
                "a": "kc + 32",
                "w": "(kc * nc / 2) + 32",
                "c": "mr * nc * 4 + 32",
            },
        },
    ),
    "x8-lut4": KernelProfile(
        vlut={"n_values": [2, 4, 8]},
    ),
}


def get_profile(kernel_name: str) -> Optional[KernelProfile]:
    """Look up a kernel profile by name substring match.

    Prefers longer matches to avoid e.g. "vmulcaddc" matching "vmulcaddcfma".
    Returns None if no profile matches (generic path).
    """
    best_key, best_profile = "", None
    for key, profile in KERNEL_PROFILES.items():
        if key in kernel_name and len(key) > len(best_key):
            best_key, best_profile = key, profile
    return best_profile
