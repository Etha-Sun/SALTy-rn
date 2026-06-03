"""Generate a C++ equivalence harness from a NEON+RVV kernel pair.

Two paths: generate_harness (elementwise — bound sweep + params) and
generate_multidim (FixtureSpec-driven multi-dim families, e.g. transpose).
"""
from __future__ import annotations

import os
import re

from .frontend import (parse_signature, resolve_roles, parse_struct_leaves,
                       classify_param_struct, Signature, Roles)
# Curated valid param values / ranges / constraints (the merged param data module).
from ..param_configs import FIELD_EDGES, EDGE_VALUES, PARAM_CONSTRAINTS, get_param_ranges

_FP_CTYPES = ("float", "double", "_Float16", "xnn_float16")

_HERE = os.path.dirname(os.path.abspath(__file__))
_ROOT = os.path.abspath(os.path.join(_HERE, "..", "..", "..", ".."))
_XNN_MIN_H = os.path.join(_ROOT, "src", "verification_bw", "xnn_minimal.h")

# element type → (ElementKind, byte width)
_KIND = {
    "float": "F32", "double": "F64",
    "int8_t": "SINT", "int16_t": "SINT", "int32_t": "SINT", "int64_t": "SINT",
    "signed char": "SINT", "short": "SINT", "int": "SINT", "long": "SINT",
    "uint8_t": "UINT", "uint16_t": "UINT", "uint32_t": "UINT", "uint64_t": "UINT",
    "unsigned char": "UINT", "unsigned short": "UINT", "unsigned int": "UINT",
    "unsigned long": "UINT",
    "_Float16": "F16", "xnn_float16": "F16",
}
_BYTES = {
    "float": 4, "double": 8,
    "int8_t": 1, "int16_t": 2, "int32_t": 4, "int64_t": 8,
    "signed char": 1, "short": 2, "int": 4, "long": 8,
    "uint8_t": 1, "uint16_t": 2, "uint32_t": 4, "uint64_t": 8,
    "unsigned char": 1, "unsigned short": 2, "unsigned int": 4, "unsigned long": 8,
    "_Float16": 2, "xnn_float16": 2,
}


def _kind(pointee: str) -> str:
    if pointee not in _KIND:
        raise NotImplementedError(f"unhandled element type {pointee!r}")
    return _KIND[pointee]


def _detect_byte_unit(src: str, bound: str):
    """Detect the XNNPACK `batch % sizeof(T)` byte-count idiom. Returns
    (is_byte_unit, element_type). `batch` is then a byte count whose unit is
    sizeof(T); otherwise it's an element count."""
    m = re.search(rf"\b{re.escape(bound)}\b\s*[%/]\s*sizeof\s*\(\s*([\w ]+?)\s*\)", src)
    if not m:  # loop-decrement form: `batch -= k * sizeof(T)`
        m = re.search(rf"\b{re.escape(bound)}\b[^;\n]*sizeof\s*\(\s*([\w ]+?)\s*\)", src)
    return (True, m.group(1).strip()) if m else (False, None)


def _field_values(path: str, ctype: str):
    """Valid concrete edge values for a struct leaf — by field name first (the
    semantic table), then by type. Returns C literals."""
    fname = path.split(".")[-1]
    raw = FIELD_EDGES.get(fname)
    if raw is None:
        raw = EDGE_VALUES.get(ctype)
    if not raw:
        return []
    if ctype == "float" or ctype in ("xnn_float16", "_Float16"):
        return [f"{float(v)}f" for v in raw]
    if ctype == "double":
        return [f"{float(v)}" for v in raw]
    return [str(int(v)) for v in raw]          # integer fields


def _gen_configs(leaves, cap: int = 24):
    """One-at-a-time configs around a base (each field's first value), so every
    field's values are exercised without a combinatorial blow-up. Cross-field
    validity holds by construction (output_min/max are fixed, multiplier≥1, …)."""
    fields = [(p, _field_values(p, t)) for p, t, _ in leaves if p != "_"]
    fields = [(p, vs) for p, vs in fields if vs]
    if not fields:
        return [], []
    paths = [p for p, _ in fields]
    base = [vs[0] for _, vs in fields]
    combos = [tuple(base)]
    for i, (_, vs) in enumerate(fields):
        for v in vs[1:]:
            c = list(base)
            c[i] = v
            combos.append(tuple(c))
    return paths, combos[:cap]


def _emit_config_table(st: str, paths, combos) -> str:
    set_cases, name_cases = [], []
    for i, combo in enumerate(combos):
        assigns = " ".join(f"p.{path} = {val};" for path, val in zip(paths, combo))
        set_cases.append(f"    case {i}: {assigns} break;")
        label = ",".join(f"{path.split('.')[-1]}={val.rstrip('f')}"
                         for path, val in zip(paths, combo))
        name_cases.append(f'    case {i}: return "{label}";')
    return (f"static void _set_params({st}& p, size_t cfg) {{\n"
            f"  switch (cfg) {{\n" + "\n".join(set_cases) + "\n  }\n}\n"
            f"static const char* _cfg_name(size_t cfg) {{\n"
            f"  switch (cfg) {{\n" + "\n".join(name_cases) +
            '\n  default: return "?";\n  }\n}\n')


def _strip_simd_includes(src: str) -> str:
    """Remove the kernel's own <arm_neon.h>/<riscv_vector.h> includes — salt.hpp
    supplies the symbolic shims, and the real headers aren't on the include path."""
    return re.sub(r'^[ \t]*#[ \t]*include[ \t]*<(arm_neon|riscv_vector)\.h>[ \t]*$',
                  '', src, flags=re.M)


def _split_body(src: str):
    """(head, body) split at the function's opening brace. Matches the actual
    `void test_*(` definition — robust to 'test_' mentions in comments."""
    m = re.search(r'\bvoid\s+test_\w*\s*\(', src)
    brace = src.find("{", m.end()) if m else -1
    return (src[:brace], src[brace:]) if brace != -1 else (src, "")


def _scalar_broadcast_inputs(src: str, input_names) -> set:
    """Inputs read as a scalar (`*name`) in the function *body* — a broadcast
    constant, not a vector loaded via an intrinsic. The signature's `T* name`
    decl is excluded by scanning only after the opening brace."""
    _, body = _split_body(src)
    return {n for n in input_names if re.search(rf'\*\s*{re.escape(n)}\b', body)}


_SCALAR_TYPE = re.compile(r'^(u?int(8|16|32|64)_t|uint|int|short|long|float|double|size_t|u?char)$')


def _rebind_tainted_locals(body: str) -> str:
    """A scalar-typed local initialized (transitively) from a symbolic scalar now
    holds a SymbolicScalar, so its type must become `auto`. Iterates to a fixpoint
    over the taint set. Vector types (int32x4_t, …) are left alone — their shims
    already carry symbolic lanes."""
    lines = body.split("\n")
    tainted: set = set()
    changed = True
    while changed:
        changed = False
        for i, ln in enumerate(lines):
            m = re.match(r'^(\s*)(const\s+)?(\w+)\s+(\w+)\s*=\s*(.+?);(\s*)$', ln)
            if not m:
                continue
            indent, c, typ, name, init, tail = m.groups()
            if typ == "auto" or name in tainted or not _SCALAR_TYPE.match(typ):
                continue
            if ("salt_scalar" in init or "salt_param" in init or
                    any(re.search(rf'\b{re.escape(t)}\b', init) for t in tainted)):
                lines[i] = f'{indent}{c or ""}auto {name} = {init};{tail}'
                tainted.add(name)
                changed = True
    return "\n".join(lines)


