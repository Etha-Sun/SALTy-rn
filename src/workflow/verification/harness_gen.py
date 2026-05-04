"""
C++ verification harness generator.

Takes a HarnessSpec (from sig_parser + size_inferrer) and generates
a complete C++ file that runs both kernels symbolically and compares outputs.
"""

import logging
import re
from pathlib import Path

from .sig_parser import (ArgRole, SCALAR_VALUE_ROLES,
                          parse_signature, classify_args, refine_with_source)
from .size_inferrer import (HarnessSpec, BufferSpec, Shape,
                             infer_buffer_sizes, resolve_unknown_sizes_with_llm)
from .param_configs import (generate_configs, config_to_cpp,
                            get_verify_prologue, get_kernel_prologue, get_params_fields)
from .kernel_profiles import get_profile

log = logging.getLogger("pipeline")


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

def generate_harness_from_files(neon_path: str, rvv_path: str,
                                 kernel_name: str = "",
                                 params_init: str = "",
                                 param_configs: list[tuple[str, str]] = None,
                                 symbolic_params: bool = False,
                                 vlen: int = 256,
                                 backend: str = "bitwuzla",
                                 per_query_timeout_ms: int = 600000,
                                 llm_client=None) -> str:
    """End-to-end: parse → validate → infer → generate.

    param_configs: list of (config_name, init_code) pairs. If provided,
                   overrides params_init. If neither is provided and the kernel
                   has params, auto-generates edge-case configs.
    symbolic_params: if True, params are backed by a SymbolicBuffer and
                     kernel source is rewritten to use SymbolicScalar<T>.
                     Proves equivalence for ALL valid params in one query.
    backend: 'bitwuzla' or 'cvc5'.  The harness body is backend-agnostic — it
             only goes through ctx.* helpers — but the emitted file records
             the choice in a comment for reproducibility, and a per-query
             timeout call is emitted using the helper API.
    """
    neon_source = Path(neon_path).read_text()
    rvv_source = Path(rvv_path).read_text()

    # Parse both signatures
    neon_sig = parse_signature(neon_source)
    rvv_sig = parse_signature(rvv_source)
    if not neon_sig:
        raise ValueError(f"Could not parse function signature from {neon_path}")
    if not rvv_sig:
        raise ValueError(f"Could not parse function signature from {rvv_path}")

    # Classify NEON args
    neon_sig = classify_args(neon_sig, kernel_name or neon_sig.name)
    neon_sig = refine_with_source(neon_sig, neon_source)

    # Validate signatures are compatible
    _validate_signatures(neon_sig, rvv_sig)

    # Infer buffer sizes
    spec = infer_buffer_sizes(neon_sig, kernel_name)
    spec.neon_func_name = neon_sig.name
    spec.rvv_func_name = rvv_sig.name
    spec.vlen = vlen

    # LLM fallback for unknown sizes
    if spec.needs_llm and llm_client:
        spec = resolve_unknown_sizes_with_llm(spec, neon_source, rvv_source, llm_client)

    # LLM shape advisor — only runs for UNCLASSIFIED plans or plans with
    # unresolved fields.  Returns the plan unchanged when llm_client is None.
    from .llm_shape_advisor import advise_shape_plan
    advise_shape_plan(spec.shape_plan, neon_sig, neon_source, llm_client)

    # Detect byte-count batch convention: kernels that assert
    # `batch % sizeof(T) == 0` measure batch in bytes, not elements.
    # Regex heuristic on the NEON source — works because XNNPACK kernels
    # follow a consistent idiom.  A kernel profile override is the right
    # long-term fix when a second case forces it.
    ba = re.escape(spec.sweep_arg)
    if re.search(rf'{ba}\s*%\s*sizeof\s*\(', neon_source) or \
       re.search(rf'{ba}\s*/\s*sizeof\s*\(', neon_source):
        if spec.shape_plan.sweep_dims:
            spec.shape_plan.sweep_dims[0].unit = "bytes"
        log.info("Detected byte-count batch convention for %s (elem_bytes=%d)",
                 kernel_name, spec.elem_bytes)

    # Check kernel profile for symbolic_params override
    profile = get_profile(kernel_name or neon_sig.name)
    param_ranges = None
    if not symbolic_params and profile and profile.symbolic_params:
        symbolic_params = True
        param_ranges = profile.param_ranges
        log.info("Profile enables symbolic params for %s (ranges: %s)",
                 kernel_name, param_ranges)

    # Build param configs
    if symbolic_params:
        # Symbolic mode: single config with zeroed params (concrete values unused)
        param_configs = [("symbolic", "")]
        log.info("Symbolic params mode for %s", spec.params_type)
    elif param_configs is None:
        if params_init:
            param_configs = [("default", params_init)]
        elif spec.params_type:
            cfgs = generate_configs(spec.params_type)
            param_configs = [(f"cfg{i}", config_to_cpp(spec.params_type, c))
                             for i, c in enumerate(cfgs)]
            log.info("Auto-generated %d param configs for %s",
                     len(param_configs), spec.params_type)
        else:
            param_configs = [("default", "")]

    # Generate
    return _generate(spec, neon_source, rvv_source, param_configs,
                     symbolic_params, param_ranges, backend=backend,
                     per_query_timeout_ms=per_query_timeout_ms)


# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

def _validate_signatures(neon_sig, rvv_sig):
    if len(neon_sig.args) != len(rvv_sig.args):
        raise ValueError(
            f"Arg count mismatch: NEON={len(neon_sig.args)}, RVV={len(rvv_sig.args)}")
    for i, (na, ra) in enumerate(zip(neon_sig.args, rvv_sig.args)):
        if na.is_pointer != ra.is_pointer:
            raise ValueError(f"Arg {i} pointer mismatch: NEON '{na.name}' vs RVV '{ra.name}'")
        if na.is_pointer and na.base_type != ra.base_type:
            raise ValueError(f"Arg {i} type mismatch: NEON {na.base_type}* vs RVV {ra.base_type}*")
        if na.is_pointer and na.is_const != ra.is_const:
            raise ValueError(f"Arg {i} const mismatch: NEON '{na.name}' vs RVV '{ra.name}'")


# ---------------------------------------------------------------------------
# Code generation
# ---------------------------------------------------------------------------

def _generate(spec: HarnessSpec, neon_source: str, rvv_source: str,
              configs: list[tuple[str, str]], symbolic_params: bool = False,
              param_ranges: dict = None, backend: str = "bitwuzla",
              per_query_timeout_ms: int = 600000) -> str:
    """Assemble the complete C++ harness."""
    # Validate spec
    unknown = [b for b in spec.buffers if b.size_expr == "UNKNOWN"]
    if unknown:
        raise ValueError(f"Unknown buffer sizes: {[b.arg_name for b in unknown]}")

    output_bufs = [b for b in spec.buffers if b.role == ArgRole.OUTPUT]
    if not output_bufs:
        raise ValueError("No output buffers — cannot verify")

    # Rewrite kernel sources for symbolic params
    if symbolic_params and spec.params_type:
        neon_source = _rewrite_params_symbolic(neon_source, spec.params_type)
        rvv_source = _rewrite_params_symbolic(rvv_source, spec.params_type)

    # Rewrite NEON LUT gathers and strip RVV extern table declarations
    tables = spec.profile.lookup_tables if spec.profile and spec.profile.lookup_tables else None
    if tables:
        neon_source = _rewrite_neon_lut_gathers(neon_source, tables)
        rvv_source = _strip_lut_externs(rvv_source, tables)

    parts = [
        _emit_header(backend=backend),
        _emit_kernel("neon_kernel", neon_source, ["arm_neon.h"]),
        _emit_kernel("rvv_kernel", rvv_source, ["riscv_vector.h"]),
        _emit_verify(spec, symbolic_params, param_ranges, per_query_timeout_ms),
        _emit_main(spec, configs),
    ]
    return "\n".join(parts)


