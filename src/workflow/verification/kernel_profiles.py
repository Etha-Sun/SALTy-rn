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


# ---------------------------------------------------------------------------
# Registry
# ---------------------------------------------------------------------------
KERNEL_PROFILES: dict[str, KernelProfile] = {
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