def _rewrite_scalar_broadcast(src: str, names) -> str:
    """Rewrite scalar reads of broadcast inputs (in the body only) to a symbolic
    accessor: `(T) *name` -> `salt_scalar(name).cast<T>()`, `*name` -> `salt_scalar(name)`."""
    if not names:
        return src
    head, body = _split_body(src)
    if not body:
        return src
    for n in names:
        body = re.sub(rf'\(\s*(\w+)\s*\)\s*\*\s*{re.escape(n)}\b',
                      rf'salt_scalar({n}).cast<\1>()', body)
        body = re.sub(rf'\*\s*{re.escape(n)}\b', rf'salt_scalar({n})', body)
        if re.search(rf'\*\s*{re.escape(n)}\b', body):  # missed read → fail loudly, not silent 0
            raise NotImplementedError(f"unrewritten scalar read of {n} remains "
                                      "(unhandled access pattern)")
    body = _rebind_tainted_locals(body)  # propagate symbolic taint to dependent scalar locals
    return head + body


def _rewrite_symbolic_params(src: str, st: str, pname: str, leaves) -> str:
    """Rewrite `params->field` reads to a symbolic accessor so the solver proves
    over ALL valid param values. `(T) params->f` -> `salt_param<ft>(...).cast<T>()`."""
    head, body = _split_body(src)
    if not body:
        return src
    for path, ctype, _ in sorted(leaves, key=lambda l: -len(l[0])):  # longest first
        if path == "_":
            continue
        acc = f"salt_param<{ctype}>({pname}, offsetof({st}, {path}))"
        esc = re.escape(f"{pname}->{path}")
        body = re.sub(rf'\(\s*(\w+)\s*\)\s*{esc}\b', rf'{acc}.cast<\1>()', body)
        body = re.sub(rf'{esc}\b', acc, body)
    body = _rebind_tainted_locals(body)
    if f"{pname}->" in body:  # residual param read the rewrite missed → fail loudly
        raise NotImplementedError(f"unrewritten param read of {pname} remains "
                                  "(unhandled access pattern)")
    return head + body


def _field_leaf_map(leaves):
    """field-name → (dotted_path, ctype), dropping the dummy `_` member."""
    return {p.split(".")[-1]: (p, t) for p, t, _ in leaves if p != "_"}


def _emit_param_constraints(st: str, leaves) -> list:
    """Validity asserts (e.g. output_min ≤ output_max, shift∈[0,31], multiplier>0)
    from the curated PARAM_CONSTRAINTS, against the symbolic params buffer."""
    f2l = _field_leaf_map(leaves)
    out = []
    for op, a, b in PARAM_CONSTRAINTS.get(st, []):
        if a not in f2l:
            continue
        pa, ta = f2l[a]
        bits_a = _BYTES[ta] * 8
        meth = "bv_" + op[3:].lower()          # BV_SLE -> bv_sle
        at = f"_b_params.loadScalar(offsetof({st}, {pa}), {bits_a})"
        if isinstance(b, int):
            bt = f"ctx.bv_val({bits_a}, {b})"
        elif b in f2l:
            pb, tb = f2l[b]
            bt = f"_b_params.loadScalar(offsetof({st}, {pb}), {_BYTES[tb] * 8})"
        else:
            continue
        out.append(f"    ctx.assert_(ctx.{meth}({at}, {bt}));")
    return out


def _emit_param_ranges(st: str, leaves, ranges: dict) -> list:
    """Per-field [lo, hi] bounds (from the kernel profile) — restrict symbolic
    params to their valid domain (e.g. a narrowed multiplier that must fit int16),
    which also helps the solver. Signed vs unsigned chosen by the field type."""
    f2l = _field_leaf_map(leaves)
    out = []
    for fname, bounds in (ranges or {}).items():
        if fname not in f2l or not bounds:
            continue
        lo, hi = bounds
        path, ct = f2l[fname]
        bits = _BYTES[ct] * 8
        ge, le = ("bv_sge", "bv_sle") if not ct.startswith("u") else ("bv_uge", "bv_ule")
        v = f"_b_params.loadScalar(offsetof({st}, {path}), {bits})"
        out.append(f"    ctx.assert_(ctx.{ge}({v}, mk_bv_val(ctx.tm, {bits}, {lo})));")
        out.append(f"    ctx.assert_(ctx.{le}({v}, mk_bv_val(ctx.tm, {bits}, {hi})));")
    return out


def _emit_input_range(buf_var: str, n_expr: str, lo, hi) -> list:
    """Constrain each F32 element of a symbolic input buffer to finite [lo, hi]
    (excludes NaN/inf — FP comparisons are false for NaN). Optional; weakens the
    claim to finite inputs, so it must be recorded in the verdict."""
    lo_f, hi_f = float(lo), float(hi)   # ensure valid float literals (e.g. "-1" → -1.0f)
    return [
        f"    {{  // input-range [{lo_f}, {hi_f}] on {buf_var}",
        f"        Term _lo = mk_fp32_from_float(ctx.tm, {lo_f}f), _hi = mk_fp32_from_float(ctx.tm, {hi_f}f);",
        f"        for (size_t _i = 0; _i < ({n_expr}); _i++) {{",
        f"            Term _fp = load_as_fp32(ctx.tm, {buf_var}.loadScalar(_i * 4, 32));",
        f"            ctx.assert_(ctx.land_(ctx.fp32_geq(_fp, _lo), ctx.fp32_leq(_fp, _hi)));",
        f"        }}",
        f"    }}",
    ]


def _output_is_read(src: str, name: str) -> bool:
    """True if an output buffer is *read* (loaded) anywhere — i.e. it's an in-out
    accumulator / in-place buffer, where the prior contents are part of the input.
    Detected by the output pointer appearing as the argument to a load intrinsic."""
    return bool(re.search(
        rf"(vld\w*|__riscv_vle\w+|vget\w*q?_\w+)\s*\(\s*&?\s*{re.escape(name)}\b", src))


# Multi-dim fixture: swept dims + chosen strides. Tight-stride/contiguous output
# for now; strided regions land with GEMM.
class FixtureSpec:
    def __init__(self, dims, strides, extents, out_buffers, out_extent, elem, kind,
                 out_region=None, weights=None, params=None, indirect=None,
                 out_extents=None, dual_weights=None):
        self.dims = dims              # dim_name -> [values]
        self.strides = strides        # stride_name -> C++ expr (over dims)
        self.extents = extents        # buffer_name -> byte-count expr
        self.out_buffers = out_buffers
        self.out_extent = out_extent  # contiguous output element count (if no out_region)
        self.elem = elem
        self.kind = kind
        self.out_region = out_region  # {rows,cols,row_stride,col_stride} → strided compare
        self.weights = weights or {}  # name -> (byte-extent expr, uniform fill literal) — concrete
        self.params = params          # (struct_name, {field: value}) — concrete struct, or None
        self.indirect = indirect or {}  # name -> {count, row} — T** pointer table over a symbolic buffer
        self.out_extents = out_extents   # {name: elem-count expr} — multi-output contiguous compare (each output ANDed)
        self.dual_weights = dual_weights or {}  # name -> {count, neon_tile, rvv_tile} — per-dialect weight packing


