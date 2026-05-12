"""
Buffer size inference for verification harness generation.

Auto-infers sizes for common patterns. Falls back to LLM for
GEMM/DWCONV/pooling kernels where sizes depend on multiple dimensions.
"""

import json
import logging
import re
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Optional

from .sig_parser import FuncSignature, FuncArg, ArgRole, ElemType, SCALAR_VALUE_ROLES
from .kernel_profiles import get_profile, KernelProfile
from .source_facts import MemoryLayout

log = logging.getLogger("pipeline")


# ---------------------------------------------------------------------------
# Shape model
# ---------------------------------------------------------------------------
# INDIRECT_GEMM is intentionally omitted — fail loudly until a GEMM kernel
# actually needs first-class support.

class Shape(Enum):
    FLAT_1D = auto()
    ROW_CHAN_2D = auto()
    SPATIAL_HWC_CHW = auto()
    # GEMM_DIRECT_FP: float/bf16 GEMMs with `mr/nc/kc` + direct `const T* a` +
    # `cm_stride/cn_stride` + packed weights. Sibling shapes for quantized
    # output and indirect input get added when those kernels land.
    GEMM_DIRECT_FP = auto()
    # REDUCE_1D: N→k reductions where k is small (1 for rsum/qs8-rsum, 2 for
    # rminmax).  Same kernel-side signature as FLAT_1D (single batch + flat
    # input + small output + params) but the OUTPUT semantics differ: the
    # kernel reads-modifies-writes a small fixed-size accumulator that the
    # caller pre-initializes (e.g. {0.0f} for rsum, {+INF, -INF} for minmax).
    # Discriminated from FLAT_1D by an explicit profile.reduce field.
    REDUCE_1D = auto()
    # TRANSPOSE_2D: in-place 2D transpose with byte-strides.  Canonical
    # signature: (input, output, input_stride, output_stride, block_width,
    # block_height).  output[r][c] = input[c][r] for r ∈ [0, block_width),
    # c ∈ [0, block_height).  Pure BV (no FP).  Sweep is the cross product of
    # block_width × block_height fixtures from profile.transpose.blocks.
    TRANSPOSE_2D = auto()
    # POOL_INDIRECT: pooling kernels (max-pool, avg-pool) with indirect input.
    # Canonical signature: (output_pixels, kernel_elements, channels,
    # const T** input, input_offset, input_pixel_stride, T* output,
    # input_increment, output_increment, params).  `input` is an array of
    # `kernel_elements` row pointers; each row holds `channels` elements at
    # `input_offset` byte offset.  Sibling shape POOL_INDIRECT_AVG handles
    # avgpool's extra zero/multiplier args.
    POOL_INDIRECT = auto()
    # BILINEAR_INDIRECT: bilinear-interp kernels with indirect input.
    # Canonical signature: (output_pixels, channels, const T** input,
    # input_offset, const TW* weights, T* output, output_increment).
    # `input` is `output_pixels * 4` row pointers (TL, TR, BL, BR per pixel);
    # `weights` is `output_pixels * 2` values (αh, αv per pixel).  Distinguished
    # from POOL_INDIRECT by the presence of a `weights` arg + absence of
    # `kernel_elements`.
    BILINEAR_INDIRECT = auto()
    # DWCONV_INDIRECT: depthwise conv; bake-time kernel_size; sweeps channels + output_width.
    DWCONV_INDIRECT = auto()
    # IGEMM_INDIRECT_FP: indirect-input GEMM (conv-via-im2col); bake-time ks/nr; sweeps mr/nc/kc.
    IGEMM_INDIRECT_FP = auto()
    UNCLASSIFIED = auto()


@dataclass
class DimSpec:
    """One logical sweep dimension driving the harness.

    Logical dims are what the verifier loops over.  They aren't necessarily
    kernel arguments — conv-hwc2chw sweeps `output_rows` but the kernel
    takes `output_y_start`/`output_y_end`, bound via ShapePlan.arg_bindings.
    """
    name: str
    unit: str = "elements"            # "elements" or "bytes"
    values: Optional[list] = None
    start: Optional[str] = None
    end: Optional[str] = None
    step: int = 1


@dataclass
class BufferSpec:
    """Specification for one symbolic buffer in the harness.

    `layout` describes the buffer's physical layout (flat / split). Orthogonal
    to ShapePlan (which describes the verifier sweep dimensions).
    """
    arg_name: str
    role: ArgRole
    elem_type: ElemType
    size_expr: str       # C++ expression for byte size (e.g., "batch * 1", "kc * nc * 4")
    is_symbolic: bool    # True = symbolic (solver explores all values), False = concrete/zero
    note: str = ""
    layout: MemoryLayout = field(default_factory=MemoryLayout)


@dataclass
class ShapePlan:
    """Deterministic plan for driving a kernel of a known shape.

    Describes how the verifier sweeps dimensions. Orthogonal to MemoryLayout
    on each BufferSpec (which describes how individual buffers are laid out
    in physical storage).
    """
    shape: Shape
    sweep_dims: list[DimSpec] = field(default_factory=list)
    arg_bindings: dict[str, str] = field(default_factory=dict)
    buffer_plans: dict[str, BufferSpec] = field(default_factory=dict)
    unresolved: list[str] = field(default_factory=list)

    # C++ decls emitted verbatim at top of verify().
    alloc_decls: list[str] = field(default_factory=list)

    # Names of C++ locals the buffer decl/register sites reference.
    # alloc_count_name = over-allocated vector size (tail slack);
    # count_name = logical count for compare loop bounds.
    alloc_count_name: str = "padded"
    count_name: str = "padded"


@dataclass
class HarnessSpec:
    """Complete specification for generating a verification harness."""
    kernel_name: str
    neon_func_name: str
    rvv_func_name: str
    params_type: str
    buffers: list[BufferSpec]
    scalar_args: dict[str, str]
    elem_bytes: int
    element_kind: str
    shape_plan: "ShapePlan"
    needs_llm: bool = False
    vlen: int = 256
    arg_order: list[dict] = None
    profile: Optional[KernelProfile] = None
    batch_unit_bytes: int = 1   # multiplier at kernel call site; 1 = batch is element count

    @property
    def sweep_arg(self) -> str:
        return self.shape_plan.sweep_dims[0].name

    @property
    def sweep_is_bytes(self) -> bool:
        return self.shape_plan.sweep_dims[0].unit == "bytes"

    @property
    def is_2d(self) -> bool:
        return self.shape_plan.shape == Shape.ROW_CHAN_2D

    @property
    def is_spatial(self) -> bool:
        return self.shape_plan.shape == Shape.SPATIAL_HWC_CHW

    @property
    def is_gemm(self) -> bool:
        return self.shape_plan.shape == Shape.GEMM_DIRECT_FP

    @property
    def is_reduce(self) -> bool:
        return self.shape_plan.shape == Shape.REDUCE_1D

    @property
    def is_transpose(self) -> bool:
        return self.shape_plan.shape == Shape.TRANSPOSE_2D

    @property
    def is_pool(self) -> bool:
        return self.shape_plan.shape == Shape.POOL_INDIRECT

    @property
    def is_bilinear(self) -> bool:
        return self.shape_plan.shape == Shape.BILINEAR_INDIRECT

    @property
    def is_dwconv(self) -> bool:
        return self.shape_plan.shape == Shape.DWCONV_INDIRECT

    @property
    def is_igemm(self) -> bool:
        return self.shape_plan.shape == Shape.IGEMM_INDIRECT_FP

    @property
    def secondary_dim(self) -> str:
        """Name of the second sweep dim (empty for FLAT_1D / UNCLASSIFIED)."""
        if len(self.shape_plan.sweep_dims) >= 2:
            return self.shape_plan.sweep_dims[1].name
        return ""


# ---------------------------------------------------------------------------
# Shape classification + planning
# ---------------------------------------------------------------------------

