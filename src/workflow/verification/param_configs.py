"""
Auto-generate edge-case parameter configurations for verification.

Given a params struct type name, generates multiple concrete configurations
that cover boundary values, zero crossings, and common edge cases.
"""

from dataclasses import dataclass
from itertools import product

# ---------------------------------------------------------------------------
# Edge values per field type
# ---------------------------------------------------------------------------
EDGE_VALUES = {
    "int8_t":       [-128, -1, 0, 1, 127],
    "uint8_t":      [0, 1, 127, 255],
    "int16_t":      [-128, -1, 0, 1, 127],      # stay in int8 range for sanity
    "uint16_t":     [0, 1, 255],
    "int32_t":      [-1, 0, 1, 127],
    "uint32_t":     [0, 1, 31],
    "float":        [0.0, 1.0, 0.5],
    "xnn_float16":  [0.0, 1.0, 0.5],            # constructor takes float
}

# ---------------------------------------------------------------------------
# Per-field semantic edge cases (override generic type-based values)
# ---------------------------------------------------------------------------
FIELD_EDGES = {
    # Shift fields — 0 disables rounding, max meaningful is ~31
    "shift":         [0, 1, 4, 8, 15],
    "right_pre_shift":  [0, 1, 8],
    "right_post_shift": [0, 1, 8],

    # Multipliers — 1 is identity, test small and large
    "a_multiplier":  [1, 3, 127],
    "b_multiplier":  [1, 2, 64],
    "multiplier":    [1, 3, 127],
    "positive_multiplier": [1, 100],
    "negative_multiplier": [1, 50],

    # Zero points — 0 is common, test nonzero
    "a_zero_point":      [0, 1, -5],
    "b_zero_point":      [0, 1, 5],
    "input_zero_point":  [0, 1, -10],
    "output_zero_point": [0, 5, -5],
    "zero_point":        [0, 1, -5],
    "kernel_zero_point": [0, 1, 128],

    # Output bounds
    "output_min": [-128],    # usually fixed at type min
    "output_max": [127],     # usually fixed at type max
    "min":        [-128],
    "max":        [127],

    # FP scales
    "scale":     [0.5, 1.0, 2.0],
    "inv_scale": [0.5, 1.0, 2.0],
    "prescale":  [1.0],
    "alpha":     [1.0],
    "beta":      [1.0],
    "slope":     [0.1, 0.5, 1.0],

    # Bias
    "bias": [0],

    # Magic bias (NEON-specific conversion trick)
    "magic_bias": [12582912.0],
    "magic_bias_less_output_zero_point": [0x4B400000],
    "magic_bias_less_zero_point":        [0x4B400000],

    # Rounding (RNDNU quantization)
    "rounding":  [0],

    # Padding (filler bytes, usually 0)
    "padding": [0],
}