def _transpose_fixture(elem: str) -> "FixtureSpec":
    # block_height×block_width → block_width×block_height, any element width.
    # Padded strides (+8B/row) make the output strided, exercising Strided2D.
    return FixtureSpec(
        dims={"block_width": [1, 2, 3, 4, 5], "block_height": [1, 2, 3, 4, 5]},
        strides={"input_stride": f"block_width * sizeof({elem}) + 8",
                 "output_stride": f"block_height * sizeof({elem}) + 8"},
        extents={"input": "block_height * input_stride + 64",     # bytes
                 "output": "block_width * output_stride + 64"},
        out_buffers=["output"], out_extent=None,
        out_region={"rows": "block_width", "cols": "block_height",
                    "row_stride": "output_stride", "col_stride": f"sizeof({elem})"},
        elem=elem, kind=_kind(elem))


def _gemm_fixture() -> "FixtureSpec":
    # Full f32-gemm (mr≤6, nr=8): c[m][n] = clamp(bias[n] + Σ_k a[m][k]·w[k][n]).
    # kc in BYTES → real reduction (kc>1). nc ≤ 8 = single NEON tile (cn_stride unused).
    # Weights DUAL-PACKED: planes = 1+kc_floats (bias + weight rows), NEON tile=8,
    # RVV tile=VLMAX(e32m4), padded (`w += nr`). Both reduce sequentially over k with
    # FMA in identical order → kc>1 is FP-safe. `a` symbolic (sentinel bridges RVV's
    # scalar `*a0++`; NEON's vld1q reads the same bytes). Output region strided.
    return FixtureSpec(
        dims={"mr": [1, 2, 6], "nc": [1, 4, 8], "kc": [4, 8]},   # kc BYTES: 4=1float, 8=2floats
        strides={"a_stride": "kc",                       # a row pitch (bytes), tight
                 "cm_stride": "nc * sizeof(float)",      # c row pitch, tight
                 "cn_stride": "8 * sizeof(float)"},      # next nr-tile (unused at nc≤8)
        extents={"a": "mr * kc + 64", "c": "mr * cm_stride + 64"},
        out_buffers=["c"], out_extent=None,
        out_region={"rows": "mr", "cols": "nc",
                    "row_stride": "cm_stride", "col_stride": "sizeof(float)"},
        dual_weights={"w": {"planes": "1 + kc / sizeof(float)",   # bias + kc_floats weight rows
                            "ncols": "nc", "neon_tile": "8",
                            "rvv_tile": "(vlen / 32) * 4", "rvv_packed": False}},
        params=("xnn_f32_minmax_params",
                {"scalar.min": "-1e30f", "scalar.max": "1e30f"}),   # wide → no clamp
        elem="float", kind="F32")


# Per-element-type minmax params for the pool family: (struct, {field: concrete}).
# Wide ranges → the clamp is identity, so the result is the pure max-reduction;
# both sides apply the same clamp regardless, so equivalence is unaffected.
_MINMAX_PARAMS = {
    "float":   ("xnn_f32_minmax_params", {"scalar.min": "-1e30f", "scalar.max": "1e30f"}),
    "int8_t":  ("xnn_s8_minmax_params",  {"scalar.min": "-128",   "scalar.max": "127"}),
    "uint8_t": ("xnn_u8_minmax_params",  {"scalar.min": "0",      "scalar.max": "255"}),
}


def _maxpool_fixture(elem: str) -> "FixtureSpec":
    # Indirect-input family: `const T** input` is a table of kernel_elements row
    # pointers, each into a shared symbolic buffer; per-channel max-reduction with
    # a [min,max] clamp. Max order is identical on both sides (sequential over k),
    # so it verifies on the FULL domain — no input-range needed. f32 uses FP max;
    # s8/u8 use signed/unsigned integer max (kind SINT/UINT) — same recipe.
    return FixtureSpec(
        dims={"channels": [1, 2, 3, 4, 5, 7, 8],
              "kernel_elements": [1, 2, 3],
              "output_pixels": [1, 2]},
        # Unused scalar args declared (and pinned) as zero-valued locals.
        strides={"input_offset": "0", "input_pixel_stride": "0",
                 "input_increment": "0", "output_increment": "0"},
        extents={"output": f"channels * sizeof({elem}) + 64"},
        out_buffers=["output"], out_extent="channels", out_region=None,
        # input[k] addresses [input_offset, input_offset+channels) elements per row.
        indirect={"input": {"count": "kernel_elements", "row": "input_offset + channels"}},
        params=_MINMAX_PARAMS[elem],
        elem=elem, kind=_kind(elem))


def _igemm_fixture(ks: int = 1) -> "FixtureSpec":
    # Minimal igemm (a_offset=0; zero/params/strides voided). `a` is a T** table
    # of ks*mr row pointers (reuses the indirect handler), indexed a[p*mr + m].
    # Output c[m*nc+n] is contiguous mr×nc. Both sides index `w` IDENTICALLY
    # (bias[nc] then ks·kc rows of nc) — no dual-packing — so weights are symbolic.
    # Reduction order is identical (sequential over p,k), so equivalence holds;
    # symbolic FP-mul needs input-range. ks=1 is the base igemm; ks=3 is igemm-ks3.
    kc_vals = [1, 2, 3] if ks == 1 else [1, 2]   # ks*kc products — cap work for ks>1
    return FixtureSpec(
        dims={"mr": [1, 2], "nc": [1, 4, 5, 8], "kc": kc_vals},
        strides={"ks": str(ks), "a_offset": "0", "cm_stride": "0", "cn_stride": "0"},
        extents={"w": f"nc * (1 + {ks}*kc) * sizeof(float) + 64",   # bias[nc] + ks·kc rows of nc
                 "c": "mr * nc * sizeof(float) + 64"},
        out_buffers=["c"], out_extent="mr * nc", out_region=None,
        indirect={"a": {"count": f"{ks} * mr", "row": "a_offset + kc"}},
        weights={"zero": ("16", "0.0f")},        # voided; concrete dummy → valid ptr
        params=("xnn_f32_minmax_params", {}),    # voided; declared so &params is valid
        elem="float", kind="F32")


def _dwconv_fixture(ksize: int = 3) -> "FixtureSpec":
    # Minimal depthwise conv, kernel_size=ksize (input/output_increment/strides/
    # zero/params voided). `input` is a T** table of output_width*ksize row pointers
    # (ksize taps per output pixel). Weights share the SAME layout on both sides
    # (bias[C] + ksize taps, each C-wide) → symbolic. Output output[ow*channels+c]
    # is contiguous; ksize-tap reduction in matched order; FP-mul needs input-range.
    # ksize=3 is the base dwconv; ksize=9 is dwconv-9p.
    ow_vals = [1, 2] if ksize <= 3 else [1]      # ksize products/output — cap work
    return FixtureSpec(
        dims={"channels": [1, 2, 4, 5, 8], "output_width": ow_vals},
        strides={"input_stride": "0", "output_increment": "0",
                 "input_offset": "0", "input_pixel_stride": "0"},
        extents={"weights": f"channels * {ksize + 1} * sizeof(float) + 64",   # bias + ksize taps
                 "output": "output_width * channels * sizeof(float) + 64"},
        out_buffers=["output"], out_extent="output_width * channels", out_region=None,
        indirect={"input": {"count": f"output_width * {ksize}", "row": "input_offset + channels"}},
        weights={"zero": ("16", "0.0f")},        # voided; concrete dummy → valid ptr
        params=("xnn_f32_minmax_params", {}),    # voided; declared so &params is valid
        elem="float", kind="F32")