def classify_shape(sig: FuncSignature,
                   profile: Optional[KernelProfile] = None) -> Shape:
    """Classify a kernel's access-pattern shape from its signature.

    Signature-only dispatch.  Returns UNCLASSIFIED when no known shape matches;
    callers decide whether to fall back to the LLM advisor or fail loudly.
    """
    arg_names = {a.name for a in sig.args}

    # IGEMM_INDIRECT_FP: mr+nc+kc + ks + indirect `a` (const T**).
    # Check before GEMM_DIRECT_FP since both have the mr/nc/kc trio.
    has_gemm_dims = {"mr", "nc", "kc"}.issubset(arg_names)
    has_gemm_strides = {"cm_stride", "cn_stride"}.issubset(arg_names)
    has_indirect = any(a.is_double_pointer for a in sig.args)
    if has_gemm_dims and "ks" in arg_names and has_indirect:
        return Shape.IGEMM_INDIRECT_FP

    # GEMM_DIRECT_FP: mr+nc+kc + cm_stride+cn_stride + direct (non-indirect) input.
    if has_gemm_dims and has_gemm_strides and not has_indirect:
        return Shape.GEMM_DIRECT_FP

    # SPATIAL: HWC→CHW conv kernels have both `input_height` and `input_width`.
    # These are the load-bearing spatial dims — no other shape uses both.
    if "input_height" in arg_names and "input_width" in arg_names:
        return Shape.SPATIAL_HWC_CHW

    # ROW_CHAN_2D: kernels with `rows` + `channels` + at least one stride arg.
    has_rows = "rows" in arg_names
    has_channels = "channels" in arg_names
    has_stride = any(a.role == ArgRole.STRIDE for a in sig.args)
    if has_rows and has_channels and has_stride:
        return Shape.ROW_CHAN_2D

    # TRANSPOSE_2D: 2D transpose with strided input/output.  All four
    # transpose-specific arg names must be present (no overlap with any other
    # shape — no need for a profile gate).
    if {"block_width", "block_height", "input_stride", "output_stride"}.issubset(arg_names):
        return Shape.TRANSPOSE_2D

    # DWCONV_INDIRECT: depthwise conv — has `output_width`+`channels`+`weights`+
    # `const T**` + `input_stride`+`input_pixel_stride`.  Distinct from
    # POOL (no `kernel_elements`) and BILINEAR (uses `output_pixels`, not `output_width`).
    # Check before POOL/BILINEAR; gated on profile.dwconv being set.
    if (profile is not None and getattr(profile, "dwconv", None) is not None
            and {"output_width", "channels", "weights"}.issubset(arg_names)
            and any(a.is_double_pointer for a in sig.args)):
        return Shape.DWCONV_INDIRECT

    # BILINEAR_INDIRECT: ibilinear kernels — same `output_pixels`+`channels`+
    # `const T**` as POOL, but with a `weights` array and NO `kernel_elements`.
    # Check this BEFORE POOL_INDIRECT.
    if ({"output_pixels", "channels", "weights"}.issubset(arg_names)
            and "kernel_elements" not in arg_names
            and any(a.is_double_pointer for a in sig.args)):
        return Shape.BILINEAR_INDIRECT

    # POOL_INDIRECT: pooling kernels with indirect input.  Discriminator: the
    # canonical pool arg trio + a `const T**` input arg.  GEMM/IGEMM also use
    # const T** but they have mr/nc/kc — checked above already.
    if ({"output_pixels", "kernel_elements", "channels"}.issubset(arg_names)
            and any(a.is_double_pointer for a in sig.args)):
        return Shape.POOL_INDIRECT

    # REDUCE_1D: profile-declared reduction (rsum / rminmax / etc.).  Same
    # surface signature as FLAT_1D — discriminated only by profile.reduce.
    if profile is not None and getattr(profile, "reduce", None) is not None:
        return Shape.REDUCE_1D

    # FLAT_1D: kernels with a single batch-ish scalar and flat input/output.
    # Require a BATCH-role arg and no strides (strides → 2D or spatial).
    if sig.batch_arg is not None and not has_stride:
        return Shape.FLAT_1D

    return Shape.UNCLASSIFIED


def build_shape_plan(shape: Shape, sig: FuncSignature,
                     profile: Optional[KernelProfile] = None,
                     scalar_args: Optional[dict] = None,
                     kernel_name: str = "") -> ShapePlan:
    """Build a deterministic ShapePlan for a classified shape.

    scalar_args carries the concrete defaults the builders need to emit the
    right call-time bindings for FLAT_1D (where strides/SCALAR_SIZE args get
    passed as literal values matching the legacy emitter).

    kernel_name is used by the SPATIAL builder as a fallback when the kernel's
    function has been renamed away from the XNNPACK `3x3s2p1c3x4` naming.
    """
    scalar_args = scalar_args or {}
    if shape == Shape.FLAT_1D:
        return _flat_1d_plan(sig, profile, scalar_args)
    if shape == Shape.ROW_CHAN_2D:
        return _row_chan_2d_plan(sig, profile, scalar_args)
    if shape == Shape.SPATIAL_HWC_CHW:
        return _spatial_hwc_chw_plan(sig, profile, kernel_name)
    if shape == Shape.GEMM_DIRECT_FP:
        return _gemm_direct_fp_plan(sig, profile, scalar_args)
    if shape == Shape.REDUCE_1D:
        return _reduce_1d_plan(sig, profile, scalar_args)
    if shape == Shape.TRANSPOSE_2D:
        return _transpose_2d_plan(sig, profile, scalar_args)
    if shape == Shape.POOL_INDIRECT:
        return _pool_indirect_plan(sig, profile, scalar_args)
    if shape == Shape.BILINEAR_INDIRECT:
        return _bilinear_indirect_plan(sig, profile, scalar_args)
    if shape == Shape.DWCONV_INDIRECT:
        return _dwconv_indirect_plan(sig, profile, scalar_args)
    if shape == Shape.IGEMM_INDIRECT_FP:
        return _igemm_indirect_fp_plan(sig, profile, scalar_args)
    return _unclassified_plan(sig)


def _flat_1d_plan(sig: FuncSignature, profile: Optional[KernelProfile],
                  scalar_args: dict) -> ShapePlan:
    """FLAT_1D: single sweep dim = the kernel's batch argument."""
    batch_name = sig.batch_arg.name if sig.batch_arg else "batch"
    sweep = [DimSpec(name=batch_name, unit="elements")]

    # BATCH → sweep variable; other scalar roles → concrete literal from
    # scalar_args (matches the legacy `spec.scalar_args.get(name, "0")`
    # at the call site).
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        bindings[a.name] = a.name if a.role == ArgRole.BATCH else scalar_args.get(a.name, "0")

    # alloc_count_name / count_name default to "padded", so omit.
    return ShapePlan(
        shape=Shape.FLAT_1D,
        sweep_dims=sweep,
        arg_bindings=bindings,
        alloc_decls=[f"size_t padded = (({batch_name} + 15) / 16) * 16 + 16;"],
    )