def _rewrite_params_symbolic(source: str, params_type: str) -> str:
    """Rewrite kernel source to use SymbolicScalar for params access.

    Replaces params->member.field value reads with sym_field variables.
    Leaves &params->member.field (address-of for vld1_dup) untouched.
    Injects SymbolicScalar declarations at the start of the function body.
    """
    fields = get_params_fields(params_type)
    if not fields:
        return source

    # Inject kernel prologue after the first '{' of the function body
    kernel_prologue = get_kernel_prologue(params_type)
    if kernel_prologue:
        # Find the function's opening brace (skip struct/comment braces)
        # Look for the pattern: ) { or ) XNN_OOB_READS {
        match = re.search(r'\)\s*(?:XNN_OOB_READS)?\s*\{', source)
        if match:
            insert_pos = match.end()
            source = source[:insert_pos] + "\n" + kernel_prologue + source[insert_pos:]

    # Also handle scalar inputs (e.g., *input_b → sym_input_b)
    # Inject: SymbolicScalar<int8_t> sym_input_b(g_ctx->findBuffer(input_b), 0);
    # for each scalar broadcast input detected by the * dereference pattern
    scalar_inputs = re.findall(r'(?<=\W)\*\s*(input_\w+)\b', source)
    if scalar_inputs:
        scalar_lines = []
        for inp_name in set(scalar_inputs):
            # Infer type from the function signature
            sig_match = re.search(rf'const\s+(\w+)\s*\*\s*(?:restrict\s+)?{inp_name}\b', source)
            inp_type = sig_match.group(1) if sig_match else "int8_t"
            scalar_lines.append(
                f"    SymbolicScalar<{inp_type}> sym_{inp_name}"
                f"(g_ctx->findBuffer({inp_name}), 0);")
        # Insert after the kernel prologue (or after opening brace if no prologue)
        match2 = re.search(r'\)\s*(?:XNN_OOB_READS)?\s*\{', source)
        if match2:
            # Find end of the injected prologue (look for the blank line after it)
            prologue_end = source.find("\n\n", match2.end())
            if prologue_end > 0:
                insert_pos = prologue_end + 1
            else:
                insert_pos = match2.end()
            source = source[:insert_pos] + "\n".join(scalar_lines) + "\n" + source[insert_pos:]

    # Build regex for params access — handles both nested (params->member.field)
    # and flat (params->field) structs.
    field_names = [fn for _, fn in fields]
    # Match: params->member.field OR params->field (for flat structs)
    # Capture the final field name in group "fname"
    params_access = r'params->(?:\w+\.)?(?P<fname>' + '|'.join(re.escape(f) for f in field_names) + r')\b'

    # Pattern 1: vdup[q]_n_TYPE(params_access)
    source = re.sub(
        r'(v(?:dup|mov)[q]?_n_\w+)\(' + params_access + r'\)',
        lambda m: f'{m.group(1)}(sym_{m.group("fname")})',
        source
    )

    # Pattern 2: vdup[q]_n_TYPE(-params_access)
    source = re.sub(
        r'(v(?:dup|mov)[q]?_n_\w+)\(-' + params_access + r'\)',
        lambda m: f'{m.group(1)}(-sym_{m.group("fname")})',
        source
    )

    # Pattern 3: vdup[q]_n_TYPE((TYPE) params_access)
    source = re.sub(
        r'(v(?:dup|mov)[q]?_n_\w+)\(\((\w+)\)\s*' + params_access + r'\)',
        lambda m: f'{m.group(1)}(sym_{m.group("fname")}.cast<{m.group(2)}>())',
        source
    )

    # Pattern 4: (TYPE) params_access — cast outside vdup
    source = re.sub(
        r'\((\w+)\)\s*(?<!&)' + params_access,
        lambda m: f'sym_{m.group("fname")}.cast<{m.group(1)}>()',
        source
    )

    # Pattern 5: remaining value reads — SKIP address-of (&) uses
    source = re.sub(
        r'(?<!&)' + params_access,
        lambda m: f'sym_{m.group("fname")}',
        source
    )

    # Pattern 6: scalar deref — covers *input_b, input_b[0], *(input_b + 0)
    # Require non-word char before * to avoid matching pointer declarations (int8_t* input_b)
    # 6a: *input_b
    source = re.sub(
        r'(?<=\W)\*\s*(input_\w+)\b',
        lambda m: f'sym_{m.group(1)}',
        source
    )
    # 6b: input_b[0] or input_b[index]
    source = re.sub(
        r'\b(input_\w+)\s*\[\s*0\s*\]',
        lambda m: f'sym_{m.group(1)}',
        source
    )
    # 6c: *(input_b + 0)
    source = re.sub(
        r'\*\s*\(\s*(input_\w+)\s*\+\s*0\s*\)',
        lambda m: f'sym_{m.group(1)}',
        source
    )

    # Pattern 7: C-style casts on sym_ variables → .cast<TYPE>()
    # 7a: (TYPE) sym_var
    source = re.sub(
        r'\((\w+)\)\s*(sym_\w+)(?!\.)',
        lambda m: f'{m.group(2)}.cast<{m.group(1)}>()',
        source
    )
    # 7b: (TYPE)(-sym_var) → (-sym_var).cast<TYPE>()
    source = re.sub(
        r'\((\w+)\)\s*\(\s*-(sym_\w+)\s*\)',
        lambda m: f'(-{m.group(2)}).cast<{m.group(1)}>()',
        source
    )
    # 7c: (TYPE)(sym_expr) where sym_expr contains a sym_ var — generic fallback
    source = re.sub(
        r'\((\w+)\)\s*\(([^)]*\bsym_\w+[^)]*)\)',
        lambda m: f'({m.group(2)}).cast<{m.group(1)}>()',
        source
    )

    # Pattern 8: const TYPE var = expr → auto var = expr
    # Iteratively propagate symbolic taint through variable assignments.
    symbolic_vars = set(re.findall(r'\bsym_\w+', source))
    assign_pat = re.compile(r'^(\s*)(?:const\s+)?\w+\s+(\w+)\s*=\s*(.+);', re.MULTILINE)
    changed = True
    while changed:
        changed = False
        lines = source.split('\n')
        for i, line in enumerate(lines):
            m = assign_pat.match(line)
            if not m:
                continue
            indent, varname, rhs = m.group(1), m.group(2), m.group(3)
            if varname in symbolic_vars:
                continue  # already handled
            for sv in symbolic_vars:
                if re.search(rf'\b{re.escape(sv)}\b', rhs):
                    lines[i] = f'{indent}auto {varname} = {rhs};'
                    symbolic_vars.add(varname)
                    changed = True
                    break
        source = '\n'.join(lines)

    # Pattern 9: Re-run C-style cast rewriting on ALL propagated symbolic vars.
    # Pattern 7 only caught sym_* prefix; now we know all tainted var names.
    for sv in symbolic_vars:
        if sv.startswith('sym_'):
            continue  # already handled by Pattern 7
        # 9a: (TYPE) var → var.cast<TYPE>()
        source = re.sub(
            rf'\((\w+)\)\s*\b({re.escape(sv)})\b(?!\.)',
            lambda m: f'{m.group(2)}.cast<{m.group(1)}>()',
            source
        )
        # 9b: (TYPE)(-var) → (-var).cast<TYPE>()
        source = re.sub(
            rf'\((\w+)\)\s*\(\s*-\s*({re.escape(sv)})\s*\)',
            lambda m: f'(-{m.group(2)}).cast<{m.group(1)}>()',
            source
        )

    # Post-rewrite residual check — catch both nested and flat access
    residual = re.findall(r'(?<!&)params->\w+', source)
    # Filter out the function signature (const struct TYPE* params) — that's not an access
    residual = [r for r in residual if r != 'params']
    if residual:
        raise ValueError(
            f"Symbolic params rewrite incomplete — {len(residual)} raw access(es) "
            f"remain: {residual[:5]}. Manual fixup or LLM-assisted rewrite needed.")

    return source


def _strip_lut_externs(source: str, tables: list) -> str:
    """Remove `extern` declarations for LUT symbols.

    The tables are defined as `static const` in xnn_minimal.h (included via
    salt.hpp), so any `extern const ... table[...]` line in the kernel source
    would create a conflicting declaration. Strip those lines.
    """
    for tbl in tables:
        sym = tbl["symbol"]
        # Match: extern const TYPE sym[...];  (possibly spanning whitespace)
        pattern = rf'extern\s+const\s+\w+\s+{re.escape(sym)}\s*\[[^\]]*\]\s*;\s*\n?'
        source = re.sub(pattern, '', source)
    return source


_KNOWN_LUT_IDIOMS = {"neon_s32_dup_lane"}