# ---------------------------------------------------------------------------
# Struct definitions — field names and types per params struct
# ---------------------------------------------------------------------------
PARAMS_FIELDS = {
    "xnn_qs8_add_minmax_params": {
        "member": "scalar",
        "fields": [
            ("int8_t",  "a_zero_point"),
            ("int8_t",  "b_zero_point"),
            ("int32_t", "bias"),
            ("int32_t", "a_multiplier"),
            ("int32_t", "b_multiplier"),
            ("int32_t", "shift"),
            ("int16_t", "output_zero_point"),
            ("int8_t",  "output_min"),
            ("int8_t",  "output_max"),
        ],
    },
    "xnn_qu8_add_minmax_params": {
        "member": "scalar",
        "fields": [
            ("uint8_t", "a_zero_point"),
            ("uint8_t", "b_zero_point"),
            ("int32_t", "bias"),
            ("int32_t", "a_multiplier"),
            ("int32_t", "b_multiplier"),
            ("int32_t", "shift"),
            ("int16_t", "output_zero_point"),
            ("uint8_t", "output_min"),
            ("uint8_t", "output_max"),
        ],
    },
    "xnn_qs8_mul_minmax_params": {
        "member": "scalar",
        "fields": [
            ("int8_t",  "a_zero_point"),
            ("int8_t",  "b_zero_point"),
            ("float",   "scale"),
            ("int16_t", "output_zero_point"),
            ("int8_t",  "output_min"),
            ("int8_t",  "output_max"),
        ],
    },
    "xnn_f32_default_params": {
        "member": None,
        "fields": [],
    },
    "xnn_f32_minmax_params": {
        "member": "scalar",
        "fields": [
            ("float", "min"),
            ("float", "max"),
        ],
    },
    "xnn_qs8_cvt_params": {
        "member": "scalar",
        "fields": [
            ("int16_t", "input_zero_point"),
            ("int32_t", "multiplier"),
            ("int16_t", "output_zero_point"),
        ],
    },
    "xnn_qs8_lrelu_params": {
        "member": "scalar",
        "fields": [
            ("int32_t", "input_zero_point"),
            ("int32_t", "positive_multiplier"),
            ("int32_t", "negative_multiplier"),
            ("int32_t", "output_zero_point"),
        ],
    },
    "xnn_f32_qs8_cvt_params": {
        "member": "scalar",
        "fields": [
            ("float",   "scale"),
            ("int16_t", "output_zero_point"),
        ],
    },
    "xnn_qs8_f32_cvt_params": {
        "member": "scalar",
        "fields": [
            ("int32_t", "zero_point"),
            ("float",   "scale"),
        ],
    },
    "xnn_f32_elu_params": {
        "member": "scalar",
        "fields": [
            ("float", "prescale"),
            ("float", "alpha"),
            ("float", "beta"),
        ],
    },
    "xnn_f32_lrelu_params": {
        "member": "scalar",
        "fields": [
            ("float", "slope"),
        ],
    },
    "xnn_qs8_rsum_params": {
        "member": None,
        "fields": [],
    },
    # --- s8/u8 minmax ---
    "xnn_s8_minmax_params": {
        "member": "scalar",
        "fields": [
            ("int32_t", "min"),
            ("int32_t", "max"),
        ],
    },
    "xnn_u8_minmax_params": {
        "member": "scalar",
        "fields": [
            ("uint32_t", "min"),
            ("uint32_t", "max"),
        ],
    },
    # --- conv/gemm params (union — use most common NEON member) ---
    "xnn_qu8_conv_minmax_params": {
        "member": "fp32_neon",
        "fields": [
            ("uint8_t",  "kernel_zero_point"),
            ("float",    "scale"),
            ("float",    "magic_bias"),
            ("int32_t",  "magic_bias_less_output_zero_point"),
            ("uint8_t",  "output_min"),
            ("uint8_t",  "output_max"),
        ],
    },
    "xnn_qs8_conv_minmax_params": {
        "member": "fp32_neonv8",
        "fields": [
            ("float",   "scale"),
            ("int16_t", "output_zero_point"),
            ("int8_t",  "output_min"),
            ("int8_t",  "output_max"),
        ],
    },
    "xnn_qs8_qc8w_conv_minmax_params": {
        "member": "fp32_neon",
        "fields": [
            ("float",   "magic_bias"),
            ("int32_t", "magic_bias_less_output_zero_point"),
            ("int8_t",  "output_min"),
            ("int8_t",  "output_max"),
        ],
    },
    # --- qc4w ---
    "xnn_f32_qc4w_minmax_params": {
        "member": "scalar",
        "fields": [
            ("float",   "min"),
            ("float",   "max"),
            ("int32_t", "kernel_zero_point"),
        ],
    },
    # --- flat structs (no nested member) ---
    "xnn_qd8_quantization_params": {
        "member": None,
        "fields": [
            ("int32_t", "zero_point"),
            ("float",   "inv_scale"),
        ],
    },
    "xnn_qs8_qc4w_packing_params": {
        "member": None,
        "fields": [
            ("int8_t",  "input_zero_point"),
            ("uint8_t", "kernel_zero_point"),
        ],
    },
    # --- empty/default params ---
    "xnn_f16_default_params": {
        "member": None,
        "fields": [],
    },
    # --- f16 params (use float edges; xnn_float16 wraps uint16_t) ---
    "xnn_f16_minmax_params": {
        "member": "scalar",
        "fields": [
            ("float", "min"),
            ("float", "max"),
        ],
    },
    "xnn_f16_f32acc_scale_params": {
        "member": "scalar",
        "fields": [
            ("float", "scale"),
        ],
    },
    "xnn_qs8_f16_cvt_params": {
        "member": "scalar",
        "fields": [
            ("int16_t",      "zero_point"),
            ("xnn_float16",  "scale"),
        ],
    },
    "xnn_f16_lrelu_params": {
        "member": "scalar",
        "fields": [
            ("xnn_float16", "slope"),
        ],
    },
    "xnn_f16_elu_params": {
        "member": "scalar",
        "fields": [
            ("xnn_float16", "prescale"),
            ("xnn_float16", "alpha"),
            ("xnn_float16", "beta"),
        ],
    },
    "xnn_f16_scale_params": {
        "member": "scalar",
        "fields": [
            ("xnn_float16", "scale"),
        ],
    },
    "xnn_f16_qs8_cvt_params": {
        "member": "scalar",
        "fields": [
            ("xnn_float16", "scale"),
            ("int16_t",     "output_zero_point"),
        ],
    },
}