def _row_chan_2d_plan(sig: FuncSignature, profile: Optional[KernelProfile],
                      scalar_args: dict) -> ShapePlan:
    """ROW_CHAN_2D: sweep rows + channels.  Mirrors today's 2D emitter path."""
    sweep = [
        DimSpec(name="rows", unit="elements"),
        DimSpec(name="channels", unit="bytes"),  # vmulcaddc* measures channels in bytes
    ]

    out_arg = sig.output_args[0] if sig.output_args else None
    eb = (out_arg.elem_type.byte_size if out_arg else 1) or 1
    pad = profile.pad_bytes if profile else 16

    alloc_decls = [
        f"size_t num_elems_per_row = channels / {eb};",
        f"size_t total_elems = rows * num_elems_per_row;",
        f"size_t total_bytes = total_elems * {eb};",
        f"size_t padded_row_bytes = channels + {pad};  // pad for SIMD tail over-read",
        f"size_t padded_total_elems = rows * (padded_row_bytes / {eb});",
    ]

    # Strides are bound to `padded_row_bytes` so the kernel's row-to-row
    # addressing matches the padded allocation above.
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        if a.role == ArgRole.BATCH:
            bindings[a.name] = a.name
        elif a.role == ArgRole.SCALAR_SIZE and a.name == "channels":
            bindings[a.name] = "channels"
        elif a.role == ArgRole.STRIDE:
            bindings[a.name] = "padded_row_bytes"
        else:
            bindings[a.name] = scalar_args.get(a.name, "0")

    # Populate buffer_plans for the ARRAY-shaped buffers using padded sizes.
    # Weights stay unresolved (size_inferrer's _infer_weight_size handles those
    # downstream from the profile, falling back to LLM when unknown).
    buf_plans: dict[str, BufferSpec] = {}
    for a in sig.args:
        if a.role in (ArgRole.INPUT_ARRAY, ArgRole.OUTPUT, ArgRole.ZERO_BUFFER):
            arg_eb = (a.elem_type.byte_size or 1)
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name,
                role=a.role,
                elem_type=a.elem_type,
                size_expr=f"padded_total_elems * {arg_eb} + 32",
                is_symbolic=(a.role != ArgRole.ZERO_BUFFER),
            )

    return ShapePlan(
        shape=Shape.ROW_CHAN_2D,
        sweep_dims=sweep,
        arg_bindings=bindings,
        alloc_decls=alloc_decls,
        alloc_count_name="padded_total_elems",
        count_name="total_elems",
        buffer_plans=buf_plans,
        unresolved=[],
    )


_CONV_NAME_RE = re.compile(
    r'(?P<kh>\d+)x(?P<kw>\d+)s(?P<stride>\d+)p(?P<pad>\d+)'
    r'c(?P<in_ch>\d+)x(?P<out_tile>\d+)')

# SPATIAL sweep/sizing heuristics.  Minimum output_cols keeps the SIMD tail
# non-trivial; multipliers exercise both the single-tile and multi-tile paths.
_SPATIAL_MIN_OUTPUT_COLS = 2
_SPATIAL_OUT_CHAN_MULTIPLIERS = (1, 2)


def _parse_conv_shape(func_name: str) -> Optional[dict]:
    """Extract (kH, kW, stride, pad, input_channels, output_channel_tile) from
    the XNNPACK conv naming convention (e.g. `3x3s2p1c3x4`).  None if the
    name doesn't match — caller should fall back to `unresolved`.
    """
    m = _CONV_NAME_RE.search(func_name)
    if not m:
        return None
    return {k: int(v) for k, v in m.groupdict().items()}


def _spatial_hwc_chw_plan(sig: FuncSignature, profile: Optional[KernelProfile],
                            kernel_name: str = "") -> ShapePlan:
    """SPATIAL_HWC_CHW: HWC input → CHW output conv kernels.

    Drives the plan from the XNNPACK conv naming convention (e.g.
    `3x3s2p1c3x4` encodes 3x3 kernel, stride=2, pad=1, 3 input channels,
    4-wide output-channel tile).  Tries sig.name first, then kernel_name
    (e.g. `f16-conv-hwc2chw` file stem may still carry the shape after
    the function itself is renamed).  When neither parses, falls back to
    an unresolved plan so the LLM advisor / profile can fill in.
    """
    out_arg = sig.output_args[0] if sig.output_args else None
    eb = (out_arg.elem_type.byte_size if out_arg else 2) or 2

    # Priority: explicit profile override > sig.name regex > kernel_name regex.
    conv = (profile.conv_shape if (profile and profile.conv_shape) else None) \
        or _parse_conv_shape(sig.name) \
        or _parse_conv_shape(kernel_name)
    if conv is None:
        return ShapePlan(
            shape=Shape.SPATIAL_HWC_CHW,
            sweep_dims=[
                DimSpec(name="output_rows", unit="elements"),
                DimSpec(name="output_channels", unit="elements"),
            ],
            unresolved=["arg_bindings", "buffer_plans"],
        )

    kh, kw = conv["kh"], conv["kw"]
    stride, pad = conv["stride"], conv["pad"]
    in_ch, out_tile = conv["in_ch"], conv["out_tile"]

    oc_override = profile.spatial_output_channels if profile and profile.spatial_output_channels else None
    oc_values = oc_override or [m * out_tile for m in _SPATIAL_OUT_CHAN_MULTIPLIERS]
    sweep = [
        DimSpec(name="output_rows", unit="elements", step=1),
        DimSpec(name="output_channels", unit="elements",
                values=oc_values,
                step=out_tile),
    ]

    # input_width fixed so output_cols ≥ _SPATIAL_MIN_OUTPUT_COLS.
    # input_width_const = max(_SPATIAL_MIN_OUTPUT_COLS * stride,
    #                         kw + _SPATIAL_MIN_OUTPUT_COLS)
    # Reduced to 2 to shrink the f16 FP SAT instance for bitwuzla (was 5 for 3x3s2).
    # output_width drops to 1, cutting per-batch FMAs ~3x.
    input_width_const = 2

    # Conv arithmetic (stride s, pad p, kernel kH/kW):
    #   input_height = stride*(output_rows - 1) + kH - 2*pad
    #   output_width = (input_width + 2*pad - kW) / stride + 1
    alloc_decls = [
        f"size_t input_channels = {in_ch};",
        f"size_t kernel_h = {kh}, kernel_w = {kw};",
        f"size_t conv_stride = {stride}, conv_pad = {pad};",
        f"size_t input_height = conv_stride * (output_rows - 1) + kernel_h - 2 * conv_pad;",
        f"size_t input_width = {input_width_const};",
        f"size_t output_width = (input_width + 2 * conv_pad - kernel_w) / conv_stride + 1;",
        f"size_t output_height_stride_bytes = output_width * {eb};",
        f"size_t output_channel_stride_bytes = output_rows * output_height_stride_bytes;",
        # Every buffer gets +32B of tail slack so SIMD over-reads/writes at
        # row boundaries land inside the registered buffer rather than an
        # adjacent allocation.  Same idea as ROW_CHAN_2D's `pad_bytes` field.
        f"size_t input_bytes = input_height * input_width * input_channels * {eb} + 32;",
        f"size_t zero_bytes = input_width * input_channels * {eb} + 32;",
        # XNNPACK reserves a full out_tile-sized weight group regardless of
        # output_channels, so size by ceil(output_channels / out_tile) tiles.
        # Each tile carries out_tile biases + out_tile * kH * kW * IC weights.
        f"size_t out_tiles = (output_channels + {out_tile - 1}) / {out_tile};",
        f"size_t weights_bytes = out_tiles * {out_tile} * (kernel_h * kernel_w * input_channels + 1) * {eb} + 32;",
        f"size_t output_bytes = output_channels * output_channel_stride_bytes + 32;",
    ]

    # Bindings for every scalar kernel arg.  Anything not listed falls
    # through to `unresolved` so we fail loudly instead of silently passing 0.
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n == "input_height":               bindings[n] = "input_height"
        elif n == "input_width":              bindings[n] = "input_width"
        elif n == "output_y_start":           bindings[n] = "0"
        elif n == "output_y_end":             bindings[n] = "output_rows"
        elif n == "input_padding_top":        bindings[n] = str(pad)
        elif n == "output_channels":          bindings[n] = "output_channels"
        elif n == "output_height_stride":     bindings[n] = "output_height_stride_bytes"
        elif n == "output_channel_stride":    bindings[n] = "output_channel_stride_bytes"

    # Per-buffer sizing references the alloc_decls locals.  SPATIAL has
    # one size per buffer rather than a shared alloc_count_name, so the
    # emitter reads buffer_plans[name].size_expr directly.
    buf_plans: dict[str, BufferSpec] = {}
    size_map = {
        ArgRole.INPUT_ARRAY: "input_bytes",
        ArgRole.ZERO_BUFFER: "zero_bytes",
        ArgRole.WEIGHTS:     "weights_bytes",
        ArgRole.OUTPUT:      "output_bytes",
    }
    # Weights are concrete by default — the trained-model data is fixed, so
    # verification proves the RVV kernel matches NEON for any input given
    # specific weights.  Making weights symbolic blows up the solver state
    # (conv weights = output_channels × ~28 fp16 vars × FMA propagation).
    # Input and output stay symbolic; zero is a fixed all-zeros buffer.
    non_symbolic = {ArgRole.ZERO_BUFFER, ArgRole.WEIGHTS}
    for a in sig.args:
        if a.role in size_map:
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name, role=a.role, elem_type=a.elem_type,
                size_expr=size_map[a.role],
                is_symbolic=(a.role not in non_symbolic),
            )

    unresolved = []
    missing_bindings = [a.name for a in sig.args
                       if a.role in SCALAR_VALUE_ROLES and a.name not in bindings]
    if missing_bindings:
        unresolved.append(f"arg_bindings:{','.join(missing_bindings)}")

    return ShapePlan(
        shape=Shape.SPATIAL_HWC_CHW,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
        unresolved=unresolved,
    )