def _rewrite_neon_lut_gathers(source: str, tables: list) -> str:
    """Rewrite NEON LUT gather idioms into calls to the matching salt helper.

    Each table entry must declare an "idiom" field.  The only supported value
    is currently "neon_s32_dup_lane" (used by f32-velu).

    ---- neon_s32_dup_lane ----
    The idiom appears interleaved in f32-velu (not as contiguous triplets):

        const uint64_t vidxA = vgetq_lane_u64(PACKED, 0);
        const uint64_t vidxB = vgetq_lane_u64(PACKED, 1);
        int32x2_t vlA = vld1_dup_s32((const int32_t*) ((uintptr_t) TABLE + (uint32_t) vidxA));
        int32x2_t vlB = vld1_dup_s32((const int32_t*) ((uintptr_t) TABLE + (uint32_t) vidxB));
        vlA = vld1_lane_s32((const int32_t*) ((uintptr_t) TABLE + (uint32_t) (vidxA >> 32)), vlA, 1);
        vlB = vld1_lane_s32((const int32_t*) ((uintptr_t) TABLE + (uint32_t) (vidxB >> 32)), vlB, 1);

    Rewritten by name correlation, not position:
        1. Scan `const uint64_t IDX = vgetq_lane_u64(PACKED, HALF);`
           to build IDX → (PACKED, HALF) map.
        2. Replace `int32x2_t VL = vld1_dup_s32(...(uint32_t) IDX...);`
           with `int32x2_t VL = salt_neon_gather2_s32(::TABLE, PACKED, HALF);`
        3. Delete the matching `VL = vld1_lane_s32(...(uint32_t)(IDX >> 32)..., VL, 1);`
        4. Delete the now-unused `const uint64_t IDX = vgetq_lane_u64(...);`

    Fail-fast residual check: if any `(uintptr_t) TABLE + (uint32_t)` cast is
    still present for a declared table, raise ValueError.
    """
    for tbl in tables:
        sym = tbl["symbol"]
        idiom = tbl.get("idiom")
        if idiom is None:
            raise ValueError(
                f"LUT entry for {sym} is missing required 'idiom' field. "
                f"Known idioms: {sorted(_KNOWN_LUT_IDIOMS)}")
        if idiom not in _KNOWN_LUT_IDIOMS:
            raise ValueError(
                f"LUT entry for {sym} declares unknown idiom '{idiom}'. "
                f"Known idioms: {sorted(_KNOWN_LUT_IDIOMS)}. "
                f"Add a new rewrite path in _rewrite_neon_lut_gathers to "
                f"support a new gather shape.")
        # Dispatch per idiom. Only neon_s32_dup_lane is implemented today.
        assert idiom == "neon_s32_dup_lane"

        esym = re.escape(sym)

        # Pass 1: build idx → (packed, half) map
        idx_map = {}
        getlane_pat = re.compile(
            r'const\s+uint64_t\s+(\w+)\s*=\s*vgetq_lane_u64\s*\(\s*'
            r'(\w+)\s*,\s*(\d+)\s*\)\s*;')
        for m in getlane_pat.finditer(source):
            idx_map[m.group(1)] = (m.group(2), m.group(3))

        consumed_idxs = set()

        # Pass 2: rewrite vld1_dup_s32 load into salt_neon_gather2_s32
        dup_pat = re.compile(
            r'int32x2_t\s+(?P<vl>\w+)\s*=\s*vld1_dup_s32\s*\(\s*'
            r'\(\s*const\s+int32_t\s*\*\s*\)\s*'
            r'\(\s*\(\s*uintptr_t\s*\)\s*' + esym + r'\s*\+\s*'
            r'\(\s*uint32_t\s*\)\s*(?P<idx>\w+)\s*\)\s*\)\s*;')

        def _dup_replace(m):
            idx = m.group("idx")
            if idx not in idx_map:
                return m.group(0)  # not a LUT idx we recognize, leave alone
            packed, half = idx_map[idx]
            consumed_idxs.add(idx)
            return (f'int32x2_t {m.group("vl")} = salt_neon_gather2_s32('
                    f'::{sym}, {packed}, {half});')

        source = dup_pat.sub(_dup_replace, source)

        # Pass 3: delete the matching vld1_lane_s32 line (now redundant —
        # salt_neon_gather2_s32 already loaded both lanes)
        lane_pat = re.compile(
            r'[ \t]*(\w+)\s*=\s*vld1_lane_s32\s*\(\s*'
            r'\(\s*const\s+int32_t\s*\*\s*\)\s*'
            r'\(\s*\(\s*uintptr_t\s*\)\s*' + esym + r'\s*\+\s*'
            r'\(\s*uint32_t\s*\)\s*\(\s*(\w+)\s*>>\s*32\s*\)\s*\)\s*,\s*'
            r'\1\s*,\s*1\s*\)\s*;\s*\n?')

        def _lane_replace(m):
            idx = m.group(2)
            if idx not in consumed_idxs:
                return m.group(0)
            return ''

        source = lane_pat.sub(_lane_replace, source)

        # Pass 4: delete the now-unused `const uint64_t IDX = vgetq_lane_u64(...)`
        # declarations for consumed idxs.
        def _decl_replace(m):
            if m.group(1) not in consumed_idxs:
                return m.group(0)
            return ''

        decl_pat = re.compile(
            r'[ \t]*const\s+uint64_t\s+(\w+)\s*=\s*vgetq_lane_u64\s*\(\s*'
            r'\w+\s*,\s*\d+\s*\)\s*;\s*\n?')
        source = decl_pat.sub(_decl_replace, source)

        # Fail-fast residual check: the original idiom must be fully rewritten.
        residual_pat = re.compile(
            r'\(\s*uintptr_t\s*\)\s*' + esym + r'\s*\+\s*\(\s*uint32_t\s*\)')
        if residual_pat.search(source):
            raise ValueError(
                f"LUT gather rewrite incomplete for {sym}: the original "
                f"(uintptr_t){sym} + (uint32_t) idiom is still present after "
                f"rewriting. The scalar extract→cast→pointer-load pattern in "
                f"this kernel does not match the expected shape.")

    return source


def _emit_lut_registration(tables: list) -> str:
    """Generate C++ code to register each LUT as a concrete SymbolicBuffer
    with byte-level constraints. Follows the same pattern used for concrete
    weights in _emit_buffer_register.
    """
    if not tables:
        return ""
    lines = ["    // Lookup tables — registered as concrete buffers"]
    for tbl in tables:
        sym = tbl["symbol"]
        num_bytes = tbl["entries"] * tbl["elem_bytes"]
        buf_name = sym  # buffer name derived from symbol, not hardcoded
        lines.append(f"    auto& sym_{sym} = ctx.registerBuffer(\"{buf_name}\", {num_bytes});")
        lines.append(f"    sym_{sym}.bind(::{sym});")
        lines.append(f"    for (size_t _i = 0; _i < {num_bytes}; _i++) {{")
        lines.append(f"        Term _tbyte = sym_{sym}.loadScalar(_i, 8);")
        lines.append(f"        Term _tcval = ctx.bv_val(8, ((const uint8_t*)::{sym})[_i]);")
        lines.append(f"        ctx.assert_eq(_tbyte, _tcval);")
        lines.append(f"    }}")
    return "\n".join(lines)


def _emit_header(backend: str = "bitwuzla") -> str:
    # The harness body is backend-agnostic — both backends expose the same
    # `salt::` namespace (cvc5 aliases `salt = salt_cvc5` in its salt.hpp).
    # Only the cmake include path determines which salt.hpp is found.
    return f"""// Auto-generated verification harness — backend: {backend}
#include "salt.hpp"
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <chrono>
#include <vector>
#include <string>
using namespace salt;
"""


def _emit_kernel(namespace: str, source: str, strip_headers: list[str]) -> str:
    cleaned = source
    for h in strip_headers:
        cleaned = cleaned.replace(f'#include <{h}>', f'// {h} provided by salt.hpp')
    # 'restrict' is C-only, not valid in C++
    cleaned = cleaned.replace(' restrict ', ' ')
    return f"namespace {namespace} {{\n{cleaned}\n}} // namespace {namespace}\n"


