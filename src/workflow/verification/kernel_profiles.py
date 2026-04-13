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
    # Layout
    layout: str = "1D"              # "1D" or "2D"
    secondary_dim: str = ""         # name of secondary dimension arg (e.g., "channels", "nc")

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

    # Optional FP input range constraint.  When set, each symbolic f32/f64
    # input lane is constrained to lie in [min, max] via FP_GEQ/FP_LEQ.
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
        layout="2D",
        secondary_dim="channels",
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
        layout="2D",
        secondary_dim="channels",
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