def _unclassified_plan(sig: FuncSignature) -> ShapePlan:
    """UNCLASSIFIED: nothing known — advisor/profile must provide everything."""
    return ShapePlan(
        shape=Shape.UNCLASSIFIED,
        unresolved=["sweep_dims", "arg_bindings", "buffer_plans"],
    )


def _gemm_direct_fp_plan(sig: FuncSignature,
                          profile: Optional[KernelProfile],
                          scalar_args: dict) -> ShapePlan:
    """GEMM_DIRECT_FP: triple sweep over (mr, nc, kc) with packed weights.

    The profile's `gemm` dict is required — buffer sizes and strides are
    kernel-specific (each tile shape packs weights differently).
    """
    if not profile or not profile.gemm:
        return ShapePlan(
            shape=Shape.GEMM_DIRECT_FP,
            unresolved=["profile.gemm — required for GEMM_DIRECT_FP"],
        )
    g = profile.gemm

    dims = g["dims"]   # {"mr": [...], "nc": [...], "kc": [...]}
    sweep = [
        DimSpec(name="mr", unit="elements", values=dims["mr"]),
        DimSpec(name="nc", unit="elements", values=dims["nc"]),
        DimSpec(name="kc", unit="elements", values=dims["kc"]),
    ]

    strides = g["strides"]
    sizes   = g["buffer_sizes"]
    overrides = g.get("arg_bindings", {})

    # Stride locals declared at top of verify() so the output-compare loop
    # can reference cm_stride / cn_stride by name (matches the spatial pattern).
    alloc_decls: list[str] = []
    for sname, expr in strides.items():
        alloc_decls.append(f"size_t {sname} = {expr};")

    # Bind every scalar arg. Priority: profile arg_bindings > sweep dims (mr/nc/kc) >
    # strides > scalar_args default. arg_bindings is essential when the kernel arg's
    # unit differs from the sweep variable (e.g. kc-bytes vs kc-elements).
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n in overrides:
            bindings[n] = overrides[n]
        elif n in ("mr", "nc", "kc"):
            bindings[n] = n
        elif n in strides:
            bindings[n] = n  # local var of the same name
        else:
            bindings[n] = scalar_args.get(n, "0")

    # Buffer plans — one per pointer arg. Profile names match sig arg names.
    buf_plans: dict[str, BufferSpec] = {}
    is_concrete = bool(g.get("concrete_weights", False))
    for a in sig.args:
        if a.role not in (ArgRole.INPUT_ARRAY, ArgRole.OUTPUT, ArgRole.WEIGHTS):
            continue
        if a.name not in sizes:
            continue  # unresolved — caller will surface
        symbolic = a.role != ArgRole.WEIGHTS or not is_concrete
        buf_plans[a.name] = BufferSpec(
            arg_name=a.name,
            role=a.role,
            elem_type=a.elem_type,
            size_expr=sizes[a.name],
            is_symbolic=symbolic,
        )

    unresolved = []
    missing_sizes = [a.name for a in sig.args
                     if a.role in (ArgRole.INPUT_ARRAY, ArgRole.OUTPUT, ArgRole.WEIGHTS)
                        and a.name not in sizes]
    if missing_sizes:
        unresolved.append(f"buffer_sizes:{','.join(missing_sizes)}")

    return ShapePlan(
        shape=Shape.GEMM_DIRECT_FP,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
        unresolved=unresolved,
    )


def _reduce_1d_plan(sig: FuncSignature,
                     profile: Optional[KernelProfile],
                     scalar_args: dict) -> ShapePlan:
    """REDUCE_1D: single sweep dim = batch; output is a small fixed-size
    accumulator (1-2 scalars).  Caller-initialized per profile.reduce.output_init.

    Profile dict shape (see kernel_profiles.KernelProfile.reduce):
      n_outputs:    1 or 2 — number of scalar outputs the kernel writes
      output_init:  list of C literals (length = n_outputs) for caller init
      batch_unit:   "bytes" or "elements" — what the kernel's batch arg measures
    """
    if not profile or not profile.reduce:
        return ShapePlan(
            shape=Shape.REDUCE_1D,
            unresolved=["profile.reduce — required for REDUCE_1D"],
        )
    r = profile.reduce
    n_outputs = r.get("n_outputs", 1)
    batch_unit = r.get("batch_unit", "bytes")
    sweep_values = r.get("sweep", [1, 2, 3, 4, 5, 7, 8, 9, 15, 16, 17])

    input_arrays = [a for a in sig.args if a.role == ArgRole.INPUT_ARRAY]
    in_arg = input_arrays[0] if input_arrays else None
    out_arg = sig.output_args[0] if sig.output_args else None
    in_eb = (in_arg.elem_type.byte_size or 4) if in_arg else 4
    out_eb = (out_arg.elem_type.byte_size or 4) if out_arg else 4

    batch_name = sig.batch_arg.name if sig.batch_arg else "batch"
    sweep = [DimSpec(name=batch_name, unit="elements", values=sweep_values)]

    # Bind every scalar arg.  IMPORTANT: don't multiply BATCH by elem_bytes
    # here even when batch_unit=="bytes" — `_build_call_args` already does that
    # via `spec.batch_unit_bytes` (auto-detected from `batch / sizeof(T)` in
    # the kernel source).  Doing it twice gives `batch * elem_bytes^2`.
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        if a.role == ArgRole.BATCH:
            bindings[a.name] = batch_name
        else:
            bindings[a.name] = scalar_args.get(a.name, "0")

    buf_plans: dict[str, BufferSpec] = {}
    if in_arg:
        # Buffer size MUST match `padded * elem_bytes` so the input_range loop
        # (which reads `padded` lanes) stays in bounds.  Adding 16 elements to
        # batch is enough headroom for any SIMD tail over-read.
        buf_plans[in_arg.name] = BufferSpec(
            arg_name=in_arg.name,
            role=ArgRole.INPUT_ARRAY,
            elem_type=in_arg.elem_type,
            size_expr=f"({batch_name} + 16) * {in_eb}",
            is_symbolic=True,
        )
    if out_arg:
        buf_plans[out_arg.name] = BufferSpec(
            arg_name=out_arg.name,
            role=ArgRole.OUTPUT,
            elem_type=out_arg.elem_type,
            size_expr=f"{n_outputs * out_eb}",
            # Symbolic bytes are allocated normally; the harness immediately
            # overwrites them with the concrete init values from profile.reduce
            # before calling the kernel.  So the kernel sees concrete init,
            # accumulates symbolically, and the post-call value is what we
            # compare.  is_symbolic=True keeps the storage normal-mutable.
            is_symbolic=True,
        )

    # alloc_decls: one local for the input-buffer count.
    alloc_decls = [
        f"size_t padded = {batch_name} + 16;  // tail slack for SIMD over-read",
    ]

    return ShapePlan(
        shape=Shape.REDUCE_1D,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
    )