def _emit_verify(spec: HarnessSpec, symbolic_params: bool = False,
                  param_ranges: dict = None,
                  per_query_timeout_ms: int = 600000) -> str:
    """Generate the verify() function."""
    output_bufs = [b for b in spec.buffers if b.role == ArgRole.OUTPUT]
    input_bufs = [b for b in spec.buffers if b.role in (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR)]

    out0 = output_bufs[0]
    eb = out0.elem_type.byte_size or 1
    ba = spec.sweep_arg
    has_params = bool(spec.params_type)
    is_2d = spec.is_2d
    is_spatial = spec.is_spatial
    sd = spec.secondary_dim  # "" for FLAT_1D, "channels" for ROW_CHAN_2D, etc.

    # For SPATIAL, the second sweep dim becomes the second verify parameter.
    spatial_sd = (spec.shape_plan.sweep_dims[1].name
                  if is_spatial and len(spec.shape_plan.sweep_dims) >= 2 else "")

    L = []  # lines

    # Function signature — 2D / SPATIAL kernels pass extra sweep dims as params.
    if is_spatial:
        if has_params:
            L.append(f"bool verify(size_t {ba}, size_t {spatial_sd}, size_t vlen, const {spec.params_type}& params, const char* config_id) {{")
        else:
            L.append(f"bool verify(size_t {ba}, size_t {spatial_sd}, size_t vlen, const char* config_id) {{")
    elif is_2d:
        if has_params:
            L.append(f"bool verify(size_t {ba}, size_t {sd}, size_t vlen, const {spec.params_type}& params, const char* config_id) {{")
        else:
            L.append(f"bool verify(size_t {ba}, size_t {sd}, size_t vlen, const char* config_id) {{")
    else:
        if has_params:
            L.append(f"bool verify(size_t {ba}, size_t vlen, const {spec.params_type}& params, const char* config_id) {{")
        else:
            L.append(f"bool verify(size_t {ba}, size_t vlen, const char* config_id) {{")

    L.append(f"    VerificationContext ctx(vlen);")
    L.append(f"    g_ctx = &ctx;")
    # Per-query solver timeout — must be set BEFORE any assertions so the
    # bitwuzla backend can rebuild the solver with the new option in place.
    L.append(f"    ctx.set_query_timeout_ms({per_query_timeout_ms});")

    # Scalar-arg local decls.  SPATIAL skips this loop entirely — alloc_decls
    # + arg_bindings carry all the scalar-arg values.
    if not is_spatial:
        for arg_name, arg_val in spec.scalar_args.items():
            if is_2d and arg_name == sd:
                continue  # already a function parameter
            elif is_2d and arg_name in ("input_stride", "output_stride"):
                # Use padded stride so each row has room for NEON tail over-reads
                L.append(f"    size_t {arg_name} = {sd} + 16;  // padded stride")
            else:
                L.append(f"    size_t {arg_name} = {arg_val};")

    for decl in spec.shape_plan.alloc_decls:
        L.append(f"    {decl}")
    L.append(f"")

    # Declare arrays and register buffers
    for buf in spec.buffers:
        L.extend(_emit_buffer_decl(buf, spec))
    L.append("")
    for buf in spec.buffers:
        L.extend(_emit_buffer_register(buf, spec))
    L.append("")

    # Symbolic params: register buffer + assert constraints (in verify scope)
    if symbolic_params and spec.params_type:
        prologue = get_verify_prologue(spec.params_type, param_ranges)
        if prologue:
            L.append(prologue)

    # Concrete params: register as buffer so pointer-based param access works
    # (e.g. f16 kernels do vld1q_dup_u16(&params->scalar.min))
    if not symbolic_params and has_params:
        lbrace, rbrace = "{", "}"
        L.append(f"    // Register params as buffer for pointer-based intrinsic access")
        L.append(f"    auto& sym_params = ctx.registerBuffer(\"params\", sizeof(params));")
        L.append(f"    sym_params.bind(&params);")
        L.append(f"    for (size_t _i = 0; _i < sizeof(params); _i++) {lbrace}")
        L.append(f"        Term _pb = sym_params.loadScalar(_i, 8);")
        L.append(f"        Term _cv = ctx.bv_val(8, ((const uint8_t*)&params)[_i]);")
        L.append(f"        ctx.assert_eq(_pb, _cv);")
        L.append(f"    {rbrace}")
        L.append(f"")

    # Lookup tables: register as concrete buffers with byte constraints
    if spec.profile and spec.profile.lookup_tables:
        L.append(_emit_lut_registration(spec.profile.lookup_tables))
        L.append("")

    # Input range constraint: restrict each f32/f64 input lane to a finite
    # range.  Excludes NaN/inf/subnormal by construction (FP comparisons
    # return false for NaN) — big speedup for FP-heavy kernels.
    if spec.profile and spec.profile.input_range and not is_2d:
        lo, hi = spec.profile.input_range
        lbrace, rbrace = "{", "}"
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            ek = buf.elem_type.element_kind
            if ek not in ("F32", "F64"):
                continue
            be = buf.elem_type.byte_size or 4
            bits = be * 8
            L.append(f"    // Input range constraint on '{buf.arg_name}': [{lo}, {hi}]")
            L.append(f"    // NOTE: Uses bitwuzla-only helpers mk_fp32_from_float/load_as_fp32.")
            L.append(f"    // Switch to ctx.fp32_geq / ctx.fp32_from_bv when the cvc5 path needs this.")
            L.append(f"    {lbrace}")
            L.append(f"        Term _lo = mk_fp32_from_float(ctx.tm, {lo}f);")
            L.append(f"        Term _hi = mk_fp32_from_float(ctx.tm, {hi}f);")
            L.append(f"        for (size_t _i = 0; _i < padded; _i++) {lbrace}")
            L.append(f"            Term _bv = sym_{buf.arg_name}.loadScalar(_i * {be}, {bits});")
            L.append(f"            Term _fp = load_as_fp32(ctx.tm, _bv);")
            L.append(f"            ctx.assert_(ctx.land_(")
            L.append(f"                ctx.tm.mk_term(Kind::FP_GEQ, {lbrace}_fp, _lo{rbrace}),")
            L.append(f"                ctx.tm.mk_term(Kind::FP_LEQ, {lbrace}_fp, _hi{rbrace})")
            L.append(f"            ));")
            L.append(f"        {rbrace}")
            L.append(f"    {rbrace}")
        L.append("")

    # Call both kernels
    neon_args = _build_call_args(spec, "neon")
    rvv_args = _build_call_args(spec, "rvv")
    L.append(f"    neon_kernel::{spec.neon_func_name}({', '.join(neon_args)});")
    L.append(f"    rvv_kernel::{spec.rvv_func_name}({', '.join(rvv_args)});")
    L.append("")

    # Compare all outputs
    if is_spatial:
        # SPATIAL CHW walk: outer c × y × x using stride bytes from alloc_decls.
        lbrace, rbrace = "{", "}"
        L.append(f"    std::vector<Term> _chw_eqs;")
        L.append(f"    for (size_t _c = 0; _c < {spatial_sd}; _c++) {lbrace}")
        L.append(f"      size_t _cof = _c * output_channel_stride_bytes;")
        L.append(f"      for (size_t _y = 0; _y < {ba}; _y++) {lbrace}")
        L.append(f"        size_t _yof = _cof + _y * output_height_stride_bytes;")
        L.append(f"        for (size_t _x = 0; _x < output_width; _x++) {lbrace}")
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f"          size_t _off = _yof + _x * {obe};")
            L.append(f"          Term _n = sym_{ob.arg_name}_neon.loadScalar(_off, {obe*8});")
            L.append(f"          Term _rv = sym_{ob.arg_name}_rvv.loadScalar(_off, {obe*8});")
            L.append(f"          _chw_eqs.push_back(element_equal(ctx.tm, _n, _rv, ElementKind::{spec.element_kind}));")
        L.append(f"        {rbrace}")
        L.append(f"      {rbrace}")
        L.append(f"    {rbrace}")
        L.append(f"    Term equiv = _chw_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _chw_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _chw_eqs[_i]);")
    elif is_2d:
        # 2D: compare per-row, skipping stride padding between rows
        lbrace, rbrace = "{", "}"
        L.append(f"    // Compare output rows accounting for stride padding")
        L.append(f"    std::vector<Term> _row_eqs;")
        L.append(f"    for (size_t _r = 0; _r < {ba}; _r++) {lbrace}")
        L.append(f"        size_t _row_off = _r * padded_row_bytes;")
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            ok = ob.elem_type.element_kind
            L.append(f"        for (size_t _c = 0; _c < num_elems_per_row; _c++) {lbrace}")
            L.append(f"            Term _n = sym_{ob.arg_name}_neon.loadScalar(_row_off + _c * {obe}, {obe*8});")
            L.append(f"            Term _rv = sym_{ob.arg_name}_rvv.loadScalar(_row_off + _c * {obe}, {obe*8});")
            L.append(f"            _row_eqs.push_back(element_equal(ctx.tm, _n, _rv, ElementKind::{spec.element_kind}));")
            L.append(f"        {rbrace}")
        L.append(f"    {rbrace}")
        L.append(f"    Term equiv = _row_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _row_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _row_eqs[_i]);")
    else:
        # For byte-count batch kernels, comparison count is batch / elem_bytes
        # so we only compare bytes the kernel actually wrote.
        cmp_count = f"({ba} / {eb})" if spec.sweep_is_bytes else ba
        if len(output_bufs) == 1:
            L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{out0.arg_name}_neon, sym_{out0.arg_name}_rvv,")
            L.append(f"                                {cmp_count}, {eb}, ElementKind::{spec.element_kind});")
        else:
            for i, ob in enumerate(output_bufs):
                obe = ob.elem_type.byte_size or 1
                ok = ob.elem_type.element_kind
                ob_cmp_count = f"({ba} / {obe})" if spec.sweep_is_bytes else ba
                if i == 0:
                    L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {ob_cmp_count}, {obe}, ElementKind::{ok});")
                else:
                    L.append(f"    equiv = ctx.land_(equiv, buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {ob_cmp_count}, {obe}, ElementKind::{ok}));")

    L.append(f"    ctx.assert_(ctx.lnot_(equiv));")
    # Progress line so the user sees activity even when a single check_sat()
    # is slow.  Status SOLVING appears before the solver starts; the matching
    # VERIFIED / COUNTEREXAMPLE / TIMEOUT line is emitted when it returns.
    L.append(f'    printf("{{\\"status\\":\\"SOLVING\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {ba}, vlen, config_id);')
    L.append(f"    CheckResult result = ctx.check();")
    L.append(f"")

    # UNSAT → verified
    L.append(f'    if (result == CheckResult::Unsat) {{')
    L.append(f'        printf("{{\\"status\\":\\"VERIFIED\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {ba}, vlen, config_id);')
    L.append(f'        return true;')
    L.append(f'    }}')
    # UNKNOWN → solver hit its query timeout (or other unknown).  Report and
    # treat as not-verified, but do not crash — outer loop may continue.
    L.append(f'    if (result == CheckResult::Unknown) {{')
    L.append(f'        printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\",\\"reason\\":\\"solver-unknown\\"}}\\n", {ba}, vlen, config_id);')
    L.append(f'        return false;')
    L.append(f'    }}')
    L.append(f"")

    # SAT → counterexample
    L.append(f'    size_t fi = 0;')
    L.append(f'    const char* fail_buf = "";')

    if is_spatial:
        lbrace, rbrace = "{", "}"
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    for (size_t _c = 0; _c < {spatial_sd}; _c++) {lbrace}')
            L.append(f'      size_t _cof = _c * output_channel_stride_bytes;')
            L.append(f'      for (size_t _y = 0; _y < {ba}; _y++) {lbrace}')
            L.append(f'        size_t _yof = _cof + _y * output_height_stride_bytes;')
            L.append(f'        for (size_t _x = 0; _x < output_width; _x++) {lbrace}')
            L.append(f'          size_t _off = _yof + _x * {obe};')
            L.append(f'          std::string _n  = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_off, {obe*8}));')
            L.append(f'          std::string _r2 = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_off, {obe*8}));')
            L.append(f'          if (_n != _r2) {lbrace} fi = (_c * {ba} + _y) * output_width + _x; fail_buf = "{ob.arg_name}"; goto found_mismatch; {rbrace}')
            L.append(f'        {rbrace}')
            L.append(f'      {rbrace}')
            L.append(f'    {rbrace}')
    elif is_2d:
        lbrace, rbrace = "{", "}"
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    for (size_t _r = 0; _r < {ba}; _r++) {lbrace}')
            L.append(f'      size_t _roff = _r * padded_row_bytes;')
            L.append(f'      for (size_t _c = 0; _c < num_elems_per_row; _c++) {lbrace}')
            L.append(f'        std::string _n  = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_roff + _c * {obe}, {obe*8}));')
            L.append(f'        std::string _r2 = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_roff + _c * {obe}, {obe*8}));')
            L.append(f'        if (_n != _r2) {lbrace} fi = _r * num_elems_per_row + _c; fail_buf = "{ob.arg_name}"; goto found_mismatch; {rbrace}')
            L.append(f'      {rbrace}')
            L.append(f'    {rbrace}')
    else:
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            # For byte-count batch kernels, scan only the elements the kernel
            # actually wrote (batch / elem_bytes), not `batch` elements.
            # Otherwise the witness loop reads unwritten symbolic bytes and
            # reports bogus fail_index values for any real counterexample.
            scan_count = f"({ba} / {obe})" if spec.sweep_is_bytes else ba
            L.append(f'    for (size_t _i = 0; _i < {scan_count}; _i++) {{')
            L.append(f'        std::string _n = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_i * {obe}, {obe*8}));')
            L.append(f'        std::string _r = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_i * {obe}, {obe*8}));')
            L.append(f'        if (_n != _r) {{ fi = _i; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'    }}')

    L.append(f'    found_mismatch:')
    L.append(f'    printf("{{\\"status\\":\\"COUNTEREXAMPLE\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\",\\"fail_index\\":%zu,\\"fail_output\\":\\"%s\\",", {ba}, vlen, config_id, fi, fail_buf);')

    if is_spatial:
        # Dump every symbolic INPUT_ARRAY buffer as a JSON array of halfwords.
        # Many inputs feed each output of a conv, so there's no single
        # "causative" input to pick — print them all for post-hoc decoding.
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or 1
            bits = be * 8
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    {lbrace} size_t _n = ({buf.size_expr}) / {be};')
            L.append(f'      for (size_t _i = 0; _i < _n; _i++) {lbrace}')
            L.append(f'        printf("%s%s", _i ? "," : "",')
            L.append(f'               ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {bits})).c_str());')
            L.append(f'      {rbrace}')
            L.append(f'    {rbrace}')
            L.append(f'    printf("],");')
            # Also emit an `input[0]` fallback the legacy orchestrator parses.
            L.append(f'    printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(0, {bits})).c_str());')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {lbrace}')
            L.append(f'        size_t _fc = fi / ({ba} * output_width);')
            L.append(f'        size_t _fr = (fi / output_width) % {ba};')
            L.append(f'        size_t _fx = fi % output_width;')
            L.append(f'        size_t _foff = _fc * output_channel_stride_bytes + _fr * output_height_stride_bytes + _fx * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    {rbrace}')
    elif is_2d:
        # Use strided offset for input/output value printing
        for buf in input_bufs:
            be = buf.elem_type.byte_size or 1
            if buf.role == ArgRole.INPUT_SCALAR:
                L.append(f'    printf("\\"{buf.arg_name}\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(0, {be*8})).c_str());')
            else:
                L.append(f'    {lbrace} size_t _fr = fi / num_elems_per_row; size_t _fc = fi % num_elems_per_row;')
                L.append(f'      size_t _foff = _fr * padded_row_bytes + _fc * {be};')
                L.append(f'      printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(_foff, {be*8})).c_str()); {rbrace}')

        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {lbrace}')
            L.append(f'        size_t _fr = fi / num_elems_per_row; size_t _fc = fi % num_elems_per_row;')
            L.append(f'        size_t _foff = _fr * padded_row_bytes + _fc * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    {rbrace}')
    else:
        for buf in input_bufs:
            be = buf.elem_type.byte_size or 1
            if buf.role == ArgRole.INPUT_SCALAR:
                L.append(f'    printf("\\"{buf.arg_name}\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(0, {be*8})).c_str());')
            else:
                L.append(f'    printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(fi * {be}, {be*8})).c_str());')

        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(fi * {obe}, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(fi * {obe}, {obe*8})).c_str());')
            L.append(f'    }}')

    L.append(f'    printf("}}\\n");')
    L.append(f"    return false;")
    L.append(f"}}")
    return "\n".join(L)