def _strided_slice_fixture() -> "FixtureSpec":
    # y[i] = x[i*stride] — pure strided gather, no arithmetic → full-domain (the
    # FP-aware compare is bit-exact for a copy). Two bounds (n_out, stride); x is
    # read at stride steps so its extent is n_out*stride.
    return FixtureSpec(
        dims={"n_out": [1, 2, 4, 5, 8], "stride": [1, 2, 3]},
        strides={},
        extents={"x": "n_out * stride * sizeof(float) + 64",
                 "y": "n_out * sizeof(float) + 64"},
        out_buffers=["y"], out_extent="n_out", out_region=None,
        elem="float", kind="F32")


def _concat2_fixture() -> "FixtureSpec":
    # y = [a[0..na-1], b[0..nb-1]] — pure concatenation, full-domain. Two inputs,
    # one contiguous output of na+nb (both halves fully written).
    return FixtureSpec(
        dims={"na": [1, 2, 4, 5], "nb": [1, 2, 3, 8]},
        strides={},
        extents={"a": "na * sizeof(float) + 64",
                 "b": "nb * sizeof(float) + 64",
                 "y": "(na + nb) * sizeof(float) + 64"},
        out_buffers=["y"], out_extent="na + nb", out_region=None,
        elem="float", kind="F32")


def _split2_fixture() -> "FixtureSpec":
    # a = x[0..na-1]; b = x[na..na+nb-1] — pure split, full-domain. ONE input,
    # TWO contiguous outputs (a:na, b:nb) — exercises the multi-output compare.
    return FixtureSpec(
        dims={"na": [1, 2, 4, 5], "nb": [1, 2, 3, 8]},
        strides={},
        extents={"x": "(na + nb) * sizeof(float) + 64",
                 "a": "na * sizeof(float) + 64",
                 "b": "nb * sizeof(float) + 64"},
        out_buffers=["a", "b"], out_extent=None, out_region=None,
        out_extents={"a": "na", "b": "nb"},   # per-output element counts, ANDed
        elem="float", kind="F32")


def _vmulcaddc_fixture() -> "FixtureSpec":
    # 2-row per-channel: output = clamp(input*scale + bias). `channels` in BYTES.
    # Weights are DUAL-PACKED: NEON packs scale[4]+bias[4] per fixed 4-float tile;
    # RVV packs scale[vl]+bias[vl] per vl-float tile (vl = VLMAX(e32m4) = (vlen/32)*4).
    # The harness builds two physical buffers (w_neon, w_rvv) from ONE shared symbolic
    # logical weight set placed at each dialect's offsets — so both kernels recover the
    # same per-channel scale/bias at ANY vlen and with tails. Symbolic FP-mul → input-range.
    return FixtureSpec(
        dims={"rows": [1, 2, 3], "channels": [4, 16, 20, 32, 48]},   # BYTES; 20=5 floats (tail)
        strides={"input_stride": "channels", "output_stride": "channels"},   # tight (contiguous rows)
        extents={"input": "rows * channels + 64",
                 "output": "rows * channels + 64"},
        out_buffers=["output"], out_extent="rows * (channels / sizeof(float))", out_region=None,
        dual_weights={"weights": {"planes": "2",                         # plane0=scale, plane1=bias
                                  "ncols": "channels / sizeof(float)",   # logical channels
                                  "neon_tile": "4",                      # NEON fixed block
                                  "rvv_tile": "(vlen / 32) * 4",         # RVV VLMAX(e32m4)
                                  "rvv_packed": True}},                  # RVV advances by chunk (w += 2*vl)
        params=("xnn_f32_minmax_params", {"scalar.min": "-1e30f", "scalar.max": "1e30f"}),
        elem="float", kind="F32")


def _ibilinear_fixture() -> "FixtureSpec":
    # Bilinear interp (decomposed, no FMA → matched FP order). `input` is a T** table
    # of output_pixels*4 corner pointers (itl,itr,ibl,ibr). `weights[op*2+{0,1}]` =
    # alphah,alphav per pixel, broadcast identically on both sides (NEON vld1_dup /
    # RVV vlse32 stride-0) → SYMBOLIC shared. Output output[op*channels+c] contiguous.
    # FP sub/mul/add → input-range. No params struct.
    return FixtureSpec(
        dims={"channels": [1, 2, 4, 5, 8], "output_pixels": [1, 2]},
        strides={"input_offset": "0", "output_increment": "0"},
        extents={"weights": "output_pixels * 2 * sizeof(float) + 64",
                 "output": "output_pixels * channels * sizeof(float) + 64"},
        out_buffers=["output"], out_extent="output_pixels * channels", out_region=None,
        indirect={"input": {"count": "output_pixels * 4", "row": "input_offset + channels"}},
        elem="float", kind="F32")


def _match_fixture(sig, src=""):
    # `src` lets us read a size constant the signature can't reveal (igemm/igemm-ks3
    # and dwconv/dwconv-9p share identical signatures — only `ks`/tap-count differ).
    names = {p.name for p in sig.params}
    if {"input_stride", "output_stride", "block_width", "block_height"} <= names:
        elem = next((p.pointee for p in sig.params if p.is_pointer), "uint32_t")
        return _transpose_fixture(elem)   # element width from the buffer type
    if {"rows", "channels", "input_stride", "output_stride", "weights"} <= names:
        return _vmulcaddc_fixture()       # 2-row scale+bias+clamp (dual-packed weights)
    if ({"mr", "nc", "kc", "ks"} <= names
            and any(p.is_ptr_to_ptr for p in sig.params)):
        m = re.search(r'\bks\s*==\s*(\d+)', src)          # assert(ks == N)
        return _igemm_fixture(int(m.group(1)) if m else 1)
    if ({"channels", "output_width", "weights", "input_offset"} <= names
            and any(p.is_ptr_to_ptr for p in sig.params)):
        m = re.search(r'input\s*\[\s*ow\s*\*\s*(\d+)', src)  # input[ow * K + ...]
        return _dwconv_fixture(int(m.group(1)) if m else 3)
    if ({"output_pixels", "channels", "weights"} <= names
            and "kernel_elements" not in names
            and any(p.is_ptr_to_ptr for p in sig.params)):
        return _ibilinear_fixture()       # indirect 4-corner bilinear (f32)
    if {"n_out", "stride", "x", "y"} <= names and len(sig.params) == 4:
        return _strided_slice_fixture()   # pure strided gather (copy)
    if {"na", "nb", "a", "b", "y"} <= names and len(sig.params) == 5:
        return _concat2_fixture()         # pure concatenation (2 in → 1 out)
    if {"na", "nb", "x", "a", "b"} <= names and len(sig.params) == 5:
        return _split2_fixture()          # pure split (1 in → 2 out, multi-output compare)
    if {"mr", "nc", "kc", "a_stride", "cm_stride", "cn_stride"} <= names:
        return _gemm_fixture()
    if ({"output_pixels", "kernel_elements", "channels", "input_offset"} <= names
            and any(p.is_ptr_to_ptr for p in sig.params)):
        # `const float**` pointee normalizes to "float *" — strip the inner `*`.
        # libclang canonicalizes int8_t→"signed char"; map back to the stdint name.
        ind = next(p.pointee for p in sig.params if p.is_ptr_to_ptr)
        elem = ind.replace("*", "").strip()
        elem = {"signed char": "int8_t", "unsigned char": "uint8_t"}.get(elem, elem)
        if elem in _MINMAX_PARAMS:        # f32/s8/u8 maxpool; f16 (Phase 3) defers.
            return _maxpool_fixture(elem)
    return None