def _transpose_2d_plan(sig: FuncSignature,
                        profile: Optional[KernelProfile],
                        scalar_args: dict) -> ShapePlan:
    """TRANSPOSE_2D: in-place 2D transpose with byte-strided input/output.

    Profile dict shape (see kernel_profiles.KernelProfile.transpose):
      elem_bytes:  int (1, 2, 4, 8)
      blocks:      list of (block_width, block_height) tuples — fixtures.

    Strides are bound to packed values (no padding) so the shape verifies the
    contiguous-row case.  Sibling shapes for padded/strided cases land later.
    """
    if not profile or not profile.transpose:
        return ShapePlan(
            shape=Shape.TRANSPOSE_2D,
            unresolved=["profile.transpose — required for TRANSPOSE_2D"],
        )
    t = profile.transpose
    eb = t["elem_bytes"]
    blocks = t["blocks"]   # list of (bw, bh) tuples

    # Two sweep dims iterated as a paired list (not cross product) — the
    # `blocks` array gives explicit (bw, bh) pairs.  The harness will iterate
    # i in 0..N-1 and pull both from the array, which lets us pick exactly the
    # corner cases we want.  We model this as one logical "block_idx" sweep
    # with 'values' = list of indices.
    sweep = [
        DimSpec(name="block_width",  unit="elements",
                values=[bw for bw, _ in blocks]),
        DimSpec(name="block_height", unit="elements",
                values=[bh for _, bh in blocks]),
    ]

    # Stride locals declared at top of verify().  Packed layout = no padding,
    # so input_stride = block_width * elem_bytes and output_stride =
    # block_height * elem_bytes.
    alloc_decls = [
        f"size_t input_stride  = block_width  * {eb};",
        f"size_t output_stride = block_height * {eb};",
    ]

    # Bind every scalar arg.
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n == "block_width":      bindings[n] = "block_width"
        elif n == "block_height":   bindings[n] = "block_height"
        elif n == "input_stride":   bindings[n] = "input_stride"
        elif n == "output_stride":  bindings[n] = "output_stride"
        else:                       bindings[n] = scalar_args.get(n, "0")

    # Buffer plans.
    # Input is `block_height` rows of `block_width` elements (packed).
    # Output is `block_width` rows of `block_height` elements (packed).
    # Both reach the same byte count = block_width * block_height * elem_bytes.
    # +32B slack for SIMD tail over-reads/writes.
    buf_plans: dict[str, BufferSpec] = {}
    in_arg = next((a for a in sig.args if a.role == ArgRole.INPUT_ARRAY), None)
    out_arg = sig.output_args[0] if sig.output_args else None
    body_bytes = f"block_width * block_height * {eb} + 32"
    if in_arg:
        buf_plans[in_arg.name] = BufferSpec(
            arg_name=in_arg.name,
            role=ArgRole.INPUT_ARRAY,
            elem_type=in_arg.elem_type,
            size_expr=body_bytes,
            is_symbolic=True,
        )
    if out_arg:
        buf_plans[out_arg.name] = BufferSpec(
            arg_name=out_arg.name,
            role=ArgRole.OUTPUT,
            elem_type=out_arg.elem_type,
            size_expr=body_bytes,
            is_symbolic=True,
        )

    return ShapePlan(
        shape=Shape.TRANSPOSE_2D,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
    )


def _pool_indirect_plan(sig: FuncSignature,
                         profile: Optional[KernelProfile],
                         scalar_args: dict) -> ShapePlan:
    """POOL_INDIRECT: pooling with indirect input pointers.

    Profile dict shape (see kernel_profiles.KernelProfile.pool):
      elem_bytes:               int (1, 2, 4)
      kernel_elements_values:   list of fixed kernel sizes (e.g. [9])
      channels_values:          list of channel counts to sweep
      output_pixels_values:     list of output pixel counts (default [1])

    Buffer plans:
      input:   INDIRECT_INPUT — kernel_elements row pointers, each row holds
               channels * elem_bytes bytes (we set input_offset = 0).
      output:  flat OUTPUT of output_pixels * channels * elem_bytes bytes.
    """
    if not profile or not profile.pool:
        return ShapePlan(
            shape=Shape.POOL_INDIRECT,
            unresolved=["profile.pool — required for POOL_INDIRECT"],
        )
    p = profile.pool
    eb = p["elem_bytes"]
    ke_vals = p.get("kernel_elements_values", [9])
    ch_vals = p.get("channels_values", [1, 4, 8, 16])
    op_vals = p.get("output_pixels_values", [1])

    # Three sweep dims iterated as a paired/cross-product list — but for the
    # first iteration we use single-dim sweeps via three lists.  For initial
    # support, fix output_pixels = ke_vals[0] and sweep channels only.
    sweep = [
        DimSpec(name="channels",        unit="elements", values=ch_vals),
        DimSpec(name="output_pixels",   unit="elements", values=op_vals),
        DimSpec(name="kernel_elements", unit="elements", values=ke_vals),
    ]

    # alloc_decls: simple bytes math.  We choose input_offset = 0 (kernel reads
    # from the row pointer directly).  input_pixel_stride/input_increment/
    # output_increment are zero for output_pixels=1 (single output position);
    # generalize to non-zero only when output_pixels > 1.
    alloc_decls = [
        f"size_t channel_bytes = channels * {eb};",
        f"size_t input_offset = 0;",
        f"size_t input_pixel_stride = channel_bytes;",
        f"size_t input_increment = 0;",
        f"size_t output_increment = 0;",
    ]

    # Bind every scalar arg.
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n in ("channels", "output_pixels", "kernel_elements"):
            bindings[n] = n
        elif n == "input_offset":           bindings[n] = "input_offset"
        elif n == "input_pixel_stride":     bindings[n] = "input_pixel_stride"
        elif n == "input_increment":        bindings[n] = "input_increment"
        elif n == "output_increment":       bindings[n] = "output_increment"
        else:                                bindings[n] = scalar_args.get(n, "0")

    # Buffer plans.
    buf_plans: dict[str, BufferSpec] = {}
    in_arg = next((a for a in sig.args if a.role == ArgRole.INDIRECT_INPUT), None)
    out_arg = sig.output_args[0] if sig.output_args else None
    if in_arg:
        # n_ptrs = kernel_elements; each row = channel_bytes (+slack).
        # The existing INDIRECT_INPUT decl emit reads `count_name` for row size.
        buf_plans[in_arg.name] = BufferSpec(
            arg_name=in_arg.name,
            role=ArgRole.INDIRECT_INPUT,
            elem_type=in_arg.elem_type,
            size_expr="kernel_elements",   # ← row count for n_ptrs
            is_symbolic=True,
        )
    if out_arg:
        buf_plans[out_arg.name] = BufferSpec(
            arg_name=out_arg.name,
            role=ArgRole.OUTPUT,
            elem_type=out_arg.elem_type,
            size_expr="output_pixels * channel_bytes + 32",
            is_symbolic=True,
        )

    # avgpool variants: `zero` (ZERO_BUFFER, sized to a channel) +
    # `multiplier` (INPUT_SCALAR, 1 element) extra args.  Add explicit plans
    # so the default `padded * eb` sizing (which has no `padded` here) is
    # bypassed.
    for a in sig.args:
        if a.role == ArgRole.ZERO_BUFFER:
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name, role=ArgRole.ZERO_BUFFER,
                elem_type=a.elem_type,
                size_expr=f"channels * {(a.elem_type.byte_size or 1)} + 32",
                is_symbolic=False,
            )
        # INPUT_SCALAR uses the existing 1-element default size (eb bytes) —
        # no plan override needed.

    # count_name drives per-row buffer sizing in INDIRECT_INPUT register/decl.
    return ShapePlan(
        shape=Shape.POOL_INDIRECT,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
        alloc_count_name="channels",
        count_name="channels",
    )