def _emit_buffer_decl(buf: BufferSpec, spec: HarnessSpec = None) -> list[str]:
    """Emit C++ array declaration for a buffer."""
    ct = buf.elem_type.c_type or "uint8_t"
    n = buf.arg_name
    dual = spec.profile and spec.profile.dual_weight_layout
    per_buf = spec.shape_plan.buffer_plans.get(n)

    # Per-buffer plan (SPATIAL) carries a byte-size expression; convert to
    # element count for vector sizing.  Shape-level alloc_count_name is used
    # for FLAT_1D / ROW_CHAN_2D where one count drives every buffer.
    elem_count = (f"({per_buf.size_expr}) / sizeof({ct})" if per_buf
                  else spec.shape_plan.alloc_count_name)
    zero_count = (f"({per_buf.size_expr}) / sizeof({ct})" if per_buf
                  else spec.shape_plan.count_name)

    if buf.role == ArgRole.INPUT_SCALAR:
        return [f"    {ct} {n}_val = 0;"]
    elif buf.role == ArgRole.INPUT_ARRAY:
        return [f"    std::vector<{ct}> {n}_arr({elem_count}, 0);"]
    elif buf.role == ArgRole.OUTPUT:
        return [f"    std::vector<{ct}> {n}_neon_arr({elem_count}, 0);",
                f"    std::vector<{ct}> {n}_rvv_arr({elem_count}, 0);"]
    elif buf.role == ArgRole.ZERO_BUFFER:
        return [f"    std::vector<{ct}> {n}_arr({zero_count}, 0);"]
    elif buf.role == ArgRole.WEIGHTS:
        wt = ct if ct != "uint8_t" else "uint8_t"
        if dual:
            # Two separate weight buffers for different packing layouts
            sd = spec.secondary_dim
            eb = dual["elem_bytes"]
            return [
                f"    size_t {n}_neon_size = {buf.size_expr};",
                f"    size_t num_{sd}_elems = {sd} / {eb};",
                f"    size_t {n}_rvv_size = num_{sd}_elems * 2 * {eb};",
                f"    std::vector<{wt}> {n}_neon_arr({n}_neon_size / sizeof({wt}));",
                f"    std::vector<{wt}> {n}_rvv_arr({n}_rvv_size / sizeof({wt}));",
            ]
        else:
            return [f"    size_t {n}_size = {buf.size_expr};",
                    f"    std::vector<{wt}> {n}_arr({n}_size / sizeof({wt}));"]
    elif buf.role == ArgRole.INDIRECT_INPUT:
        count = spec.shape_plan.count_name
        return [f"    size_t {n}_nptrs = {buf.size_expr};",
                f"    std::vector<std::vector<{ct}>> {n}_rows({n}_nptrs, std::vector<{ct}>({count}));",
                f"    std::vector<const {ct}*> {n}_ptrs({n}_nptrs);",
                f"    for (size_t _r = 0; _r < {n}_nptrs; _r++) {n}_ptrs[_r] = {n}_rows[_r].data();"]
    return []