def generate_multidim(neon_path, rvv_path, name, neon, rvv, spec, input_range=None) -> str:
    weights = set(spec.weights)
    indirect = set(spec.indirect)
    dual = set(spec.dual_weights)
    param_names = {p.name for p in neon.params if p.is_struct_ptr}
    inputs = [p.name for p in neon.params
              if p.is_pointer and p.points_to_const and not p.is_struct_ptr
              and not p.is_ptr_to_ptr
              and p.name not in spec.dims and p.name not in weights and p.name not in dual]
    outputs = [p.name for p in neon.params
               if p.is_pointer and not p.points_to_const and not p.is_ptr_to_ptr
               and p.name not in spec.dims]
    elem = spec.elem
    decls = [f"    const size_t {s} = {e};" for s, e in spec.strides.items()]
    # Indirect inputs: `const T** name` is a table of `count` row pointers into one
    # shared symbolic buffer. Both kernels read the same table → same symbols, so
    # an intrinsic load resolves to identical bytes on each side.
    for nm, spc in spec.indirect.items():
        cnt, row = spc["count"], spc["row"]
        decls += [
            f"    const size_t _{nm}_rows = ({cnt}), _{nm}_row = ({row});  // ptr count, elems/row",
            f"    std::vector<{elem}> {nm}_data(_{nm}_rows * _{nm}_row + 16, 0);",
            f'    auto& _b_{nm} = ctx.registerBuffer("{nm}", _{nm}_rows * _{nm}_row * sizeof({elem})); _b_{nm}.bind({nm}_data.data());',
            f"    std::vector<const {elem}*> {nm}_tbl(_{nm}_rows);",
            f"    for (size_t _k = 0; _k < _{nm}_rows; _k++) {nm}_tbl[_k] = {nm}_data.data() + _k * _{nm}_row;",
        ]
    # extents are byte-counts; size the typed backing array to cover them.
    nelem = lambda ext: f"({ext}) / sizeof({elem}) + 1"
    # FP inputs may be read scalar-wise (`*a0++` → `_vf_`); the NaN-payload
    # sentinel bridges those reads to the same symbolic bytes the intrinsic
    # loads see. Int inputs use the salt_scalar rewrite instead.
    bindm = "bindScalarRef" if elem in _FP_CTYPES else "bind"
    for b in inputs:                    # symbolic inputs (e.g. activations)
        ext = spec.extents[b]
        decls += [f"    std::vector<{elem}> {b}_arr({nelem(ext)}, 0);",
                  f'    auto& _b_{b} = ctx.registerBuffer("{b}", ({ext})); _b_{b}.{bindm}({b}_arr.data());']
    for b in outputs:
        ext = spec.extents[b]
        decls += [f"    std::vector<{elem}> {b}_neon_arr({nelem(ext)}, 0), {b}_rvv_arr({nelem(ext)}, 0);",
                  f'    auto& _b_{b}_neon = ctx.registerBuffer("{b}_neon", ({ext})); _b_{b}_neon.bind({b}_neon_arr.data());',
                  f'    auto& _b_{b}_rvv  = ctx.registerBuffer("{b}_rvv",  ({ext})); _b_{b}_rvv.bind({b}_rvv_arr.data());']
    for b, (ext, fill) in spec.weights.items():   # concrete uniform weights (layout-invariant)
        decls += [f"    std::vector<{elem}> {b}_arr({nelem(ext)}, {fill});",
                  f'    ctx.registerConcreteBuffer("{b}", {b}_arr.data(), ({ext}));']
    ebits = _BYTES[elem] * 8
    # Dual-packed weights: one shared symbolic logical set `wlog` (plane-major:
    # wlog[p*N + col]) is placed into TWO physical buffers at each dialect's tile
    # offsets. `planes` = logical planes per column (vmulcaddc: 2 = scale,bias;
    # GEMM: 1+kc_floats = bias + weight rows). NEON tiles are uniform/padded (width
    # neon_tile); RVV tiles are `rvv_packed` (advance by chunk, vmulcaddc) or padded
    # (advance by full tile, GEMM `w += nr`). Both kernels recover wlog[p*N+col].
    for nm, dw in spec.dual_weights.items():
        P, N, NT, RT = dw["planes"], dw["ncols"], dw["neon_tile"], dw["rvv_tile"]
        packed = dw.get("rvv_packed", False)
        decls += [
            f"    const size_t _{nm}_P = ({P}), _{nm}_N = ({N});  // planes, logical columns",
            f'    auto& _wlog_{nm} = ctx.registerBuffer("{nm}_log", _{nm}_P * _{nm}_N * sizeof({elem}));',
            f"    const size_t _{nm}_NT = ({NT});",
            f"    std::vector<{elem}> {nm}_neon_arr(((_{nm}_N + _{nm}_NT - 1) / _{nm}_NT) * _{nm}_P * _{nm}_NT + 8, 0);",
            f'    auto& _wN_{nm} = ctx.registerBuffer("{nm}_neon", {nm}_neon_arr.size() * sizeof({elem})); _wN_{nm}.bind({nm}_neon_arr.data());',
            f"    size_t _{nm}_RT = ({RT}); if (_{nm}_RT < 1) _{nm}_RT = 1;",
            f"    std::vector<{elem}> {nm}_rvv_arr(((_{nm}_N + _{nm}_RT - 1) / _{nm}_RT) * _{nm}_P * _{nm}_RT + 8, 0);",
            f'    auto& _wR_{nm} = ctx.registerBuffer("{nm}_rvv", {nm}_rvv_arr.size() * sizeof({elem})); _wR_{nm}.bind({nm}_rvv_arr.data());',
            f"    for (size_t _col = 0; _col < _{nm}_N; _col++) {{",
            f"      size_t _t = _col / _{nm}_NT, _j = _col % _{nm}_NT;",
            f"      for (size_t _p = 0; _p < _{nm}_P; _p++) {{",
            f"        Term _v = _wlog_{nm}.loadScalar((_p * _{nm}_N + _col) * sizeof({elem}), {ebits});",
            f"        _wN_{nm}.storeScalar((_t * _{nm}_P * _{nm}_NT + _p * _{nm}_NT + _j) * sizeof({elem}), _v, {ebits});",
            f"      }}",
            f"    }}",
        ]
        if packed:   # RVV chunked: tile width vl=min(remaining,RT), offset advances by P*vl
            decls += [
                f"    {{ size_t _off = 0, _c = 0;",
                f"      while (_c < _{nm}_N) {{",
                f"        size_t _vl = (_{nm}_N - _c < _{nm}_RT) ? (_{nm}_N - _c) : _{nm}_RT;",
                f"        for (size_t _j = 0; _j < _vl; _j++)",
                f"          for (size_t _p = 0; _p < _{nm}_P; _p++) {{",
                f"            Term _v = _wlog_{nm}.loadScalar((_p * _{nm}_N + _c + _j) * sizeof({elem}), {ebits});",
                f"            _wR_{nm}.storeScalar((_off + _p * _vl + _j) * sizeof({elem}), _v, {ebits});",
                f"          }}",
                f"        _off += _{nm}_P * _vl; _c += _vl;",
                f"      }} }}",
            ]
        else:        # RVV padded: uniform tiles of width RT (advance by P*RT, like GEMM `w += nr`)
            decls += [
                f"    for (size_t _col = 0; _col < _{nm}_N; _col++) {{",
                f"      size_t _t = _col / _{nm}_RT, _j = _col % _{nm}_RT;",
                f"      for (size_t _p = 0; _p < _{nm}_P; _p++) {{",
                f"        Term _v = _wlog_{nm}.loadScalar((_p * _{nm}_N + _col) * sizeof({elem}), {ebits});",
                f"        _wR_{nm}.storeScalar((_t * _{nm}_P * _{nm}_RT + _p * _{nm}_RT + _j) * sizeof({elem}), _v, {ebits});",
                f"      }}",
                f"    }}",
            ]
    if spec.params:                     # concrete params struct (plain-C field reads)
        st, fields = spec.params
        decls.append(f"    {st} params{{}};")
        decls += [f"    params.{f} = {v};" for f, v in fields.items()]
    if input_range and elem == "float":  # optional: restrict F32 inputs to finite [lo,hi]
        lo, hi = input_range
        for b in inputs:                  # element count within capacity (floor, no +1)
            decls += _emit_input_range(f"_b_{b}", f"({spec.extents[b]}) / sizeof({elem})", lo, hi)
        for nm in spec.indirect:          # indirect-input bytes also need the finite band
            decls += _emit_input_range(f"_b_{nm}", f"_{nm}_rows * _{nm}_row", lo, hi)
        for nm in spec.dual_weights:       # logical weights (shared by both packings)
            decls += _emit_input_range(f"_wlog_{nm}", f"_{nm}_P * _{nm}_N", lo, hi)
    cfg_tag = "finite" if input_range else "symbolic"

    def call_args(side):
        out = []
        for p in neon.params:
            if p.name in inputs or p.name in weights:
                out.append(f"{p.name}_arr.data()")
            elif p.name in dual:        # dual-packed weights: each side gets its own layout
                out.append(f"{p.name}_neon_arr.data()" if side == "neon"
                           else f"{p.name}_rvv_arr.data()")
            elif p.name in indirect:
                out.append(f"{p.name}_tbl.data()")
            elif p.name in outputs:
                out.append(f"{p.name}_{side}_arr.data()")
            elif p.name in param_names:
                out.append("&params")
            else:                       # dim or stride → pass by name (local/arg)
                out.append(p.name)
        return ", ".join(out)

    if spec.out_extents:                # multi-output: AND a contiguous compare per output
        terms = [f"buffers_equal(ctx.tm, _b_{ob}_neon, _b_{ob}_rvv, {ext}, "
                 f"sizeof({elem}), ElementKind::{spec.kind})"
                 for ob, ext in spec.out_extents.items()]
        cmp_expr = terms[0]
        for t in terms[1:]:
            cmp_expr = f"ctx.land_({cmp_expr}, {t})"
    else:
        ob = spec.out_buffers[0]
        if spec.out_region:             # strided affine output region
            r = spec.out_region
            cmp_expr = (f"buffers_equal_strided(ctx.tm, _b_{ob}_neon, _b_{ob}_rvv, "
                        f"{r['rows']}, {r['cols']}, {r['row_stride']}, {r['col_stride']}, "
                        f"sizeof({elem}), ElementKind::{spec.kind})")
        else:
            cmp_expr = (f"buffers_equal(ctx.tm, _b_{ob}_neon, _b_{ob}_rvv, "
                        f"{spec.out_extent}, sizeof({elem}), ElementKind::{spec.kind})")
    dims = list(spec.dims)
    dim_sig = ", ".join(f"size_t {d}" for d in dims)
    dim_call = ", ".join(dims)
    dimfmt = ",".join("%zu" for _ in dims)

    def nest(i):
        if i == len(dims):
            # Each combo's query gets the remaining total budget; once it's spent,
            # the rest of the grid reports TIMEOUT without running.
            return (
                f'        if (budget > 0.0 && _rem() <= 0.0) {{\n'
                f'            printf("{{\\"status\\":\\"TIMEOUT\\",\\"dims\\":\\"{dimfmt}\\",\\"config\\":\\"{cfg_tag}\\"}}\\n", {dim_call});\n'
                f'        }} else {{\n'
                f'            int _r = verify({dim_call}, vlen, _rem());\n'
                f'            if (_r == 1) return 1;\n'
                f'        }}')
        d = dims[i]
        vals = ", ".join(str(v) for v in spec.dims[d])
        return (f"      for (size_t {d} : {{{vals}}}) {{\n{nest(i + 1)}\n      }}")

    decls_str = "\n".join(decls)
    neon_body = _strip_simd_includes(open(neon_path).read())
    rvv_body = _strip_simd_includes(open(rvv_path).read())
    main_loop = nest(0)
    return f"""// AUTO-GENERATED by emit.py — multi-dim harness ({name}).
#include "salt.hpp"
#include <cassert>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <vector>
using namespace salt;

#define restrict

namespace neon_kernel {{
{neon_body}
}} // namespace neon_kernel

namespace rvv_kernel {{
{rvv_body}
}} // namespace rvv_kernel

int verify({dim_sig}, size_t vlen, double timeout_s) {{
    VerificationContext ctx(vlen);
    g_ctx = &ctx;
{decls_str}

    neon_kernel::{neon.func_name}({call_args("neon")});
    rvv_kernel ::{rvv.func_name}({call_args("rvv")});

    Term eq = {cmp_expr};
    ctx.assert_(ctx.lnot_(eq));
    if (timeout_s > 0) ctx.set_query_timeout_ms((uint64_t)(timeout_s * 1000.0));
    CheckResult _c = ctx.check();
    if (_c == CheckResult::Unsat) {{
        printf("{{\\"status\\":\\"VERIFIED\\",\\"dims\\":\\"{dimfmt}\\",\\"config\\":\\"{cfg_tag}\\"}}\\n", {dim_call});
        return 0;
    }}
    if (_c == CheckResult::Unknown) {{
        printf("{{\\"status\\":\\"TIMEOUT\\",\\"dims\\":\\"{dimfmt}\\",\\"config\\":\\"{cfg_tag}\\"}}\\n", {dim_call});
        return 2;
    }}
    printf("{{\\"status\\":\\"COUNTEREXAMPLE\\",\\"dims\\":\\"{dimfmt}\\",\\"config\\":\\"{cfg_tag}\\"}}\\n", {dim_call});
    return 1;
}}

int main(int argc, char** argv) {{
    size_t vlen   = (argc > 3) ? (size_t)atoi(argv[3]) : 256;
    double budget = (argc > 4) ? atof(argv[4]) : 0.0;     // TOTAL wall-clock budget (s); 0 = none
    auto _t0 = std::chrono::steady_clock::now();
    auto _rem = [&]() -> double {{                         // seconds left in the total budget (0 = no limit)
        if (budget <= 0.0) return 0.0;
        double e = std::chrono::duration<double>(std::chrono::steady_clock::now() - _t0).count();
        return budget - e;
    }};
{main_loop}
    printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":0,\\"end\\":0,\\"configs\\":1}}\\n");
    return 0;
}}
"""