def _bilinear_indirect_plan(sig: FuncSignature,
                              profile: Optional[KernelProfile],
                              scalar_args: dict) -> ShapePlan:
    """BILINEAR_INDIRECT: bilinear interp with indirect input + weights.

    Profile dict shape (see kernel_profiles.KernelProfile.bilinear):
      elem_bytes:           int (1, 2, 4) — input/output element size.
      weight_elem_bytes:    int (2 or 4) — Q15 int16 for integer ibilinear,
                            float for fp variants.
      channels_values:      list of channel-count fixtures.
      output_pixels_values: list of output-pixel counts (default [1]).
    """
    if not profile or not profile.bilinear:
        return ShapePlan(
            shape=Shape.BILINEAR_INDIRECT,
            unresolved=["profile.bilinear — required for BILINEAR_INDIRECT"],
        )
    b = profile.bilinear
    eb = b["elem_bytes"]
    web = b.get("weight_elem_bytes", eb)
    ch_vals = b.get("channels_values", [1, 4, 8])
    op_vals = b.get("output_pixels_values", [1])

    sweep = [
        DimSpec(name="channels",      unit="elements", values=ch_vals),
        DimSpec(name="output_pixels", unit="elements", values=op_vals),
    ]

    alloc_decls = [
        f"size_t channel_bytes = channels * {eb};",
        f"size_t input_offset = 0;",
        f"size_t output_increment = 0;",
    ]

    # Bind every scalar arg.
    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n in ("channels", "output_pixels"):  bindings[n] = n
        elif n == "input_offset":               bindings[n] = "input_offset"
        elif n == "output_increment":           bindings[n] = "output_increment"
        else:                                   bindings[n] = scalar_args.get(n, "0")

    # Buffer plans.
    in_arg = next((a for a in sig.args if a.role == ArgRole.INDIRECT_INPUT), None)
    out_arg = sig.output_args[0] if sig.output_args else None
    buf_plans: dict[str, BufferSpec] = {}
    if in_arg:
        # 4 row pointers per output pixel (TL, TR, BL, BR).
        buf_plans[in_arg.name] = BufferSpec(
            arg_name=in_arg.name,
            role=ArgRole.INDIRECT_INPUT,
            elem_type=in_arg.elem_type,
            size_expr="output_pixels * 4",   # n_ptrs count
            is_symbolic=True,
        )
    if out_arg:
        buf_plans[out_arg.name] = BufferSpec(
            arg_name=out_arg.name,
            role=ArgRole.OUTPUT,
            elem_type=out_arg.elem_type,
            size_expr="output_pixels * channel_bytes + 32",
            is_symbolic=True,
        )
    # weights buffer: a plain INPUT_ARRAY of `output_pixels * 2` weight elements.
    for a in sig.args:
        if a.role == ArgRole.WEIGHTS or (a.role == ArgRole.INPUT_ARRAY and a.name == "weights"):
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name,
                role=ArgRole.INPUT_ARRAY,
                elem_type=a.elem_type,
                size_expr=f"output_pixels * 2 * {web} + 16",
                is_symbolic=True,
            )

    return ShapePlan(
        shape=Shape.BILINEAR_INDIRECT,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
        alloc_count_name="channels",
        count_name="channels",
    )


def _igemm_indirect_fp_plan(sig: FuncSignature,
                             profile: Optional[KernelProfile],
                             scalar_args: dict) -> ShapePlan:
    """IGEMM_INDIRECT_FP: GEMM with indirect input pointers + bake-time ks."""
    if not profile or not profile.igemm:
        return ShapePlan(
            shape=Shape.IGEMM_INDIRECT_FP,
            unresolved=["profile.igemm — required for IGEMM_INDIRECT_FP"],
        )
    g = profile.igemm
    dims = g["dims"]
    ks = g["ks"]
    sweep = [
        DimSpec(name="mr", unit="elements", values=dims["mr"]),
        DimSpec(name="nc", unit="elements", values=dims["nc"]),
        DimSpec(name="kc", unit="elements", values=dims["kc"]),
    ]

    strides = g.get("strides", {})
    sizes   = g.get("buffer_sizes", {})
    overrides = g.get("arg_bindings", {})

    alloc_decls: list[str] = []
    for sname, expr in strides.items():
        alloc_decls.append(f"size_t {sname} = {expr};")
    alloc_decls.append(f"size_t a_offset = 0;")

    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n in overrides:                    bindings[n] = overrides[n]
        elif n in ("mr", "nc", "kc"):         bindings[n] = n
        elif n == "ks":                       bindings[n] = str(ks)
        elif n in strides:                    bindings[n] = n
        elif n == "a_offset":                 bindings[n] = "a_offset"
        else:                                  bindings[n] = scalar_args.get(n, "0")

    buf_plans: dict[str, BufferSpec] = {}
    a_arg = next((x for x in sig.args if x.role == ArgRole.INDIRECT_INPUT), None)
    if a_arg:
        # n_ptrs = mr * ks (per upstream IGEMM).  Each row holds kc elements.
        buf_plans[a_arg.name] = BufferSpec(
            arg_name=a_arg.name,
            role=ArgRole.INDIRECT_INPUT,
            elem_type=a_arg.elem_type,
            size_expr=f"mr * {ks}",
            is_symbolic=True,
        )
    for a in sig.args:
        if a.role in (ArgRole.WEIGHTS, ArgRole.OUTPUT, ArgRole.INPUT_ARRAY):
            if a.name in sizes:
                buf_plans[a.name] = BufferSpec(
                    arg_name=a.name,
                    role=a.role,
                    elem_type=a.elem_type,
                    size_expr=sizes[a.name],
                    is_symbolic=True,
                )
        elif a.role == ArgRole.ZERO_BUFFER:
            eb = g["elem_bytes"]
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name, role=ArgRole.ZERO_BUFFER,
                elem_type=a.elem_type,
                size_expr=f"kc * {eb} + 32",
                is_symbolic=False,
            )

    unresolved = []
    missing = [a.name for a in sig.args
               if a.role in (ArgRole.WEIGHTS, ArgRole.OUTPUT)
                  and a.name not in sizes]
    if missing:
        unresolved.append(f"buffer_sizes:{','.join(missing)}")

    return ShapePlan(
        shape=Shape.IGEMM_INDIRECT_FP,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
        alloc_count_name="kc",
        count_name="kc",
        unresolved=unresolved,
    )