def _emit_buffer_register(buf: BufferSpec, spec: HarnessSpec = None) -> list[str]:
    """Emit symbolic buffer registration."""
    n = buf.arg_name
    ct = buf.elem_type.c_type or "uint8_t"
    eb = buf.elem_type.byte_size or 1
    per_buf = spec.shape_plan.buffer_plans.get(n)
    # Per-buffer plan (SPATIAL) already carries a byte-size expression.
    if per_buf:
        padded_bytes = per_buf.size_expr
    else:
        padded_bytes = f"{spec.shape_plan.alloc_count_name} * {eb}"

    if buf.role == ArgRole.INPUT_SCALAR:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {eb});",
                f"    sym_{n}.bind(&{n}_val);"]
    elif buf.role == ArgRole.INPUT_ARRAY:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {padded_bytes});",
                f"    sym_{n}.bind({n}_arr.data());"]
    elif buf.role == ArgRole.OUTPUT:
        return [f"    auto& sym_{n}_neon = ctx.registerBuffer(\"{n}_neon\", {padded_bytes});",
                f"    sym_{n}_neon.bind({n}_neon_arr.data());",
                f"    auto& sym_{n}_rvv = ctx.registerBuffer(\"{n}_rvv\", {padded_bytes});",
                f"    sym_{n}_rvv.bind({n}_rvv_arr.data());"]
    elif buf.role == ArgRole.ZERO_BUFFER:
        # Force every byte to a concrete 0 BV so salt's symbolic view matches
        # real-hardware behavior.  Without this, kernels that blindly vld from
        # a `ptr=zero` row (NEON conv-hwc2chw is one) read unconstrained
        # symbolic terms, diverging from kernels that explicitly substitute 0
        # (the RVV gather variant).
        lbrace, rbrace = "{", "}"
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {padded_bytes});",
                f"    sym_{n}.bind({n}_arr.data());",
                f"    {lbrace} Term _z = ctx.bv_val(8, 0);",
                f"      for (size_t _i = 0; _i < ({padded_bytes}); _i++) sym_{n}.setByte(_i, _z); {rbrace}"]
    elif buf.role == ArgRole.WEIGHTS:
        dual = spec and spec.profile and spec.profile.dual_weight_layout
        if dual:
            lbrace, rbrace = "{", "}"
            sd = spec.secondary_dim
            neon_tile = dual["neon_tile"]
            rvv_tile_expr = dual["rvv_tile_expr"]
            eb = dual["elem_bytes"]
            symbolic = dual.get("symbolic_weights", False)
            lines = []

            if symbolic:
                # --- Symbolic mode: both buffers unconstrained, tied by byte equality ---
                lines.append(f"    // Dual symbolic weight buffers: NEON c{neon_tile} vs RVV cVLMAX")
                lines.append(f"    auto& sym_{n}_neon = ctx.registerBuffer(\"{n}_neon\", {n}_neon_size);")
                lines.append(f"    sym_{n}_neon.bind({n}_neon_arr.data());")
                lines.append(f"    auto& sym_{n}_rvv = ctx.registerBuffer(\"{n}_rvv\", {n}_rvv_size);")
                lines.append(f"    sym_{n}_rvv.bind({n}_rvv_arr.data());")
                lines.append(f"    {lbrace}")
                lines.append(f"        size_t _vlmax = {rvv_tile_expr};")
                lines.append(f"        std::vector<size_t> _rvv_s(num_{sd}_elems), _rvv_b(num_{sd}_elems);")
                lines.append(f"        size_t _pos = 0, _rem = num_{sd}_elems, _ch = 0;")
                lines.append(f"        while (_rem > 0) {lbrace}")
                lines.append(f"            size_t _vl = (_rem >= _vlmax) ? _vlmax : _rem;")
                lines.append(f"            for (size_t _k = 0; _k < _vl; _k++) {lbrace}")
                lines.append(f"                _rvv_s[_ch + _k] = _pos + _k;")
                lines.append(f"                _rvv_b[_ch + _k] = _pos + _vl + _k;")
                lines.append(f"            {rbrace}")
                lines.append(f"            _pos += 2 * _vl; _ch += _vl; _rem -= _vl;")
                lines.append(f"        {rbrace}")
                lines.append(f"        for (size_t _c = 0; _c < num_{sd}_elems; _c++) {lbrace}")
                lines.append(f"            size_t _ns = ((_c / {neon_tile}) * {neon_tile * 2} + (_c % {neon_tile})) * {eb};")
                lines.append(f"            size_t _nb = ((_c / {neon_tile}) * {neon_tile * 2} + {neon_tile} + (_c % {neon_tile})) * {eb};")
                lines.append(f"            size_t _rs = _rvv_s[_c] * {eb};")
                lines.append(f"            size_t _rb = _rvv_b[_c] * {eb};")
                lines.append(f"            for (size_t _b = 0; _b < {eb}; _b++) {lbrace}")
                lines.append(f"                ctx.assert_eq(")
                lines.append(f"                    sym_{n}_neon.loadScalar(_ns + _b, 8), sym_{n}_rvv.loadScalar(_rs + _b, 8));")
                lines.append(f"                ctx.assert_eq(")
                lines.append(f"                    sym_{n}_neon.loadScalar(_nb + _b, 8), sym_{n}_rvv.loadScalar(_rb + _b, 8));")
                lines.append(f"            {rbrace}")
                lines.append(f"        {rbrace}")
                # Zero-pad NEON tail
                lines.append(f"        size_t _tail = num_{sd}_elems % {neon_tile};")
                lines.append(f"        if (_tail != 0) {lbrace}")
                lines.append(f"            Term _z = ctx.bv_val(8, 0);")
                lines.append(f"            size_t _lt = num_{sd}_elems / {neon_tile};")
                lines.append(f"            for (size_t _lane = _tail; _lane < {neon_tile}; _lane++) {lbrace}")
                lines.append(f"                size_t _ps = (_lt * {neon_tile * 2} + _lane) * {eb};")
                lines.append(f"                size_t _pb = (_lt * {neon_tile * 2} + {neon_tile} + _lane) * {eb};")
                lines.append(f"                for (size_t _b = 0; _b < {eb}; _b++) {lbrace}")
                lines.append(f"                    ctx.assert_eq(sym_{n}_neon.loadScalar(_ps + _b, 8), _z);")
                lines.append(f"                    ctx.assert_eq(sym_{n}_neon.loadScalar(_pb + _b, 8), _z);")
                lines.append(f"                {rbrace}")
                lines.append(f"            {rbrace}")
                lines.append(f"        {rbrace}")
                lines.append(f"    {rbrace}")
            else:
                # --- Concrete mode: fill both buffers, constrain bytes to fixed values ---
                scales_str = ", ".join(f"{v}f" for v in dual["scales"])
                biases_str = ", ".join(f"{v}f" for v in dual["biases"])
                n_vals = len(dual["scales"])
                lines.append(f"    // Dual concrete weight buffers: NEON c{neon_tile} vs RVV cVLMAX")
                lines.append(f"    {lbrace}")
                lines.append(f"        float _s[] = {lbrace}{scales_str}{rbrace};")
                lines.append(f"        float _b[] = {lbrace}{biases_str}{rbrace};")
                lines.append(f"        for (size_t _c = 0; _c < num_{sd}_elems; _c++) {lbrace}")
                lines.append(f"            {n}_neon_arr[(_c / {neon_tile}) * {neon_tile * 2} + (_c % {neon_tile})] = _s[_c % {n_vals}];")
                lines.append(f"            {n}_neon_arr[(_c / {neon_tile}) * {neon_tile * 2} + {neon_tile} + (_c % {neon_tile})] = _b[_c % {n_vals}];")
                lines.append(f"        {rbrace}")
                lines.append(f"        size_t _vlmax = {rvv_tile_expr};")
                lines.append(f"        size_t _pos = 0, _rem = num_{sd}_elems, _ch = 0;")
                lines.append(f"        while (_rem > 0) {lbrace}")
                lines.append(f"            size_t _vl = (_rem >= _vlmax) ? _vlmax : _rem;")
                lines.append(f"            for (size_t _k = 0; _k < _vl; _k++) {lbrace}")
                lines.append(f"                {n}_rvv_arr[_pos + _k] = _s[(_ch + _k) % {n_vals}];")
                lines.append(f"                {n}_rvv_arr[_pos + _vl + _k] = _b[(_ch + _k) % {n_vals}];")
                lines.append(f"            {rbrace}")
                lines.append(f"            _pos += 2 * _vl; _ch += _vl; _rem -= _vl;")
                lines.append(f"        {rbrace}")
                lines.append(f"    {rbrace}")
                lines.append(f"    auto& sym_{n}_neon = ctx.registerBuffer(\"{n}_neon\", {n}_neon_size);")
                lines.append(f"    sym_{n}_neon.bind({n}_neon_arr.data());")
                lines.append(f"    for (size_t _i = 0; _i < {n}_neon_size; _i++) {lbrace}")
                lines.append(f"        Term _wb = sym_{n}_neon.loadScalar(_i, 8);")
                lines.append(f"        Term _cv = ctx.bv_val(8, ((uint8_t*){n}_neon_arr.data())[_i]);")
                lines.append(f"        ctx.assert_eq(_wb, _cv);")
                lines.append(f"    {rbrace}")
                lines.append(f"    auto& sym_{n}_rvv = ctx.registerBuffer(\"{n}_rvv\", {n}_rvv_size);")
                lines.append(f"    sym_{n}_rvv.bind({n}_rvv_arr.data());")
                lines.append(f"    for (size_t _i = 0; _i < {n}_rvv_size; _i++) {lbrace}")
                lines.append(f"        Term _wb = sym_{n}_rvv.loadScalar(_i, 8);")
                lines.append(f"        Term _cv = ctx.bv_val(8, ((uint8_t*){n}_rvv_arr.data())[_i]);")
                lines.append(f"        ctx.assert_eq(_wb, _cv);")
                lines.append(f"    {rbrace}")
            return lines
        elif buf.is_symbolic:
            return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {n}_size);",
                    f"    sym_{n}.bind({n}_arr.data());"]
        else:
            # Concrete weights: constrained to fixed values in solver
            lbrace, rbrace = "{", "}"
            lines = [f"    // Concrete weights — constrained to fixed values"]

            # Use profile for weight init if available
            cw = spec.profile.concrete_weights if spec.profile else None
            if cw and cw.get("pattern") == "tiled":
                ts = cw.get("tile_size", 4)
                scales = ", ".join(f"{v}f" for v in cw["scales"])
                biases = ", ".join(f"{v}f" for v in cw["biases"])
                lines.append(f"    {lbrace} float _scales[] = {lbrace}{scales}{rbrace};")
                lines.append(f"      float _biases[] = {lbrace}{biases}{rbrace};")
                lines.append(f"      for (size_t _t = 0; _t < {n}_arr.size() / {ts * 2}; _t++)")
                lines.append(f"        for (size_t _l = 0; _l < {ts}; _l++) {lbrace}")
                lines.append(f"          {n}_arr[_t*{ts*2}+_l] = _scales[_l]; {n}_arr[_t*{ts*2}+{ts}+_l] = _biases[_l];")
                lines.append(f"        {rbrace}")
                lines.append(f"    {rbrace}")
            else:
                # Generic fallback: sequential values
                lines.append(f"    for (size_t _i = 0; _i < {n}_arr.size(); _i++) {n}_arr[_i] = ({ct})((_i + 1) * 0.5f);")

            lines.extend([
                    f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {n}_size);",
                    f"    sym_{n}.bind({n}_arr.data());",
                    f"    for (size_t _i = 0; _i < {n}_size; _i++) {lbrace}",
                    f"        Term _wbyte = sym_{n}.loadScalar(_i, 8);",
                    f"        Term _cval = ctx.bv_val(8, ((uint8_t*){n}_arr.data())[_i]);",
                    f"        ctx.assert_eq(_wbyte, _cval);",
                    f"    {rbrace}"])
            return lines
    elif buf.role == ArgRole.INDIRECT_INPUT:
        count = "total_elems" if is_2d else "padded"
        return [f"    for (size_t _r = 0; _r < {n}_nptrs; _r++) {{",
                f"        auto& sym_row = ctx.registerBuffer(\"{n}_\" + std::to_string(_r), {count} * {eb});",
                f"        sym_row.bind({n}_rows[_r].data());",
                f"    }}"]
    return []