def generate_harness(neon_path: str, rvv_path: str, name: str,
                     params_mode: str = "symbolic", input_range=None) -> str:
    neon = parse_signature(neon_path, "test_neon")
    rvv = parse_signature(rvv_path, "test_rvv")
    if len(neon.params) != len(rvv.params):
        raise ValueError(f"signature arity mismatch: {len(neon.params)} vs {len(rvv.params)}")
    _fx = _match_fixture(neon, open(neon_path).read())   # multi-dim fixture family (Phase 2)?
    if _fx is not None:
        return generate_multidim(neon_path, rvv_path, name, neon, rvv, _fx, input_range)
    roles = resolve_roles(neon)

    if roles.indirect:
        raise NotImplementedError("indirect (T**) inputs not yet supported")
    if len(roles.params) > 1:
        raise NotImplementedError("multiple params structs not yet supported")

    if params_mode not in ("symbolic", "concrete"):
        raise ValueError(f"params_mode must be 'symbolic' or 'concrete', got {params_mode!r}")

    # --- param-struct handling (user-selected mode; default symbolic) ---
    params_names = {p.name for p in roles.params}
    params_setup: list[str] = []
    config_pre = ""             # code emitted before verify() (concrete config table)
    cfg_param = ""              # extra verify() arg in concrete mode
    config_str = '"symbolic"'   # C expr for the verdict's config tag
    n_configs = 1
    is_concrete = False
    sym_param_rewrite = None    # (struct, pname, leaves) when symbolic-int rewrite applies
    if roles.params:
        st = roles.params[0].struct_name
        leaves = parse_struct_leaves(_XNN_MIN_H, st)
        cls = classify_param_struct(leaves)
        if cls == "none":                  # empty/dummy struct (xnn_f32_default_params)
            params_setup.append(f"    {st} params{{}};")
            config_str = '"no-params"'
        elif params_mode == "concrete":    # float OR int → concrete edge configs
            paths, combos = _gen_configs(leaves)
            if not combos:
                raise NotImplementedError(f"no concrete configs for {st}")
            config_pre = _emit_config_table(st, paths, combos)
            # Register as a concrete buffer so intrinsic param-loads
            # (e.g. vld1_dup_f32(&params->scalar.x)) resolve via findBuffer.
            params_setup += [f"    {st} params{{}};", "    _set_params(params, cfg);",
                             f'    ctx.registerConcreteBuffer("params", &params, sizeof({st}));']
            cfg_param, config_str, n_configs, is_concrete = \
                ", size_t cfg", "_cfg_name(cfg)", len(combos), True
        elif cls == "float":               # symbolic all-float → sentinel
            params_setup += [f"    {st} params{{}};",
                             f'    auto& _b_params = ctx.registerBuffer("params", sizeof({st}));',
                             "    _b_params.bindScalarRef(&params);"]
        else:                              # symbolic int (cls == 'int')
            if [p for p, t, _ in leaves if t in _FP_CTYPES and p != "_"]:
                raise NotImplementedError(f"mixed int+float symbolic params ({st}); "
                                          "re-run with --params concrete")
            pname = roles.params[0].name
            params_setup += [f"    {st} params{{}};",
                             f'    auto& _b_params = ctx.registerBuffer("params", sizeof({st}));',
                             "    _b_params.bind(&params);"]
            params_setup += _emit_param_constraints(st, leaves)   # validity (shift∈[0,31], …)
            _ranges = get_param_ranges(name)                      # per-field [lo,hi] bounds
            if _ranges:
                params_setup += _emit_param_ranges(st, leaves, _ranges)
            sym_param_rewrite = (st, pname, leaves)               # rewrite params->field in bodies
    if len(roles.bounds) != 1:
        raise NotImplementedError(f"elementwise slice needs exactly one bound; got "
                                  f"{[p.name for p in roles.bounds]}")
    if not roles.outputs:
        raise ValueError("no output buffer found")
    bound = roles.bounds[0].name

    neon_src = open(neon_path).read()
    rvv_src = open(rvv_path).read()
    byte_unit, unit_type = _detect_byte_unit(neon_src, bound)
    unit_bytes = 1
    if byte_unit:
        if unit_type not in _BYTES:
            raise NotImplementedError(f"byte-unit element type {unit_type!r} unknown")
        unit_bytes = _BYTES[unit_type]
        # Slice limitation: every buffer's element is the byte-unit size, so the
        # element count maps cleanly. Mixed widths (e.g. vcvt) come later.
        for p in roles.inputs + roles.outputs:
            if _BYTES.get(p.pointee) != unit_bytes:
                raise NotImplementedError("mixed element sizes with byte-unit batch not yet supported")

    input_names = {p.name for p in roles.inputs}
    output_names = {p.name for p in roles.outputs}

    # buffer setup
    decls = []
    for p in roles.inputs:
        ct = p.pointee
        decls.append(f'    std::vector<{ct}> {p.name}_arr(cap, ({ct})0);')
        decls.append(f'    auto& _b_{p.name} = ctx.registerBuffer("{p.name}", cap * sizeof({ct}));'
                     f' _b_{p.name}.bind({p.name}_arr.data());')
    for p in roles.outputs:
        ct = p.pointee
        inout = _output_is_read(neon_src, p.name) or _output_is_read(rvv_src, p.name)
        decls.append(f'    std::vector<{ct}> {p.name}_neon_arr(cap, ({ct})0), {p.name}_rvv_arr(cap, ({ct})0);')
        decls.append(f'    auto& _b_{p.name}_neon = ctx.registerBuffer("{p.name}_neon", cap * sizeof({ct}));'
                     f' _b_{p.name}_neon.bind({p.name}_neon_arr.data());')
        decls.append(f'    auto& _b_{p.name}_rvv  = ctx.registerBuffer("{p.name}_rvv",  cap * sizeof({ct}));'
                     f' _b_{p.name}_rvv.bind({p.name}_rvv_arr.data());')
        if inout:
            # In-out / accumulator: both sides share one symbolic initial image
            # (pure outputs keep independent poison so a missing write is caught).
            decls.append(
                f'    for (size_t _i = 0; _i < cap * sizeof({ct}); _i++) '
                f'_b_{p.name}_rvv.setByte(_i, _b_{p.name}_neon.getByte(_i));  // shared init (in-out)')

    decls.extend(params_setup)
    # The sweep variable {bound} is always an *element* count; for byte-unit
    # kernels convert it to the byte count the kernel expects.
    if byte_unit:
        decls.append(f"    const size_t _kbound = {bound} * {unit_bytes};  // elements -> bytes")
    bound_call = "_kbound" if byte_unit else bound
    if input_range:                     # optional: restrict F32 inputs to finite [lo,hi]
        lo, hi = input_range
        for p in roles.inputs:
            if p.pointee == "float":
                decls += _emit_input_range(f"_b_{p.name}", "cap", lo, hi)
        if config_str == '"symbolic"':
            config_str = '"finite"'

    # positional call args (inputs shared; outputs differ neon/rvv)
    def call_args(side: str) -> str:
        out = []
        for p in neon.params:
            if p.name in input_names:
                out.append(f"{p.name}_arr.data()")
            elif p.name in output_names:
                out.append(f"{p.name}_{side}_arr.data()")
            elif p.name in params_names:
                out.append("&params")
            elif p.name == bound:
                out.append(bound_call)
            else:
                out.append(p.name)
        return ", ".join(out)

    # output comparison over the logical region [0, bound) per output
    cmps = []
    for p in roles.outputs:
        cmps.append(f'        buffers_equal(ctx.tm, _b_{p.name}_neon, _b_{p.name}_rvv, '
                    f'{bound}, sizeof({p.pointee}), ElementKind::{_kind(p.pointee)})')
    cmp_expr = "\n      , ".join(cmps)

    # counterexample scan: first differing element of the first output
    first_out = roles.outputs[0]
    fo_ct = first_out.pointee
    fo_bits = _BYTES[first_out.pointee] * 8

    decls_str = "\n".join(decls)
    neon_body = _strip_simd_includes(neon_src)
    rvv_body = _strip_simd_includes(rvv_src)
    # Scalar-broadcast inputs (`*input_b`) → symbolic accessor, so the broadcast
    # constant is symbolic rather than the concrete backing (which would be 0).
    scalar_bcast = (_scalar_broadcast_inputs(neon_src, input_names) |
                    _scalar_broadcast_inputs(rvv_src, input_names))
    if scalar_bcast:
        neon_body = _rewrite_scalar_broadcast(neon_body, scalar_bcast)
        rvv_body = _rewrite_scalar_broadcast(rvv_body, scalar_bcast)
    if sym_param_rewrite:
        _st, _pn, _lv = sym_param_rewrite
        neon_body = _rewrite_symbolic_params(neon_body, _st, _pn, _lv)
        rvv_body = _rewrite_symbolic_params(rvv_body, _st, _pn, _lv)

    if is_concrete:
        main_loop = f"""    size_t _last = start ? start - 1 : 0;
    for (size_t cfg = 0; cfg < {n_configs}; cfg++) {{
      for (size_t b = start; (end == 0 || b <= end); b++) {{
        if (budget > 0.0 && _rem() <= 0.0) {{ printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"vlen\\":%zu}}\\n", b, vlen); goto _done; }}
        int r = verify(b, vlen, cfg, _rem());   // per-query limit = remaining total budget
        if (r == 1) return 1;   // counterexample — stop
        if (r == 2) break;      // batch hit the budget — larger batches only get harder; next config
        if (b > _last) _last = b;
      }}
    }}
_done:
    printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":%zu,\\"end\\":%zu,\\"configs\\":{n_configs}}}\\n", start, _last);"""
    else:
        main_loop = f"""    size_t _last = start ? start - 1 : 0;
    for (size_t b = start; (end == 0 || b <= end); b++) {{
        if (budget > 0.0 && _rem() <= 0.0) {{ printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"vlen\\":%zu}}\\n", b, vlen); break; }}
        int r = verify(b, vlen, _rem());        // per-query limit = remaining total budget
        if (r == 1) return 1;   // counterexample — stop
        if (r == 2) break;      // batch hit the budget — larger batches only get harder
        _last = b;
    }}
    printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":%zu,\\"end\\":%zu,\\"configs\\":1}}\\n", start, _last);"""

    return f"""// AUTO-GENERATED by emit.py — uniform harness (no Shape/profile).
#include "salt.hpp"
#include <cassert>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <vector>
using namespace salt;

#define restrict          // C-only keyword; this harness compiles as C++

// Symbolic accessor for scalar-broadcast input reads (`*input_b`).
template <typename T>
static inline SymbolicScalar<T> salt_scalar(const T* p) {{
    auto& _sb = g_ctx->findBuffer((const void*)p);
    return SymbolicScalar<T>(_sb, _sb.ptrToByteOffset((const void*)p));
}}
// Symbolic accessor for params-struct field reads (`params->scalar.x`).
template <typename T>
static inline SymbolicScalar<T> salt_param(const void* base, size_t off) {{
    auto& _pb = g_ctx->findBuffer(base);
    return SymbolicScalar<T>(_pb, _pb.ptrToByteOffset(base) + off);
}}

namespace neon_kernel {{
{neon_body}
}} // namespace neon_kernel

namespace rvv_kernel {{
{rvv_body}
}} // namespace rvv_kernel

{config_pre}
// returns 0=VERIFIED, 1=COUNTEREXAMPLE, 2=TIMEOUT/UNKNOWN
int verify(size_t {bound}, size_t vlen{cfg_param}, double timeout_s) {{
    VerificationContext ctx(vlen);
    g_ctx = &ctx;
    const size_t cap = {bound} + 16;   // over-allocate; exact size not needed
{decls_str}

    neon_kernel::{neon.func_name}({call_args("neon")});
    rvv_kernel ::{rvv.func_name}({call_args("rvv")});

    Term eq = {cmp_expr};
    ctx.assert_(ctx.lnot_(eq));
    if (timeout_s > 0) ctx.set_query_timeout_ms((uint64_t)(timeout_s * 1000.0));
    CheckResult _r = ctx.check();
    if (_r == CheckResult::Unsat) {{
        printf("{{\\"status\\":\\"VERIFIED\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {bound}, vlen, {config_str});
        return 0;
    }}
    if (_r == CheckResult::Unknown) {{   // solver gave up (e.g. per-query timeout) — NOT a counterexample
        printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {bound}, vlen, {config_str});
        return 2;
    }}
    size_t fi = 0;
    for (size_t e = 0; e < {bound}; e++) {{
        Term n = ctx.solver->getValue(_b_{first_out.name}_neon.loadScalar(e * sizeof({fo_ct}), {fo_bits}));
        Term v = ctx.solver->getValue(_b_{first_out.name}_rvv.loadScalar(e * sizeof({fo_ct}), {fo_bits}));
        if (n.getBitVectorValue(10) != v.getBitVectorValue(10)) {{ fi = e; break; }}
    }}
    printf("{{\\"status\\":\\"COUNTEREXAMPLE\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\",\\"fail_index\\":%zu}}\\n", {bound}, vlen, {config_str}, fi);
    return 1;
}}

int main(int argc, char** argv) {{
    if (argc < 3) {{ fprintf(stderr, "Usage: %s <start> <end(0=unbounded)> [vlen] [time_budget_s]\\n", argv[0]); return 2; }}
    size_t start = (size_t)atoi(argv[1]);
    size_t end   = (size_t)atoi(argv[2]);                 // 0 = unbounded: sweep until the time budget
    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : 256;
    double budget = (argc > 4) ? atof(argv[4]) : 0.0;     // TOTAL wall-clock budget (s); 0 = none
    if (end == 0 && budget <= 0.0) budget = 600.0;        // unbounded needs a budget — default 10 min
    auto _t0 = std::chrono::steady_clock::now();
    auto _rem = [&]() -> double {{                         // seconds left in the total budget (0 = no limit)
        if (budget <= 0.0) return 0.0;
        double e = std::chrono::duration<double>(std::chrono::steady_clock::now() - _t0).count();
        return budget - e;
    }};
{main_loop}
    return 0;
}}
"""