def _dwconv_indirect_plan(sig: FuncSignature,
                          profile: Optional[KernelProfile],
                          scalar_args: dict) -> ShapePlan:
    """DWCONV_INDIRECT: depthwise conv with indirect input rows + packed weights."""
    if not profile or not profile.dwconv:
        return ShapePlan(
            shape=Shape.DWCONV_INDIRECT,
            unresolved=["profile.dwconv — required for DWCONV_INDIRECT"],
        )
    d = profile.dwconv
    eb = d["elem_bytes"]
    web = d.get("weight_elem_bytes", eb)
    ks = d["kernel_size"]
    ch_vals = d.get("channels_values", [1, 4])
    ow_vals = d.get("output_width_values", [1])

    sweep = [
        DimSpec(name="channels",     unit="elements", values=ch_vals),
        DimSpec(name="output_width", unit="elements", values=ow_vals),
    ]

    alloc_decls = [
        f"size_t channel_bytes = channels * {eb};",
        f"size_t input_offset = 0;",
        f"size_t input_pixel_stride = 0;",
        f"size_t output_increment = 0;",
        f"intptr_t input_stride_bytes = 0;",
    ]

    bindings: dict[str, str] = {}
    for a in sig.args:
        if a.role not in SCALAR_VALUE_ROLES:
            continue
        n = a.name
        if n in ("channels", "output_width"):    bindings[n] = n
        elif n == "input_stride":                bindings[n] = "input_stride_bytes"
        elif n == "input_offset":                bindings[n] = "input_offset"
        elif n == "input_pixel_stride":          bindings[n] = "input_pixel_stride"
        elif n == "output_increment":            bindings[n] = "output_increment"
        else:                                    bindings[n] = scalar_args.get(n, "0")

    in_arg  = next((a for a in sig.args if a.role == ArgRole.INDIRECT_INPUT), None)
    out_arg = sig.output_args[0] if sig.output_args else None
    buf_plans: dict[str, BufferSpec] = {}
    if in_arg:
        # n_ptrs = output_width × kernel_size; per-row size driven by count_name (channels).
        buf_plans[in_arg.name] = BufferSpec(
            arg_name=in_arg.name,
            role=ArgRole.INDIRECT_INPUT,
            elem_type=in_arg.elem_type,
            size_expr=f"output_width * {ks}",
            is_symbolic=True,
        )
    if out_arg:
        buf_plans[out_arg.name] = BufferSpec(
            arg_name=out_arg.name,
            role=ArgRole.OUTPUT,
            elem_type=out_arg.elem_type,
            size_expr="output_width * channel_bytes + 32",
            is_symbolic=True,
        )
    # Weights: bias[C] + kernel_size × C kernel weights = (1+ks)*C elements.
    # Zero buffer: a channel-sized buffer of zeros (used by padding-row branch,
    # which we don't actually exercise — but the kernel may still read it).
    for a in sig.args:
        if a.role == ArgRole.WEIGHTS or (a.role == ArgRole.INPUT_ARRAY and a.name == "weights"):
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name,
                role=ArgRole.INPUT_ARRAY,
                elem_type=a.elem_type,
                size_expr=f"channels * (1 + {ks}) * {web} + 32",
                is_symbolic=True,
            )
        elif a.role == ArgRole.ZERO_BUFFER:
            buf_plans[a.name] = BufferSpec(
                arg_name=a.name, role=ArgRole.ZERO_BUFFER,
                elem_type=a.elem_type,
                size_expr=f"channels * {eb} + 32",
                is_symbolic=False,
            )

    return ShapePlan(
        shape=Shape.DWCONV_INDIRECT,
        sweep_dims=sweep,
        arg_bindings=bindings,
        buffer_plans=buf_plans,
        alloc_decls=alloc_decls,
        alloc_count_name="channels",
        count_name="channels",
    )


def infer_buffer_sizes(sig: FuncSignature, kernel_name: str = "") -> HarnessSpec:
    """Auto-infer buffer sizes from a classified signature.

    Returns a HarnessSpec with size expressions for each buffer.
    Sets needs_llm=True if any size couldn't be determined.
    """
    buffers = []
    scalar_args = {}
    needs_llm = False

    # Determine output element type (for comparison)
    out_arg = sig.output_args[0] if sig.output_args else None
    if out_arg:
        elem_bytes = out_arg.elem_type.byte_size or 1
        element_kind = out_arg.elem_type.element_kind
    else:
        elem_bytes = 1
        element_kind = "SINT"

    for arg in sig.args:
        if arg.role == ArgRole.BATCH:
            continue  # handled as the loop count
        elif arg.role == ArgRole.PARAMS:
            continue  # handled separately
        elif arg.role == ArgRole.SCALAR_SIZE:
            # Provide default concrete values for scalar size args
            scalar_args[arg.name] = _default_scalar_value(arg.name)
        elif arg.role == ArgRole.STRIDE:
            scalar_args[arg.name] = _default_stride_value(arg.name, sig)
        elif arg.role == ArgRole.INPUT_ARRAY:
            eb = arg.elem_type.byte_size or 1
            buffers.append(BufferSpec(
                arg_name=arg.name,
                role=ArgRole.INPUT_ARRAY,
                elem_type=arg.elem_type,
                size_expr=f"padded * {eb}",
                is_symbolic=True,
                note=f"symbolic input, {arg.elem_type.c_type}[batch]",
            ))
        elif arg.role == ArgRole.INPUT_SCALAR:
            eb = arg.elem_type.byte_size or 1
            buffers.append(BufferSpec(
                arg_name=arg.name,
                role=ArgRole.INPUT_SCALAR,
                elem_type=arg.elem_type,
                size_expr=f"{eb}",
                is_symbolic=True,
                note=f"scalar broadcast, 1 element",
            ))
        elif arg.role == ArgRole.OUTPUT:
            eb = arg.elem_type.byte_size or 1
            # Output buffer — need two (neon + rvv)
            buffers.append(BufferSpec(
                arg_name=arg.name,
                role=ArgRole.OUTPUT,
                elem_type=arg.elem_type,
                size_expr=f"padded * {eb}",
                is_symbolic=True,
                note=f"output buffer, {arg.elem_type.c_type}[batch]",
            ))
        elif arg.role == ArgRole.WEIGHTS:
            # Try known weight size patterns before falling back to LLM
            weight_size = _infer_weight_size(kernel_name, arg, sig)
            if weight_size:
                profile = get_profile(kernel_name)
                is_concrete = profile and profile.concrete_weights is not None
                buffers.append(BufferSpec(
                    arg_name=arg.name,
                    role=ArgRole.WEIGHTS,
                    elem_type=arg.elem_type,
                    size_expr=weight_size,
                    is_symbolic=not is_concrete,
                    note=f"weight buffer — profile: {weight_size}" if profile else f"weight buffer — inferred: {weight_size}",
                ))
            else:
                needs_llm = True
                buffers.append(BufferSpec(
                    arg_name=arg.name,
                    role=ArgRole.WEIGHTS,
                    elem_type=arg.elem_type,
                    size_expr="UNKNOWN",
                    is_symbolic=True,
                    note="weight buffer — size needs LLM inference",
                ))
        elif arg.role == ArgRole.INDIRECT_INPUT:
            needs_llm = True
            buffers.append(BufferSpec(
                arg_name=arg.name,
                role=ArgRole.INDIRECT_INPUT,
                elem_type=arg.elem_type,
                size_expr="UNKNOWN",
                is_symbolic=True,
                note="indirect pointer array — size needs LLM inference",
            ))
        elif arg.role == ArgRole.ZERO_BUFFER:
            eb = arg.elem_type.byte_size or 1
            buffers.append(BufferSpec(
                arg_name=arg.name,
                role=ArgRole.ZERO_BUFFER,
                elem_type=arg.elem_type,
                size_expr=f"padded * {eb}",
                is_symbolic=False,
                note="zero buffer (all zeros)",
            ))

    # Reject unclassified arguments — don't silently pass 0
    unknown_args = [a for a in sig.args if a.role == ArgRole.UNKNOWN]
    if unknown_args:
        names = [f"{a.name} ({a.c_type})" for a in unknown_args]
        raise ValueError(
            f"Kernel '{kernel_name}' has unclassified arguments: {names}. "
            f"Cannot generate a sound harness — provide manual classification.")

    arg_order = [{"name": a.name, "role": a.role} for a in sig.args]
    profile = get_profile(kernel_name)

    shape = classify_shape(sig, profile=profile)
    shape_plan = build_shape_plan(shape, sig, profile=profile,
                                   scalar_args=scalar_args,
                                   kernel_name=kernel_name)
    log.info("Shape classification for %s: %s (unresolved=%s)",
             kernel_name, shape.name, shape_plan.unresolved)

    # Sync plan-provided fields back onto BufferSpec.  The plan is
    # authoritative for its shape, so a non-empty plan size_expr always
    # wins — otherwise a FLAT_1D-style default (`padded * 2`) lingers on
    # SPATIAL buffers and leaks into emitter f-strings.
    for buf in buffers:
        plan_buf = shape_plan.buffer_plans.get(buf.arg_name)
        if not plan_buf:
            continue
        if plan_buf.size_expr:
            buf.size_expr = plan_buf.size_expr
            buf.note = (buf.note or "") + f" (shape_plan: {plan_buf.size_expr})"
        buf.is_symbolic = plan_buf.is_symbolic
    needs_llm = any(b.size_expr == "UNKNOWN" for b in buffers)

    return HarnessSpec(
        kernel_name=kernel_name,
        neon_func_name=sig.name,
        rvv_func_name=sig.name,
        params_type=sig.params_type,
        buffers=buffers,
        scalar_args=scalar_args,
        elem_bytes=elem_bytes,
        element_kind=element_kind,
        shape_plan=shape_plan,
        needs_llm=needs_llm,
        arg_order=arg_order,
        profile=profile,
    )