def _build_call_args(spec: HarnessSpec, variant: str) -> list[str]:
    """Build argument list for calling a kernel function."""
    plan_bindings = spec.shape_plan.arg_bindings
    args = []
    for arg in spec.arg_order or []:
        name = arg["name"]
        role = arg["role"]

        if role == ArgRole.PARAMS:
            args.append("&params")
            continue

        if role in SCALAR_VALUE_ROLES:
            # Plan bindings are authoritative for classified kernels.
            # UNCLASSIFIED kernels with missing bindings get a literal "0".
            args.append(plan_bindings.get(name, spec.scalar_args.get(name, "0")))
            continue

        if role == ArgRole.INPUT_ARRAY:
            args.append(f"{name}_arr.data()")
        elif role == ArgRole.INPUT_SCALAR:
            args.append(f"&{name}_val")
        elif role == ArgRole.OUTPUT:
            args.append(f"{name}_{variant}_arr.data()")
        elif role == ArgRole.ZERO_BUFFER:
            args.append(f"{name}_arr.data()")
        elif role == ArgRole.WEIGHTS:
            dual = spec.profile and spec.profile.dual_weight_layout
            buf = next((b for b in spec.buffers if b.arg_name == name), None)
            if dual:
                # Each kernel gets its own weight buffer
                suffix = "neon" if variant == "neon" else "rvv"
                if buf and buf.elem_type.c_type and buf.elem_type.c_type != "uint8_t":
                    args.append(f"(const {buf.elem_type.c_type}*){name}_{suffix}_arr.data()")
                else:
                    args.append(f"(const void*){name}_{suffix}_arr.data()")
            else:
                if buf and buf.elem_type.c_type and buf.elem_type.c_type != "uint8_t":
                    args.append(f"(const {buf.elem_type.c_type}*){name}_arr.data()")
                else:
                    args.append(f"(const void*){name}_arr.data()")
        elif role == ArgRole.INDIRECT_INPUT:
            args.append(f"{name}_ptrs.data()")
        else:
            args.append(f"/* {name} */ 0")
    return args