def get_edge_values(field_type: str, field_name: str) -> list:
    """Get edge-case values for a field, preferring semantic over generic."""
    if field_name in FIELD_EDGES:
        return FIELD_EDGES[field_name]
    return EDGE_VALUES.get(field_type, [0])


def generate_configs(params_type: str, max_configs: int = 10) -> list[dict]:
    """Generate edge-case configurations for a params struct.

    Returns a list of dicts, each mapping field_name → value.
    Uses a mix of: default config, per-field edge sweeps, and corner combos.
    """
    # Clean up type name (remove struct/union prefix)
    clean_type = params_type.replace("struct ", "").replace("union ", "").strip()

    spec = PARAMS_FIELDS.get(clean_type)
    if not spec or not spec["fields"]:
        # No params or unknown struct — return one empty config
        return [{}]

    fields = spec["fields"]
    configs = []

    # Config 0: default (middle-of-range values)
    default = {}
    for ftype, fname in fields:
        edges = get_edge_values(ftype, fname)
        # Pick a "safe default" — not 0 for multipliers, 0 for zero points
        if "multiplier" in fname:
            default[fname] = edges[0] if edges[0] != 0 else 1
        elif "min" in fname:
            default[fname] = edges[0]
        elif "max" in fname:
            default[fname] = edges[-1]
        else:
            default[fname] = edges[len(edges) // 2]  # middle value
    configs.append(default)

    # Configs 1-N: sweep each field independently
    for ftype, fname in fields:
        edges = get_edge_values(ftype, fname)
        for val in edges:
            cfg = dict(default)
            cfg[fname] = val
            if cfg not in configs:
                configs.append(cfg)
            if len(configs) >= max_configs:
                return configs

    return configs[:max_configs]


def config_to_cpp(params_type: str, config: dict) -> str:
    """Convert a config dict to C++ params initialization code."""
    clean_type = params_type.replace("struct ", "").replace("union ", "").strip()
    spec = PARAMS_FIELDS.get(clean_type)
    if not spec or not spec["fields"]:
        return "    // No params to initialize"

    member = spec["member"]
    lines = []
    for ftype, fname in spec["fields"]:
        val = config.get(fname, 0)
        prefix = f"params.{member}" if member else "params"
        if ftype in ("float", "xnn_float16"):
            lines.append(f"    {prefix}.{fname} = {float(val)}f;")
        else:
            lines.append(f"    {prefix}.{fname} = {val};")
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    import sys
    params_type = sys.argv[1] if len(sys.argv) > 1 else "xnn_qs8_add_minmax_params"
    configs = generate_configs(params_type)
    print(f"Generated {len(configs)} configs for {params_type}:\n")
    for i, cfg in enumerate(configs):
        print(f"--- Config {i} ---")
        print(config_to_cpp(params_type, cfg))
        print()