def resolve_unknown_sizes_with_llm(spec: HarnessSpec, neon_source: str,
                                    rvv_source: str, llm_client) -> HarnessSpec:
    """Use an LLM to infer unknown buffer sizes.

    Sends the kernel source + signature to the LLM, asks for size formulas.
    Logs prompt + raw response for debuggability.
    """
    unknown_bufs = [b for b in spec.buffers if b.size_expr == "UNKNOWN"]
    if not unknown_bufs:
        return spec

    prompt = _build_size_inference_prompt(spec, neon_source, unknown_bufs)
    system = (
        "You are a SIMD kernel analysis expert. Given a kernel's function signature "
        "and source code, determine the correct buffer sizes for verification.\n"
        "Respond with ONLY a JSON object mapping argument names to C++ size expressions "
        "in bytes. Use the other function arguments as variables. Do not wrap the JSON "
        "in markdown code fences.\n"
        "Example: {\"weights\": \"kc * nc * 4 + nc * 4\", \"input_ptrs\": \"ks * 8\"}"
    )

    log.info("LLM size inference: kernel=%s, unknown_bufs=%s",
             spec.kernel_name, [b.arg_name for b in unknown_bufs])

    try:
        response = llm_client.chat(prompt, system=system, temperature=0.1, max_tokens=1024)
        log.info("LLM raw response:\n%s", response)

        sizes = _parse_size_response(response)
        log.info("LLM parsed sizes: %s", sizes)

        for buf in spec.buffers:
            if buf.size_expr == "UNKNOWN" and buf.arg_name in sizes:
                buf.size_expr = sizes[buf.arg_name]
                buf.note += f" (LLM-inferred: {sizes[buf.arg_name]})"
                log.info("LLM inferred size for %s: %s", buf.arg_name, sizes[buf.arg_name])

        # Check if any are still unknown
        still_unknown = [b for b in spec.buffers if b.size_expr == "UNKNOWN"]
        spec.needs_llm = len(still_unknown) > 0
        if still_unknown:
            log.warning("LLM could not infer sizes for: %s",
                       [b.arg_name for b in still_unknown])

    except Exception as e:
        log.error("LLM size inference failed: %s", e, exc_info=True)

    return spec


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _infer_weight_size(kernel_name: str, arg: 'FuncArg', sig: 'FuncSignature') -> Optional[str]:
    """Try to infer weight buffer size from known kernel patterns.

    Checks kernel profiles first, then returns None for LLM fallback.
    Returns a C++ size expression in bytes, or None if unknown.
    """
    profile = get_profile(kernel_name)
    if profile and profile.weight_size:
        return profile.weight_size

    return None


def _default_scalar_value(name: str) -> str:
    """Provide sensible default concrete values for scalar size arguments."""
    defaults = {
        "mr": "4", "nc": "8", "kc": "16", "ks": "1",
        "channels": "16", "output_width": "1",
        "rows": "4", "output_pixels": "1",
        "kernel_elements": "9",
        "input_height": "4", "input_width": "4",
        "m": "4", "k": "16", "g": "1",
        "block_width": "4", "block_height": "4",
    }
    return defaults.get(name, "1")


def _default_stride_value(name: str, sig: FuncSignature) -> str:
    """Provide default stride values derived from other args."""
    # Common patterns
    if name == "a_stride":
        return "kc" if any(a.name == "kc" for a in sig.args) else "16"
    if name in ("cm_stride", "output_stride"):
        # For verification soundness, stride must == channels so rows are packed
        if any(a.name == "channels" for a in sig.args):
            return "channels"
        return "nc" if any(a.name == "nc" for a in sig.args) else "8"
    if name == "cn_stride":
        return "1"
    if name in ("input_stride", "input_stride1", "input_stride2", "input_stride3"):
        return "channels" if any(a.name == "channels" for a in sig.args) else "16"
    if name in ("output_increment", "input_increment"):
        return "0"
    if name in ("input_offset", "a_offset"):
        return "0"
    if name in ("input_pixel_stride",):
        return "channels" if any(a.name == "channels" for a in sig.args) else "16"
    return "0"



def _build_size_inference_prompt(spec: HarnessSpec, source: str,
                                  unknown_bufs: list[BufferSpec]) -> str:
    """Build the LLM prompt for inferring buffer sizes."""
    buf_list = "\n".join(f"  - {b.arg_name} ({b.elem_type.c_type}*, role={b.role.name})"
                         for b in unknown_bufs)
    # Larger source cap — modern LLMs handle 200k+ context easily, and conv
    # kernels can exceed 3000 chars. Trimming too aggressively hides the
    # loop structure the LLM needs to derive weight sizes.
    source_excerpt = source if len(source) <= 16000 else source[:16000] + "\n// ... (truncated)"
    return f"""Given this SIMD kernel for '{spec.kernel_name}':

```c
{source_excerpt}
```

The function has these arguments with unknown buffer sizes:
{buf_list}

The other size arguments (with default concrete values) are:
{json.dumps(spec.scalar_args, indent=2)}

For each unknown buffer, provide the size in BYTES as a C++ expression
using the other argument names as variables. Prefer simple arithmetic
expressions (e.g. `kc * nc * 4 + nc * 4`). Do NOT call sizeof() — assume
the element size is folded into the constants.

Respond with ONLY a JSON object, no markdown fences, no prose. Example:
{{"weights": "kc * nc * 4 + nc * 4", "input_ptrs": "ks * 8"}}
"""


def _parse_size_response(response: str) -> dict[str, str]:
    """Extract JSON size mapping from LLM response.

    Handles: raw JSON, JSON wrapped in ```json fences, JSON with nested
    braces, and JSON with trailing prose.
    """
    text = response.strip()

    # Strip common markdown fences
    text = re.sub(r'^```(?:json)?\s*\n?', '', text)
    text = re.sub(r'\n?```\s*$', '', text)
    text = text.strip()

    # First: try the whole thing as JSON
    try:
        result = json.loads(text)
        if isinstance(result, dict):
            return {k: str(v) for k, v in result.items()}
    except json.JSONDecodeError:
        pass

    # Second: brace-matching scan — find first '{' and collect until balanced.
    # The old `{[^}]+}` regex failed on any response containing nested objects.
    start = text.find('{')
    if start >= 0:
        depth = 0
        for i in range(start, len(text)):
            ch = text[i]
            if ch == '{':
                depth += 1
            elif ch == '}':
                depth -= 1
                if depth == 0:
                    candidate = text[start:i+1]
                    try:
                        result = json.loads(candidate)
                        if isinstance(result, dict):
                            return {k: str(v) for k, v in result.items()}
                    except json.JSONDecodeError:
                        break

    log.warning("Could not parse LLM size response as JSON. First 500 chars:\n%s",
                response[:500])
    return {}