def _emit_main(spec: HarnessSpec, configs: list[tuple[str, str]]) -> str:
    """Generate main() — interleaved: for each batch size, run all configs.

    This finds bugs faster by testing all param combos at small batch sizes
    before moving to larger ones, giving broader coverage earlier.
    """
    has_params = bool(spec.params_type)
    ba = spec.sweep_arg
    is_2d = spec.is_2d
    is_spatial = spec.is_spatial
    sd = spec.secondary_dim
    # Second sweep dim name for SPATIAL — the verify() function's extra param.
    spatial_sd = (spec.shape_plan.sweep_dims[1].name
                  if is_spatial and len(spec.shape_plan.sweep_dims) >= 2 else "")
    num_configs = len(configs)

    L = []
    L.append("")
    L.append("int main(int argc, char** argv) {")
    L.append("    // Force line-buffered stdout so status lines appear immediately")
    L.append("    // when the harness is driven by a pipe (e.g. orchestrator).")
    L.append("    setvbuf(stdout, NULL, _IOLBF, 0);")
    L.append('    if (argc < 3) { fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout]\\n", argv[0]); return 2; }')
    L.append("    size_t start = (size_t)atoi(argv[1]);")
    L.append("    size_t end   = (size_t)atoi(argv[2]);")
    L.append(f"    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : {spec.vlen};")
    L.append("    double timeout = (argc > 4) ? atof(argv[4]) : 0;")
    L.append("")

    if is_2d:
        sweep = spec.profile.channel_sweep if spec.profile and spec.profile.channel_sweep else [16]
        dual = spec.profile.dual_weight_layout if spec.profile else None
        has_expr = any(isinstance(v, str) for v in sweep)
        if has_expr and dual:
            L.append(f"    size_t _vlmax = {dual['rvv_tile_expr']};")
        sweep_str = ", ".join(str(v) for v in sweep)
        L.append(f"    size_t {sd}_sizes[] = {{{sweep_str}}};")
        L.append(f"    size_t num_{sd}_sizes = sizeof({sd}_sizes) / sizeof({sd}_sizes[0]);")
        L.append("")
    elif is_spatial:
        # SPATIAL's second sweep dim (output_channels) carries explicit values.
        vals = spec.shape_plan.sweep_dims[1].values or [4, 8]
        sweep_str = ", ".join(str(v) for v in vals)
        L.append(f"    size_t {spatial_sd}_sizes[] = {{{sweep_str}}};")
        L.append(f"    size_t num_{spatial_sd}_sizes = sizeof({spatial_sd}_sizes) / sizeof({spatial_sd}_sizes[0]);")
        L.append("")

    # Initialize all param configs upfront
    if has_params and num_configs > 1:
        for idx, (cfg_name, cfg_init) in enumerate(configs):
            L.append(f"    // {cfg_name}")
            L.append(f"    {spec.params_type} params_{idx}{{}};")
            if cfg_init.strip():
                for init_line in cfg_init.strip().split("\n"):
                    # Replace "params." with "params_N."
                    L.append(f"    {init_line.lstrip().replace('params.', f'params_{idx}.')}")
            else:
                L.append(f"    memset(&params_{idx}, 0, sizeof(params_{idx}));")
        L.append("")
        # Build arrays of params pointers and config names
        ptrs = ", ".join(f"&params_{i}" for i in range(num_configs))
        names = ", ".join(f'"{cfg_name}"' for cfg_name, _ in configs)
        L.append(f"    const {spec.params_type}* _params_list[] = {{{ptrs}}};")
        L.append(f"    const char* _config_names[] = {{{names}}};")
        L.append(f"    const int _num_configs = {num_configs};")
        L.append("")
    elif has_params:
        # Single config (e.g., symbolic mode)
        cfg_name, cfg_init = configs[0]
        L.append(f"    {spec.params_type} params{{}};")
        if cfg_init.strip():
            for init_line in cfg_init.strip().split("\n"):
                L.append(f"    {init_line.lstrip()}")
        else:
            L.append("    memset(&params, 0, sizeof(params));")
        L.append("")

    # Outer loop: secondary sweep dim (2D: channels values; SPATIAL: output_channels values).
    if is_2d:
        L.append(f"  for (size_t _ci = 0; _ci < num_{sd}_sizes; _ci++) {{")
        L.append(f"    size_t {sd} = {sd}_sizes[_ci];")
    elif is_spatial:
        L.append(f"  for (size_t _ci = 0; _ci < num_{spatial_sd}_sizes; _ci++) {{")
        L.append(f"    size_t {spatial_sd} = {spatial_sd}_sizes[_ci];")

    # For byte-count batch kernels, sweep in elem_bytes steps and align
    # the start to avoid invalid sub-element batches.
    if spec.sweep_is_bytes:
        step = spec.elem_bytes
        L.append(f"    size_t _start_aligned = start < {step} ? {step} : (start + {step} - 1) / {step} * {step};")
        L.append(f"    for (size_t {ba} = _start_aligned; {ba} <= end; {ba} += {step}) {{")
    else:
        L.append(f"    for (size_t {ba} = start; {ba} <= end; {ba}++) {{")

    outer_dim = sd if is_2d else (spatial_sd if is_spatial else "")
    two_dim_verify = is_2d or is_spatial

    # Inner loop: all configs at this batch size
    if has_params and num_configs > 1:
        L.append(f"        for (int _cfg = 0; _cfg < _num_configs; _cfg++) {{")
        if two_dim_verify:
            L.append(f'            char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "%s_{outer_dim}%zu", _config_names[_cfg], {outer_dim});')
            vcall = f'verify({ba}, {outer_dim}, vlen, *_params_list[_cfg], _cfgbuf)'
        else:
            vcall = f'verify({ba}, vlen, *_params_list[_cfg], _config_names[_cfg])'
        L.append(f"            auto t0 = std::chrono::steady_clock::now();")
        L.append(f"            bool ok = {vcall};")
        L.append(f"            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"            if (!ok) return 1;")
        L.append(f"            if (timeout > 0 && secs > timeout) {{")
        cfg_id = '_cfgbuf' if two_dim_verify else '_config_names[_cfg]'
        L.append(f'                printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"seconds\\":%.1f,\\"config\\":\\"%s\\"}}\\n", {ba}, secs, {cfg_id});')
        L.append(f"                goto done;")
        L.append(f"            }}")
        L.append(f"        }}")
    else:
        # Single config
        cfg_name = configs[0][0] if configs else "default"
        if two_dim_verify:
            L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_{outer_dim}%zu", {outer_dim});')
            if has_params:
                vcall = f'verify({ba}, {outer_dim}, vlen, params, _cfgbuf)'
            else:
                vcall = f'verify({ba}, {outer_dim}, vlen, _cfgbuf)'
        else:
            if has_params:
                vcall = f'verify({ba}, vlen, params, "{cfg_name}")'
            else:
                vcall = f'verify({ba}, vlen, "{cfg_name}")'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        cfg_id = '_cfgbuf' if two_dim_verify else f'"{cfg_name}"'
        L.append(f'            printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"seconds\\":%.1f,\\"config\\":\\"%s\\"}}\\n", {ba}, secs, {cfg_id});')
        L.append(f"            goto done;")
        L.append(f"        }}")

    L.append(f"    }}")  # close batch loop

    if is_2d or is_spatial:
        L.append(f"  }}")  # close outer sweep loop

    L.append("done:")
    L.append(f'    printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":%zu,\\"end\\":%zu,\\"configs\\":%d}}\\n", start, end, {num_configs});')
    L.append("    return 0;")
    L.append("}")
    L.append("")
    return "\n".join(L)


# ---------------------------------------------------------------------------
# Standalone CLI — useful for regenerating a single harness without invoking
# the full orchestrator (which would also compile + run).
# ---------------------------------------------------------------------------
def main():
    import argparse

    p = argparse.ArgumentParser(description="Generate a SALTy-RN verification harness")
    p.add_argument("--neon", required=True, help="Path to NEON kernel source")
    p.add_argument("--rvv", required=True, help="Path to RVV kernel source")
    p.add_argument("--kernel-name", default="", help="Kernel name (default: NEON file stem)")
    p.add_argument("--vlen", type=int, default=256, help="Target VLEN in bits")
    p.add_argument("--symbolic-params", action="store_true",
                   help="Generate symbolic-params variant")
    p.add_argument("--backend", choices=["bitwuzla", "cvc5"], default="bitwuzla",
                   help="SMT backend the harness will be compiled against")
    p.add_argument("--query-timeout-ms", type=int, default=600000,
                   help="Per-query solver timeout in ms (set on the solver via tlimit-per / TIME_LIMIT_PER)")
    p.add_argument("-o", "--output", default="-", help="Output path or '-' for stdout")
    args = p.parse_args()

    name = args.kernel_name or Path(args.neon).stem
    h = generate_harness_from_files(
        args.neon, args.rvv,
        kernel_name=name,
        symbolic_params=args.symbolic_params,
        vlen=args.vlen,
        backend=args.backend,
        per_query_timeout_ms=args.query_timeout_ms,
    )
    if args.output == "-":
        print(h, end="")
    else:
        Path(args.output).write_text(h)


if __name__ == "__main__":
    main()
