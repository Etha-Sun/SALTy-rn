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
# Status JSON emit helpers — single source of truth for harness stdout lines.
# Each returns a C++ `printf(...);` statement string. Args are C expressions
# (variable names) the caller wants interpolated.
# ---------------------------------------------------------------------------

def _emit_solving(ba: str, cfg: str) -> str:
    return (f'printf("{{\\"status\\":\\"SOLVING\\",\\"batch\\":%zu,'
            f'\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {ba}, vlen, {cfg});')

def _emit_verified(ba: str, cfg: str) -> str:
    return (f'printf("{{\\"status\\":\\"VERIFIED\\",\\"batch\\":%zu,'
            f'\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {ba}, vlen, {cfg});')

def _emit_solver_timeout(ba: str, cfg: str) -> str:
    return (f'printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,'
            f'\\"vlen\\":%zu,\\"config\\":\\"%s\\",'
            f'\\"reason\\":\\"solver-unknown\\"}}\\n", {ba}, vlen, {cfg});')

def _emit_wall_timeout(ba: str, secs: str, cfg: str) -> str:
    return (f'printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,'
            f'\\"seconds\\":%.1f,\\"config\\":\\"%s\\"}}\\n", {ba}, {secs}, {cfg});')

def _emit_all_verified(start: str, end: str, num_configs: int) -> str:
    return (f'printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":%zu,'
            f'\\"end\\":%zu,\\"configs\\":%d}}\\n", {start}, {end}, {num_configs});')


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

    # Source-fact extraction. Precedence: profile.buffer_layouts (if set) wins
    # over regex-inferred layouts. Profile entries are passed into both lints
    # so a profile override can rescue patterns the regex misses (alias case)
    # and RVV split-arithmetic for profile-declared buffers isn't rejected.
    # harness_gen.py never inspects source directly — all detection lives in
    # source_facts.py.
    from .source_facts import extract_source_facts, lint_rvv_against_neon
    profile_layouts = (spec.profile.buffer_layouts
                       if spec.profile and spec.profile.buffer_layouts else {})
    facts = extract_source_facts(
        neon_source, spec.sweep_arg,
        known_buffers={buf.arg_name for buf in spec.buffers},
        profile_layouts=profile_layouts,
    )
    lint_rvv_against_neon(rvv_source, spec.sweep_arg, facts,
                           profile_layouts=profile_layouts)
    spec.batch_unit_bytes = facts.batch_unit_bytes
    for buf in spec.buffers:
        if buf.arg_name in profile_layouts:
            buf.layout = profile_layouts[buf.arg_name]
        elif buf.arg_name in facts.buffer_layouts:
            buf.layout = facts.buffer_layouts[buf.arg_name]
        # buf.size_expr stays as-is (one plane); emit sites scale by
        # buf.layout.planes. Single source of truth for layout sizing.
    if facts.evidence:
        log.info("Source facts for %s: %s", kernel_name, "; ".join(facts.evidence))

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
            # `void*` is a generic byte-buffer pointer; either side using it is
            # compatible with any concrete element type on the other side at the
            # symbolic-byte-buffer level the harness operates on.
            if na.base_type != "void" and ra.base_type != "void":
                raise ValueError(
                    f"Arg {i} type mismatch: NEON {na.base_type}* vs RVV {ra.base_type}*")
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

    # Apply named source transforms. Implicit triggers populate the run list;
    # profile.required_transforms enforces fail-closed expectations.
    # The runner consults each transform's REGISTRY targets to decide which
    # source(s) it applies to — so a NEON-only required transform won't
    # falsely fail on the RVV source.
    from .source_transforms import apply_transforms
    tables = spec.profile.lookup_tables if spec.profile and spec.profile.lookup_tables else None
    declared = list(spec.profile.required_transforms) if spec.profile else []
    auto = []
    if symbolic_params and spec.params_type:
        auto.append("symbolic_params")
    if tables:
        auto.append("neon_lut_gathers")
        auto.append("strip_lut_externs")
    run_list = list(dict.fromkeys(declared + auto))
    ctx = {"params_type": spec.params_type, "tables": tables}
    required = set(declared)
    neon_source, _ = apply_transforms(neon_source, run_list, ctx,
                                       target="neon", required=required)
    rvv_source, _ = apply_transforms(rvv_source, run_list, ctx,
                                       target="rvv", required=required)

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
    lines = ["    // Lookup tables — registered as concrete read-only buffers"]
    for tbl in tables:
        sym = tbl["symbol"]
        num_bytes = tbl["entries"] * tbl["elem_bytes"]
        buf_name = sym  # buffer name derived from symbol, not hardcoded
        lines.append(f"    auto& sym_{sym} = ctx.registerConcreteBuffer(\"{buf_name}\", ::{sym}, {num_bytes});")
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
    input_bufs = [b for b in spec.buffers
                  if b.role in (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR, ArgRole.INDIRECT_INPUT)]

    ba = spec.sweep_arg
    has_params = bool(spec.params_type)
    sd = spec.secondary_dim

    L = []  # lines

    L.append(_emit_verify_signature(spec))

    L.append(f"    VerificationContext ctx(vlen);")
    L.append(f"    g_ctx = &ctx;")
    # Per-query solver timeout — must be set BEFORE any assertions so the
    # bitwuzla backend can rebuild the solver with the new option in place.
    L.append(f"    ctx.set_query_timeout_ms({per_query_timeout_ms});")

    # Scalar-arg local decls.  Shapes that carry args via alloc_decls +
    # arg_bindings skip this loop entirely.
    if (not spec.is_spatial and not spec.is_gemm and not spec.is_reduce
            and not spec.is_transpose and not spec.is_pool
            and not spec.is_bilinear and not spec.is_dwconv
            and not spec.is_igemm and not spec.is_reduce_2d
            and not spec.is_pack_w and not spec.is_prelu
            and not spec.is_gemm_group and not spec.is_concat2
            and not spec.is_zip_2 and not spec.is_split_2
            and not spec.is_outer_product and not spec.is_gemm_qc4w
            and not spec.is_vlut):
        for arg_name, arg_val in spec.scalar_args.items():
            if spec.is_2d and arg_name == sd:
                continue  # already a function parameter
            elif spec.is_2d and arg_name in ("input_stride", "output_stride"):
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

    # Concrete params: register as concrete read-only buffer so pointer-based
    # param access works (e.g. f16 kernels do vld1q_dup_u16(&params->scalar.min))
    if not symbolic_params and has_params:
        L.append(f"    // Register params as concrete buffer for pointer-based intrinsic access")
        L.append(f"    auto& sym_params = ctx.registerConcreteBuffer(\"params\", &params, sizeof(params));")
        L.append(f"")

    # Lookup tables: register as concrete buffers with byte constraints
    if spec.profile and spec.profile.lookup_tables:
        L.append(_emit_lut_registration(spec.profile.lookup_tables))
        L.append("")

    # Input range constraint: restrict each f32/f64 input lane to a finite
    # range.  Excludes NaN/inf/subnormal by construction (FP comparisons
    # return false for NaN) — big speedup for FP-heavy kernels.
    if spec.profile and spec.profile.input_range and not spec.is_2d and not spec.is_gemm:
        lo, hi = spec.profile.input_range
        lbrace, rbrace = "{", "}"
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            ek = buf.elem_type.element_kind
            if ek != "F32":
                raise ValueError(
                    f"input_range on '{buf.arg_name}' has element kind '{ek}' but "
                    f"only F32 is supported. Add fp64 helpers (mk_fp64_from_double, "
                    f"load_as_fp64, ctx.fp64_geq/leq) to both backends and remove "
                    f"this check before re-enabling F64."
                )
            be = buf.elem_type.byte_size or 4
            bits = be * 8
            L.append(f"    // Input range constraint on '{buf.arg_name}': [{lo}, {hi}]")
            L.append(f"    {lbrace}")
            L.append(f"        Term _lo = mk_fp32_from_float(ctx.tm, {lo}f);")
            L.append(f"        Term _hi = mk_fp32_from_float(ctx.tm, {hi}f);")
            L.append(f"        for (size_t _i = 0; _i < padded; _i++) {lbrace}")
            L.append(f"            Term _bv = sym_{buf.arg_name}.loadScalar(_i * {be}, {bits});")
            L.append(f"            Term _fp = load_as_fp32(ctx.tm, _bv);")
            L.append(f"            ctx.assert_(ctx.land_(")
            L.append(f"                ctx.fp32_geq(_fp, _lo),")
            L.append(f"                ctx.fp32_leq(_fp, _hi)")
            L.append(f"            ));")
            L.append(f"        {rbrace}")
            L.append(f"    {rbrace}")
        L.append("")

    # Phase markers — opt-in via SALT_PHASES=1.  Times each major phase to
    # stderr so we can pinpoint where verification spends its time.
    L.append(f'    auto _t_phase = std::chrono::steady_clock::now();')
    L.append(f'    auto _phase_mark = [&](const char* tag) {{')
    L.append(f'        if (const char* s = std::getenv("SALT_PHASES"); !s || std::string(s) != "1") return;')
    L.append(f'        auto _now = std::chrono::steady_clock::now();')
    L.append(f'        double _ms = std::chrono::duration<double, std::milli>(_now - _t_phase).count();')
    L.append(f'        fprintf(stderr, "[PHASE %s] +%.1f ms (config=%s)\\n", tag, _ms, config_id);')
    L.append(f'        fflush(stderr);')
    L.append(f'        _t_phase = _now;')
    L.append(f'    }};')
    L.append(f'    _phase_mark("setup_done");')

    # Call both kernels
    neon_args = _build_call_args(spec, "neon")
    rvv_args = _build_call_args(spec, "rvv")
    L.append(f"    neon_kernel::{spec.neon_func_name}({', '.join(neon_args)});")
    L.append(f'    _phase_mark("neon_kernel_done");')
    L.append(f"    rvv_kernel::{spec.rvv_func_name}({', '.join(rvv_args)});")
    L.append(f'    _phase_mark("rvv_kernel_done");')
    L.append("")

    L.extend(_emit_output_comparison(spec, output_bufs, ba))
    L.append(f'    _phase_mark("equiv_formula_built");')

    L.append(f"    ctx.assert_(ctx.lnot_(equiv));")
    L.append(f'    _phase_mark("assert_done");')
    L.append(f"    {_emit_solving(ba, 'config_id')}")
    L.append(f"    CheckResult result = ctx.check();")
    L.append(f'    _phase_mark("check_done");')
    L.append(f"    ctx.print_stats();")
    L.append(f"")

    L.append(f'    if (result == CheckResult::Unsat) {{')
    L.append(f"        {_emit_verified(ba, 'config_id')}")
    L.append(f'        return true;')
    L.append(f'    }}')
    L.append(f'    if (result == CheckResult::Unknown) {{')
    L.append(f"        {_emit_solver_timeout(ba, 'config_id')}")
    L.append(f'        return false;')
    L.append(f'    }}')
    L.append(f"")

    # SAT → counterexample
    L.append(f'    size_t fi = 0;')
    L.append(f'    const char* fail_buf = "";')

    L.extend(_emit_witness_scan(spec, output_bufs, ba))

    L.append(f'    found_mismatch:')
    L.append(f'    printf("{{\\"status\\":\\"COUNTEREXAMPLE\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\",\\"fail_index\\":%zu,\\"fail_output\\":\\"%s\\",", {ba}, vlen, config_id, fi, fail_buf);')

    L.extend(_emit_counterexample_payload(spec, input_bufs, output_bufs, ba))

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
    if buf.layout.planes > 1:
        elem_count = f"({elem_count}) * {buf.layout.planes}"
        zero_count = f"({zero_count}) * {buf.layout.planes}"

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
    if buf.layout.planes > 1:
        padded_bytes = f"({padded_bytes}) * {buf.layout.planes}"

    if buf.role == ArgRole.INPUT_SCALAR:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {eb});",
                f"    sym_{n}.bind(&{n}_val);"]
    elif buf.role == ArgRole.INPUT_ARRAY:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {padded_bytes});",
                f"    sym_{n}.bind({n}_arr.data());"]
    elif buf.role == ArgRole.OUTPUT:
        lines = [f"    auto& sym_{n}_neon = ctx.registerBuffer(\"{n}_neon\", {padded_bytes});",
                f"    sym_{n}_neon.bind({n}_neon_arr.data());",
                f"    auto& sym_{n}_rvv = ctx.registerBuffer(\"{n}_rvv\", {padded_bytes});",
                f"    sym_{n}_rvv.bind({n}_rvv_arr.data());"]
        # REDUCE_1D: store concrete init values into both output buffers so the
        # kernel's read-modify-write accumulation has a defined starting point.
        # The init values come from the profile (e.g. ["0.5f"] for rsum).
        if spec and spec.is_reduce and spec.profile and spec.profile.reduce:
            r = spec.profile.reduce
            inits = r.get("output_init", ["0"])
            bits = (buf.elem_type.byte_size or 4) * 8
            ct = buf.elem_type.c_type or "float"
            lines.append(f"    // REDUCE_1D: pre-initialize output buffer with profile.reduce.output_init")
            lines.append(f"    {{")
            for i, lit in enumerate(inits):
                lines.append(f"        {n}_neon_arr[{i}] = ({ct}){lit};")
                lines.append(f"        {n}_rvv_arr[{i}]  = ({ct}){lit};")
                lines.append(f"        // Mirror init into the symbolic buffer so the kernel's")
                lines.append(f"        // first read sees a concrete BV constant.")
                lines.append(f"        {{ uint{bits}_t _ib;")
                lines.append(f"          memcpy(&_ib, &{n}_neon_arr[{i}], {bits//8});")
                lines.append(f"          Term _iv = ctx.bv_val({bits}, _ib);")
                lines.append(f"          sym_{n}_neon.storeScalar({i * (buf.elem_type.byte_size or 4)}, _iv, {bits});")
                lines.append(f"          sym_{n}_rvv.storeScalar({i * (buf.elem_type.byte_size or 4)},  _iv, {bits}); }}")
            lines.append(f"    }}")
        return lines
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
                lines.append(f"    auto& sym_{n}_neon = ctx.registerConcreteBuffer(\"{n}_neon\", {n}_neon_arr.data(), {n}_neon_size);")
                lines.append(f"    auto& sym_{n}_rvv  = ctx.registerConcreteBuffer(\"{n}_rvv\",  {n}_rvv_arr.data(),  {n}_rvv_size);")
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

            lines.append(
                f"    auto& sym_{n} = ctx.registerConcreteBuffer(\"{n}\", {n}_arr.data(), {n}_size);")
            return lines
    elif buf.role == ArgRole.INDIRECT_INPUT:
        # Per-row buffer size = count_name * elem_bytes.  ROW_CHAN_2D's
        # `total_elems` and FLAT_1D's `padded` are special cases of count_name;
        # prefer the shape_plan field which works for POOL_INDIRECT too.
        count = spec.shape_plan.count_name or ("total_elems" if spec.is_2d else "padded")
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
            val = plan_bindings.get(name, spec.scalar_args.get(name, "0"))
            if role == ArgRole.BATCH and spec.batch_unit_bytes > 1:
                val = f"({val} * {spec.batch_unit_bytes})"
            args.append(val)
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
            suffix = ("_" + variant) if dual else ""
            # vector<uint8_t>::data() is uint8_t* — implicitly converts to
            # both const uint8_t* and const void*, so no cast needed.
            if buf and buf.elem_type.c_type and buf.elem_type.c_type != "uint8_t":
                args.append(f"(const {buf.elem_type.c_type}*){name}{suffix}_arr.data()")
            else:
                args.append(f"{name}{suffix}_arr.data()")
        elif role == ArgRole.INDIRECT_INPUT:
            args.append(f"{name}_ptrs.data()")
        else:
            args.append(f"/* {name} */ 0")
    return args


def _spatial_sd(spec: HarnessSpec) -> str:
    return (spec.shape_plan.sweep_dims[1].name
            if spec.is_spatial and len(spec.shape_plan.sweep_dims) >= 2 else "")


def _emit_verify_signature(spec: HarnessSpec) -> str:
    """Site 1: verify() signature line. 6-way branch on (shape) × (has_params)."""
    has_params = bool(spec.params_type)
    params = f"const {spec.params_type}& params, " if has_params else ""
    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        # GEMM/IGEMM/QC4W share the same three sweep dims: mr, nc, kc.
        return f"bool verify(size_t mr, size_t nc, size_t kc, size_t vlen, {params}const char* config_id) {{"
    if spec.is_transpose:
        # TRANSPOSE_2D: paired (block_width, block_height) sweep.
        return f"bool verify(size_t block_width, size_t block_height, size_t vlen, {params}const char* config_id) {{"
    if spec.is_pool:
        # POOL_INDIRECT: triple sweep over (channels, output_pixels, kernel_elements).
        return f"bool verify(size_t channels, size_t output_pixels, size_t kernel_elements, size_t vlen, {params}const char* config_id) {{"
    if spec.is_bilinear:
        # BILINEAR_INDIRECT: 2-dim sweep over (channels, output_pixels).
        return f"bool verify(size_t channels, size_t output_pixels, size_t vlen, {params}const char* config_id) {{"
    if spec.is_dwconv:
        # DWCONV_INDIRECT: 2-dim sweep over (channels, output_width).
        return f"bool verify(size_t channels, size_t output_width, size_t vlen, {params}const char* config_id) {{"
    if spec.is_reduce_2d:
        # REDUCE_2D: 2-dim sweep over (channels, rows).
        return f"bool verify(size_t channels, size_t rows, size_t vlen, {params}const char* config_id) {{"
    if spec.is_pack_w:
        # PACK_W: 2-dim sweep over (nc, kc).
        return f"bool verify(size_t nc, size_t kc, size_t vlen, {params}const char* config_id) {{"
    if spec.is_prelu:
        # PRELU: 2-dim sweep over (channels, rows).
        return f"bool verify(size_t channels, size_t rows, size_t vlen, {params}const char* config_id) {{"
    if spec.is_gemm_group:
        # GEMM_GROUP_FP: 4-dim sweep over (g, mr, nc, kc).
        return f"bool verify(size_t g, size_t mr, size_t nc, size_t kc, size_t vlen, {params}const char* config_id) {{"
    if spec.is_concat2:
        # CONCAT2: 2-dim sweep over (na, nb).
        return f"bool verify(size_t na, size_t nb, size_t vlen, {params}const char* config_id) {{"
    if spec.is_zip_2:
        # ZIP_2: 1-dim sweep over n.
        return f"bool verify(size_t n, size_t vlen, {params}const char* config_id) {{"
    if spec.is_split_2:
        # SPLIT_2: 2-dim sweep over (na, nb).
        return f"bool verify(size_t na, size_t nb, size_t vlen, {params}const char* config_id) {{"
    if spec.is_outer_product:
        # OUTER_PRODUCT: 2-dim sweep over (m, n).
        return f"bool verify(size_t m, size_t n, size_t vlen, {params}const char* config_id) {{"
    if spec.is_vlut:
        # VLUT: 1-dim sweep over n (byte count).
        return f"bool verify(size_t n, size_t vlen, {params}const char* config_id) {{"
    ba = spec.sweep_arg
    extra_dim = (_spatial_sd(spec) if spec.is_spatial
                 else spec.secondary_dim if spec.is_2d else "")
    extra = f"size_t {extra_dim}, " if extra_dim else ""
    return f"bool verify(size_t {ba}, {extra}size_t vlen, {params}const char* config_id) {{"


def _emit_output_comparison(spec: HarnessSpec, output_bufs: list, ba: str) -> list:
    """Site 2: build the `equiv` Term comparing all output bytes the kernel wrote."""
    L = []
    if spec.is_transpose:
        # TRANSPOSE_2D: output is `block_width` rows of `block_height` elems
        # (packed, no padding).  Compare every element against the rvv side.
        eb = spec.profile.transpose["elem_bytes"]
        out0 = output_bufs[0]
        L.append(f"    std::vector<Term> _trn_eqs;")
        L.append(f"    for (size_t _r = 0; _r < block_width; _r++) {{")
        L.append(f"      for (size_t _c = 0; _c < block_height; _c++) {{")
        L.append(f"        size_t _off = _r * output_stride + _c * {eb};")
        L.append(f"        Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"        Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"        _trn_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"      }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _trn_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _trn_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _trn_eqs[_i]);")
        return L
    if spec.is_pool or spec.is_bilinear or spec.is_dwconv:
        # POOL/BILINEAR/DWCONV: output is N × channels (packed).  N is
        # output_pixels for POOL/BILINEAR, output_width for DWCONV.
        if spec.is_pool:
            eb = spec.profile.pool["elem_bytes"]; tag = "pool"; n_var = "output_pixels"
        elif spec.is_bilinear:
            eb = spec.profile.bilinear["elem_bytes"]; tag = "bil"; n_var = "output_pixels"
        else:
            d = spec.profile.dwconv
            eb = d.get("output_elem_bytes", d["elem_bytes"]); tag = "dwc"; n_var = "output_width"
        out0 = output_bufs[0]
        L.append(f"    std::vector<Term> _{tag}_eqs;")
        L.append(f"    for (size_t _p = 0; _p < {n_var}; _p++) {{")
        L.append(f"      for (size_t _c = 0; _c < channels; _c++) {{")
        L.append(f"        size_t _off = _p * (channels * {eb}) + _c * {eb};")
        L.append(f"        Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"        Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"        _{tag}_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"      }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _{tag}_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _{tag}_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _{tag}_eqs[_i]);")
        return L
    if spec.is_reduce:
        # REDUCE_1D: compare exactly n_outputs scalars at offset i * elem_bytes.
        n_out = spec.profile.reduce.get("n_outputs", 1) if spec.profile and spec.profile.reduce else 1
        out0 = output_bufs[0]
        eb = out0.elem_type.byte_size or 4
        L.append(f"    std::vector<Term> _red_eqs;")
        for i in range(n_out):
            L.append(f"    {{ Term _n{i} = sym_{out0.arg_name}_neon.loadScalar({i * eb}, {eb*8});")
            L.append(f"      Term _r{i} = sym_{out0.arg_name}_rvv .loadScalar({i * eb}, {eb*8});")
            L.append(f"      _red_eqs.push_back(element_equal(ctx.tm, _n{i}, _r{i}, ElementKind::{out0.elem_type.element_kind})); }}")
        L.append(f"    Term equiv = _red_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _red_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _red_eqs[_i]);")
        return L
    if spec.is_reduce_2d:
        out0 = output_bufs[0]
        eb = spec.profile.reduce_2d["elem_bytes"]
        L.append(f"    std::vector<Term> _r2d_eqs;")
        L.append(f"    for (size_t _c = 0; _c < channels; _c++) {{")
        L.append(f"      size_t _off = _c * {eb};")
        L.append(f"      Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"      Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"      _r2d_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"    }}")
        L.append(f"    Term equiv = _r2d_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _r2d_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _r2d_eqs[_i]);")
        return L
    if spec.is_pack_w:
        out0 = output_bufs[0]
        eb = spec.profile.pack_w["elem_bytes"]
        L.append(f"    std::vector<Term> _pkw_eqs;")
        L.append(f"    for (size_t _i = 0; _i < nc * (1 + kc); _i++) {{")
        L.append(f"      size_t _off = _i * {eb};")
        L.append(f"      Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"      Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"      _pkw_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"    }}")
        L.append(f"    Term equiv = _pkw_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _pkw_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _pkw_eqs[_i]);")
        return L
    if spec.is_prelu:
        out0 = output_bufs[0]
        eb = spec.profile.prelu["elem_bytes"]
        L.append(f"    std::vector<Term> _prelu_eqs;")
        L.append(f"    for (size_t _r = 0; _r < rows; _r++) {{")
        L.append(f"      for (size_t _c = 0; _c < channels; _c++) {{")
        L.append(f"        size_t _off = _r * channel_bytes + _c * {eb};")
        L.append(f"        Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"        Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"        _prelu_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"      }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _prelu_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _prelu_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _prelu_eqs[_i]);")
        return L
    if spec.is_gemm_group:
        out0 = output_bufs[0]
        eb = spec.profile.gemm_group["elem_bytes"]
        L.append(f"    std::vector<Term> _ggrp_eqs;")
        L.append(f"    for (size_t _gi = 0; _gi < g; _gi++) {{")
        L.append(f"      for (size_t _m = 0; _m < mr; _m++) {{")
        L.append(f"        for (size_t _n = 0; _n < nc; _n++) {{")
        L.append(f"          size_t _off = ((_gi * mr + _m) * nc + _n) * {eb};")
        L.append(f"          Term _n_t = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"          Term _r_t = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"          _ggrp_eqs.push_back(element_equal(ctx.tm, _n_t, _r_t, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"        }}")
        L.append(f"      }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _ggrp_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _ggrp_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _ggrp_eqs[_i]);")
        return L
    if spec.is_concat2:
        out0 = output_bufs[0]
        eb = spec.profile.concat2["elem_bytes"]
        L.append(f"    std::vector<Term> _cat_eqs;")
        L.append(f"    for (size_t _i = 0; _i < na + nb; _i++) {{")
        L.append(f"      size_t _off = _i * {eb};")
        L.append(f"      Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"      Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"      _cat_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"    }}")
        L.append(f"    Term equiv = _cat_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _cat_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _cat_eqs[_i]);")
        return L
    if spec.is_zip_2:
        out0 = output_bufs[0]
        eb = spec.profile.zip_2["elem_bytes"]
        L.append(f"    std::vector<Term> _zip_eqs;")
        L.append(f"    for (size_t _i = 0; _i < 2 * n; _i++) {{")
        L.append(f"      size_t _off = _i * {eb};")
        L.append(f"      Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"      Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"      _zip_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"    }}")
        L.append(f"    Term equiv = _zip_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _zip_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _zip_eqs[_i]);")
        return L
    if spec.is_split_2:
        eb = spec.profile.split_2["elem_bytes"]
        L.append(f"    std::vector<Term> _spl_eqs;")
        for ob in output_bufs:
            n_var = "na" if ob.arg_name == "a" else "nb"
            L.append(f"    for (size_t _i = 0; _i < {n_var}; _i++) {{")
            L.append(f"      size_t _off = _i * {eb};")
            L.append(f"      Term _n = sym_{ob.arg_name}_neon.loadScalar(_off, {eb*8});")
            L.append(f"      Term _r2 = sym_{ob.arg_name}_rvv .loadScalar(_off, {eb*8});")
            L.append(f"      _spl_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{ob.elem_type.element_kind}));")
            L.append(f"    }}")
        L.append(f"    Term equiv = _spl_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _spl_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _spl_eqs[_i]);")
        return L
    if spec.is_outer_product:
        out0 = output_bufs[0]
        eb = spec.profile.outer_product["elem_bytes"]
        L.append(f"    std::vector<Term> _op_eqs;")
        L.append(f"    for (size_t _i = 0; _i < m * n; _i++) {{")
        L.append(f"      size_t _off = _i * {eb};")
        L.append(f"      Term _n = sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8});")
        L.append(f"      Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8});")
        L.append(f"      _op_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"    }}")
        L.append(f"    Term equiv = _op_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _op_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _op_eqs[_i]);")
        return L
    if spec.is_vlut:
        out0 = output_bufs[0]
        L.append(f"    std::vector<Term> _vlut_eqs;")
        L.append(f"    for (size_t _i = 0; _i < n; _i++) {{")
        L.append(f"      Term _n = sym_{out0.arg_name}_neon.loadScalar(_i, 8);")
        L.append(f"      Term _r2 = sym_{out0.arg_name}_rvv .loadScalar(_i, 8);")
        L.append(f"      _vlut_eqs.push_back(element_equal(ctx.tm, _n, _r2, ElementKind::{out0.elem_type.element_kind}));")
        L.append(f"    }}")
        L.append(f"    Term equiv = _vlut_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _vlut_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _vlut_eqs[_i]);")
        return L
    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        # Tile-aware compare: c[m * cm_stride + (n / tile_n) * cn_stride
        #                       + (n % tile_n) * elem_bytes]
        if spec.is_gemm:
            g = spec.profile.gemm; tile_n = g["weight_tile_n"]; eb = g["elem_bytes"]
        elif spec.is_gemm_qc4w:
            g = spec.profile.gemm_qc4w; tile_n = g["weight_tile_n"]; eb = g["elem_bytes"]
        else:
            g = spec.profile.igemm; tile_n = g["nr"]; eb = g["elem_bytes"]
        L.append(f"    std::vector<Term> _gemm_eqs;")
        L.append(f"    for (size_t _m = 0; _m < mr; _m++) {{")
        L.append(f"      size_t _mof = _m * cm_stride;")
        L.append(f"      for (size_t _n = 0; _n < nc; _n++) {{")
        L.append(f"        size_t _off = _mof + (_n / {tile_n}) * cn_stride + (_n % {tile_n}) * {eb};")
        for ob in output_bufs:
            L.append(f"        Term _n_t = sym_{ob.arg_name}_neon.loadScalar(_off, {eb*8});")
            L.append(f"        Term _r_t = sym_{ob.arg_name}_rvv.loadScalar(_off, {eb*8});")
            L.append(f"        _gemm_eqs.push_back(element_equal(ctx.tm, _n_t, _r_t, ElementKind::{spec.element_kind}));")
        L.append(f"      }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _gemm_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _gemm_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _gemm_eqs[_i]);")
        return L
    if spec.is_spatial:
        spatial_sd = _spatial_sd(spec)
        L.append(f"    std::vector<Term> _chw_eqs;")
        L.append(f"    for (size_t _c = 0; _c < {spatial_sd}; _c++) {{")
        L.append(f"      size_t _cof = _c * output_channel_stride_bytes;")
        L.append(f"      for (size_t _y = 0; _y < {ba}; _y++) {{")
        L.append(f"        size_t _yof = _cof + _y * output_height_stride_bytes;")
        L.append(f"        for (size_t _x = 0; _x < output_width; _x++) {{")
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f"          size_t _off = _yof + _x * {obe};")
            L.append(f"          Term _n = sym_{ob.arg_name}_neon.loadScalar(_off, {obe*8});")
            L.append(f"          Term _rv = sym_{ob.arg_name}_rvv.loadScalar(_off, {obe*8});")
            L.append(f"          _chw_eqs.push_back(element_equal(ctx.tm, _n, _rv, ElementKind::{spec.element_kind}));")
        L.append(f"        }}")
        L.append(f"      }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _chw_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _chw_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _chw_eqs[_i]);")
    elif spec.is_2d:
        L.append(f"    // Compare output rows accounting for stride padding")
        L.append(f"    std::vector<Term> _row_eqs;")
        L.append(f"    for (size_t _r = 0; _r < {ba}; _r++) {{")
        L.append(f"        size_t _row_off = _r * padded_row_bytes;")
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f"        for (size_t _c = 0; _c < num_elems_per_row; _c++) {{")
            L.append(f"            Term _n = sym_{ob.arg_name}_neon.loadScalar(_row_off + _c * {obe}, {obe*8});")
            L.append(f"            Term _rv = sym_{ob.arg_name}_rvv.loadScalar(_row_off + _c * {obe}, {obe*8});")
            L.append(f"            _row_eqs.push_back(element_equal(ctx.tm, _n, _rv, ElementKind::{spec.element_kind}));")
            L.append(f"        }}")
        L.append(f"    }}")
        L.append(f"    Term equiv = _row_eqs[0];")
        L.append(f"    for (size_t _i = 1; _i < _row_eqs.size(); _i++)")
        L.append(f"        equiv = ctx.land_(equiv, _row_eqs[_i]);")
    else:
        out0 = output_bufs[0]
        eb = out0.elem_type.byte_size or 1
        def _cmp(buf):
            return f"({ba} * {buf.layout.planes})" if buf.layout.planes > 1 else ba
        if len(output_bufs) == 1:
            L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{out0.arg_name}_neon, sym_{out0.arg_name}_rvv,")
            L.append(f"                                {_cmp(out0)}, {eb}, ElementKind::{spec.element_kind});")
        else:
            for i, ob in enumerate(output_bufs):
                obe = ob.elem_type.byte_size or 1
                ok = ob.elem_type.element_kind
                if i == 0:
                    L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {_cmp(ob)}, {obe}, ElementKind::{ok});")
                else:
                    L.append(f"    equiv = ctx.land_(equiv, buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {_cmp(ob)}, {obe}, ElementKind::{ok}));")
    return L


def _emit_witness_scan(spec: HarnessSpec, output_bufs: list, ba: str) -> list:
    """Site 3: scan output buffers for the first byte where neon != rvv."""
    L = []
    if spec.is_transpose:
        eb = spec.profile.transpose["elem_bytes"]
        out0 = output_bufs[0]
        L.append(f'    for (size_t _r = 0; _r < block_width; _r++) {{')
        L.append(f'      for (size_t _c = 0; _c < block_height; _c++) {{')
        L.append(f'        size_t _off = _r * output_stride + _c * {eb};')
        L.append(f'        std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'        std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'        if (_ns != _rs) {{ fi = _r * block_height + _c; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'      }}')
        L.append(f'    }}')
        return L
    if spec.is_pool or spec.is_bilinear or spec.is_dwconv:
        if spec.is_pool:
            eb = spec.profile.pool["elem_bytes"]; n_var = "output_pixels"
        elif spec.is_bilinear:
            eb = spec.profile.bilinear["elem_bytes"]; n_var = "output_pixels"
        else:
            d = spec.profile.dwconv
            eb = d.get("output_elem_bytes", d["elem_bytes"]); n_var = "output_width"
        out0 = output_bufs[0]
        L.append(f'    for (size_t _p = 0; _p < {n_var}; _p++) {{')
        L.append(f'      for (size_t _c = 0; _c < channels; _c++) {{')
        L.append(f'        size_t _off = _p * (channels * {eb}) + _c * {eb};')
        L.append(f'        std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'        std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'        if (_ns != _rs) {{ fi = _p * channels + _c; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'      }}')
        L.append(f'    }}')
        return L
    if spec.is_reduce_2d:
        out0 = output_bufs[0]
        eb = spec.profile.reduce_2d["elem_bytes"]
        L.append(f'    for (size_t _c = 0; _c < channels; _c++) {{')
        L.append(f'      size_t _off = _c * {eb};')
        L.append(f'      std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'      if (_ns != _rs) {{ fi = _c; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')
        return L
    if spec.is_pack_w:
        out0 = output_bufs[0]
        eb = spec.profile.pack_w["elem_bytes"]
        L.append(f'    for (size_t _i = 0; _i < nc * (1 + kc); _i++) {{')
        L.append(f'      size_t _off = _i * {eb};')
        L.append(f'      std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'      if (_ns != _rs) {{ fi = _i; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')
        return L
    if spec.is_prelu:
        out0 = output_bufs[0]
        eb = spec.profile.prelu["elem_bytes"]
        L.append(f'    for (size_t _r = 0; _r < rows; _r++) {{')
        L.append(f'      for (size_t _c = 0; _c < channels; _c++) {{')
        L.append(f'        size_t _off = _r * channel_bytes + _c * {eb};')
        L.append(f'        std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'        std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'        if (_ns != _rs) {{ fi = _r * channels + _c; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'      }}')
        L.append(f'    }}')
        return L
    if spec.is_gemm_group:
        out0 = output_bufs[0]
        eb = spec.profile.gemm_group["elem_bytes"]
        L.append(f'    for (size_t _gi = 0; _gi < g; _gi++) {{')
        L.append(f'      for (size_t _m = 0; _m < mr; _m++) {{')
        L.append(f'        for (size_t _n = 0; _n < nc; _n++) {{')
        L.append(f'          size_t _off = ((_gi * mr + _m) * nc + _n) * {eb};')
        L.append(f'          std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'          std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'          if (_ns != _rs) {{ fi = (_gi * mr + _m) * nc + _n; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'        }}')
        L.append(f'      }}')
        L.append(f'    }}')
        return L
    if spec.is_concat2:
        out0 = output_bufs[0]
        eb = spec.profile.concat2["elem_bytes"]
        L.append(f'    for (size_t _i = 0; _i < na + nb; _i++) {{')
        L.append(f'      size_t _off = _i * {eb};')
        L.append(f'      std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'      if (_ns != _rs) {{ fi = _i; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')
        return L
    if spec.is_zip_2:
        out0 = output_bufs[0]
        eb = spec.profile.zip_2["elem_bytes"]
        L.append(f'    for (size_t _i = 0; _i < 2 * n; _i++) {{')
        L.append(f'      size_t _off = _i * {eb};')
        L.append(f'      std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'      if (_ns != _rs) {{ fi = _i; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')
        return L
    if spec.is_split_2:
        eb = spec.profile.split_2["elem_bytes"]
        for ob in output_bufs:
            n_var = "na" if ob.arg_name == "a" else "nb"
            L.append(f'    for (size_t _i = 0; _i < {n_var}; _i++) {{')
            L.append(f'      size_t _off = _i * {eb};')
            L.append(f'      std::string _ns = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_off, {eb*8}));')
            L.append(f'      std::string _rs = ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_off, {eb*8}));')
            L.append(f'      if (_ns != _rs) {{ fi = _i; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'    }}')
        return L
    if spec.is_outer_product:
        out0 = output_bufs[0]
        eb = spec.profile.outer_product["elem_bytes"]
        L.append(f'    for (size_t _i = 0; _i < m * n; _i++) {{')
        L.append(f'      size_t _off = _i * {eb};')
        L.append(f'      std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_off, {eb*8}));')
        L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_off, {eb*8}));')
        L.append(f'      if (_ns != _rs) {{ fi = _i; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')
        return L
    if spec.is_vlut:
        out0 = output_bufs[0]
        L.append(f'    for (size_t _i = 0; _i < n; _i++) {{')
        L.append(f'      std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar(_i, 8));')
        L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar(_i, 8));')
        L.append(f'      if (_ns != _rs) {{ fi = _i; fail_buf = "{out0.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')
        return L
    if spec.is_reduce:
        n_out = spec.profile.reduce.get("n_outputs", 1) if spec.profile and spec.profile.reduce else 1
        out0 = output_bufs[0]
        eb = out0.elem_type.byte_size or 4
        for i in range(n_out):
            L.append(f'    {{ std::string _ns = ctx.value_str(sym_{out0.arg_name}_neon.loadScalar({i * eb}, {eb*8}));')
            L.append(f'      std::string _rs = ctx.value_str(sym_{out0.arg_name}_rvv .loadScalar({i * eb}, {eb*8}));')
            L.append(f'      if (_ns != _rs) {{ fi = {i}; fail_buf = "{out0.arg_name}"; goto found_mismatch; }} }}')
        return L
    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        if spec.is_gemm:
            g = spec.profile.gemm; tile_n = g["weight_tile_n"]; eb = g["elem_bytes"]
        elif spec.is_gemm_qc4w:
            g = spec.profile.gemm_qc4w; tile_n = g["weight_tile_n"]; eb = g["elem_bytes"]
        else:
            g = spec.profile.igemm; tile_n = g["nr"]; eb = g["elem_bytes"]
        for ob in output_bufs:
            L.append(f'    for (size_t _m = 0; _m < mr; _m++) {{')
            L.append(f'      size_t _mof = _m * cm_stride;')
            L.append(f'      for (size_t _n = 0; _n < nc; _n++) {{')
            L.append(f'        size_t _off = _mof + (_n / {tile_n}) * cn_stride + (_n % {tile_n}) * {eb};')
            L.append(f'        std::string _n_s = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_off, {eb*8}));')
            L.append(f'        std::string _r_s = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_off, {eb*8}));')
            L.append(f'        if (_n_s != _r_s) {{ fi = _m * nc + _n; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'      }}')
            L.append(f'    }}')
        return L
    if spec.is_spatial:
        spatial_sd = _spatial_sd(spec)
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    for (size_t _c = 0; _c < {spatial_sd}; _c++) {{')
            L.append(f'      size_t _cof = _c * output_channel_stride_bytes;')
            L.append(f'      for (size_t _y = 0; _y < {ba}; _y++) {{')
            L.append(f'        size_t _yof = _cof + _y * output_height_stride_bytes;')
            L.append(f'        for (size_t _x = 0; _x < output_width; _x++) {{')
            L.append(f'          size_t _off = _yof + _x * {obe};')
            L.append(f'          std::string _n  = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_off, {obe*8}));')
            L.append(f'          std::string _r2 = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_off, {obe*8}));')
            L.append(f'          if (_n != _r2) {{ fi = (_c * {ba} + _y) * output_width + _x; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'        }}')
            L.append(f'      }}')
            L.append(f'    }}')
    elif spec.is_2d:
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    for (size_t _r = 0; _r < {ba}; _r++) {{')
            L.append(f'      size_t _roff = _r * padded_row_bytes;')
            L.append(f'      for (size_t _c = 0; _c < num_elems_per_row; _c++) {{')
            L.append(f'        std::string _n  = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_roff + _c * {obe}, {obe*8}));')
            L.append(f'        std::string _r2 = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_roff + _c * {obe}, {obe*8}));')
            L.append(f'        if (_n != _r2) {{ fi = _r * num_elems_per_row + _c; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'      }}')
            L.append(f'    }}')
    else:
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            scan_n = f"({ba} * {ob.layout.planes})" if ob.layout.planes > 1 else ba
            L.append(f'    for (size_t _i = 0; _i < {scan_n}; _i++) {{')
            L.append(f'        std::string _n = ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_i * {obe}, {obe*8}));')
            L.append(f'        std::string _r = ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_i * {obe}, {obe*8}));')
            L.append(f'        if (_n != _r) {{ fi = _i; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'    }}')
    return L


def _emit_counterexample_payload(spec: HarnessSpec, input_bufs: list,
                                  output_bufs: list, ba: str) -> list:
    """Site 4: print symbolic input values + neon/rvv outputs at fail_index."""
    L = []
    if spec.is_transpose:
        # Print every input element of the bw×bh block, then the failing output.
        eb = spec.profile.transpose["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _c = 0; _c < block_height; _c++) {{')
            L.append(f'      for (size_t _r = 0; _r < block_width; _r++) {{')
            L.append(f'        size_t _off = _c * input_stride + _r * {be};')
            L.append(f'        printf("%s%s", (_c==0 && _r==0) ? "" : ",",')
            L.append(f'               ctx.value_str(sym_{buf.arg_name}.loadScalar(_off, {be*8})).c_str());')
            L.append(f'      }}')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _fr = fi / block_height;')
            L.append(f'        size_t _fc = fi % block_height;')
            L.append(f'        size_t _foff = _fr * output_stride + _fc * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_pool or spec.is_bilinear or spec.is_dwconv:
        # Print indirect-row grid + failing output position.
        if spec.is_pool:
            eb = spec.profile.pool["elem_bytes"]; n_rows_expr = "kernel_elements"
        elif spec.is_bilinear:
            eb = spec.profile.bilinear["elem_bytes"]; n_rows_expr = "(output_pixels * 4)"
        else:
            eb = spec.profile.dwconv["elem_bytes"]
            ks = spec.profile.dwconv["kernel_size"]
            n_rows_expr = f"(output_width * {ks})"
        for buf in input_bufs:
            if buf.role != ArgRole.INDIRECT_INPUT:
                continue
            be = buf.elem_type.byte_size or eb
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _k = 0; _k < {n_rows_expr}; _k++) {{')
            L.append(f'      auto& _row = ctx.findBuffer({buf.arg_name}_rows[_k].data());')
            L.append(f'      for (size_t _c = 0; _c < channels; _c++) {{')
            L.append(f'        bool _first = (_k == 0 && _c == 0);')
            L.append(f'        printf("%s%s", _first ? "" : ",",')
            L.append(f'               ctx.value_str(_row.loadScalar(_c * {be}, {be*8})).c_str());')
            L.append(f'      }}')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _fp = fi / channels;')
            L.append(f'        size_t _fc = fi % channels;')
            L.append(f'        size_t _foff = _fp * (channels * {obe}) + _fc * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_reduce_2d:
        eb = spec.profile.reduce_2d["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _r = 0; _r < rows; _r++) {{')
            L.append(f'      for (size_t _c = 0; _c < channels; _c++) {{')
            L.append(f'        bool _first = (_r == 0 && _c == 0);')
            L.append(f'        size_t _off = _r * channel_bytes + _c * {be};')
            L.append(f'        printf("%s%s", _first ? "" : ",",')
            L.append(f'               ctx.value_str(sym_{buf.arg_name}.loadScalar(_off, {be*8})).c_str());')
            L.append(f'      }}')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_pack_w:
        eb = spec.profile.pack_w["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            n_elems = "(nc * kc)" if buf.arg_name == "weights" else "nc"
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < {n_elems}; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_zip_2:
        eb = spec.profile.zip_2["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < n; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_vlut:
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < n; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i, 8)).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(fi, 8)).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(fi, 8)).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_outer_product:
        eb = spec.profile.outer_product["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            n_elems = "m" if buf.arg_name == "a" else "n"
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < {n_elems}; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_split_2:
        eb = spec.profile.split_2["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < na + nb; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_concat2:
        eb = spec.profile.concat2["elem_bytes"]
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or eb
            n_elems = "na" if buf.arg_name == "a" else "nb"
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < {n_elems}; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_gemm_group:
        eb = spec.profile.gemm_group["elem_bytes"]
        for buf in input_bufs:
            if buf.role not in (ArgRole.INPUT_ARRAY, ArgRole.WEIGHTS):
                continue
            be = buf.elem_type.byte_size or eb
            n_elems = ("(g * mr * kc)" if buf.arg_name == "a"
                       else "(g * kc * nc)" if buf.arg_name == "w"
                       else "0")
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < {n_elems}; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_prelu:
        eb = spec.profile.prelu["elem_bytes"]
        for buf in input_bufs:
            be = buf.elem_type.byte_size or eb
            if buf.arg_name == "x":
                L.append(f'    printf("\\"x\\":[");')
                L.append(f'    for (size_t _r = 0; _r < rows; _r++) {{')
                L.append(f'      for (size_t _c = 0; _c < channels; _c++) {{')
                L.append(f'        bool _first = (_r == 0 && _c == 0);')
                L.append(f'        size_t _off = _r * channel_bytes + _c * {be};')
                L.append(f'        printf("%s%s", _first ? "" : ",",')
                L.append(f'               ctx.value_str(sym_{buf.arg_name}.loadScalar(_off, {be*8})).c_str());')
                L.append(f'      }}')
                L.append(f'    }}')
                L.append(f'    printf("],");')
            elif buf.arg_name == "w":
                L.append(f'    printf("\\"w\\":[");')
                L.append(f'    for (size_t _c = 0; _c < channels; _c++) {{')
                L.append(f'      printf("%s%s", _c ? "," : "",')
                L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_c * {be}, {be*8})).c_str());')
                L.append(f'    }}')
                L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or eb
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _fr = fi / channels;')
            L.append(f'        size_t _fc = fi % channels;')
            L.append(f'        size_t _foff = _fr * channel_bytes + _fc * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_reduce:
        # Print every input lane (small in REDUCE_1D — typically ≤17) plus the
        # failing output slot's neon/rvv values.
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or 4
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    for (size_t _i = 0; _i < {ba}; _i++) {{')
            L.append(f'      printf("%s%s", _i ? "," : "",')
            L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
            L.append(f'    }}')
            L.append(f'    printf("],");')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 4
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _foff = fi * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv .loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        # fi is the logical (m * nc + n) index from the witness scan.
        if spec.is_gemm:
            g = spec.profile.gemm; tile_n = g["weight_tile_n"]; eb = g["elem_bytes"]
        elif spec.is_gemm_qc4w:
            g = spec.profile.gemm_qc4w; tile_n = g["weight_tile_n"]; eb = g["elem_bytes"]
        else:
            g = spec.profile.igemm; tile_n = g["nr"]; eb = g["elem_bytes"]
            ks = g["ks"]
        for buf in input_bufs:
            be = buf.elem_type.byte_size or 1
            if spec.is_igemm and buf.role == ArgRole.INDIRECT_INPUT:
                # Print all mr*ks rows × kc elements of indirect `a`.
                L.append(f'    printf("\\"{buf.arg_name}\\":[");')
                L.append(f'    for (size_t _k = 0; _k < mr * {ks}; _k++) {{')
                L.append(f'      auto& _row = ctx.findBuffer({buf.arg_name}_rows[_k].data());')
                L.append(f'      for (size_t _i = 0; _i < kc; _i++) {{')
                L.append(f'        bool _first = (_k == 0 && _i == 0);')
                L.append(f'        printf("%s%s", _first ? "" : ",",')
                L.append(f'               ctx.value_str(_row.loadScalar(_i * {be}, {be*8})).c_str());')
                L.append(f'      }}')
                L.append(f'    }}')
                L.append(f'    printf("],");')
            elif buf.role == ArgRole.INPUT_ARRAY:
                # Direct GEMM: print first kc elements of `a`.
                L.append(f'    printf("\\"{buf.arg_name}_first_kc\\":[");')
                L.append(f'    for (size_t _i = 0; _i < kc; _i++) {{')
                L.append(f'      printf("%s%s", _i ? "," : "",')
                L.append(f'             ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {be*8})).c_str());')
                L.append(f'    }}')
                L.append(f'    printf("],");')
        for ob in output_bufs:
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'      size_t _fm = fi / nc, _fn = fi % nc;')
            L.append(f'      size_t _foff = _fm * cm_stride + (_fn / {tile_n}) * cn_stride + (_fn % {tile_n}) * {eb};')
            L.append(f'      printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'             ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {eb*8})).c_str(),')
            L.append(f'             ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_foff, {eb*8})).c_str());')
            L.append(f'    }}')
        return L
    if spec.is_spatial:
        spatial_sd = _spatial_sd(spec)
        for buf in input_bufs:
            if buf.role != ArgRole.INPUT_ARRAY:
                continue
            be = buf.elem_type.byte_size or 1
            bits = be * 8
            L.append(f'    printf("\\"{buf.arg_name}\\":[");')
            L.append(f'    {{ size_t _n = ({buf.size_expr}) / {be};')
            L.append(f'      for (size_t _i = 0; _i < _n; _i++) {{')
            L.append(f'        printf("%s%s", _i ? "," : "",')
            L.append(f'               ctx.value_str(sym_{buf.arg_name}.loadScalar(_i * {be}, {bits})).c_str());')
            L.append(f'      }}')
            L.append(f'    }}')
            L.append(f'    printf("],");')
            L.append(f'    printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(0, {bits})).c_str());')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _fc = fi / ({ba} * output_width);')
            L.append(f'        size_t _fr = (fi / output_width) % {ba};')
            L.append(f'        size_t _fx = fi % output_width;')
            L.append(f'        size_t _foff = _fc * output_channel_stride_bytes + _fr * output_height_stride_bytes + _fx * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
    elif spec.is_2d:
        for buf in input_bufs:
            be = buf.elem_type.byte_size or 1
            if buf.role == ArgRole.INPUT_SCALAR:
                L.append(f'    printf("\\"{buf.arg_name}\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(0, {be*8})).c_str());')
            else:
                L.append(f'    {{ size_t _fr = fi / num_elems_per_row; size_t _fc = fi % num_elems_per_row;')
                L.append(f'      size_t _foff = _fr * padded_row_bytes + _fc * {be};')
                L.append(f'      printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.value_str(sym_{buf.arg_name}.loadScalar(_foff, {be*8})).c_str()); }}')
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        size_t _fr = fi / num_elems_per_row; size_t _fc = fi % num_elems_per_row;')
            L.append(f'        size_t _foff = _fr * padded_row_bytes + _fc * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).c_str(),')
            L.append(f'               ctx.value_str(sym_{ob.arg_name}_rvv.loadScalar(_foff, {obe*8})).c_str());')
            L.append(f'    }}')
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
    return L


def _emit_outer_sweep_setup(spec: HarnessSpec) -> list:
    """Site 5: per-shape sweep array for the secondary dim. Empty for FLAT_1D."""
    L = []
    if spec.is_reduce:
        # Single-dim fixture array — sweep values come straight from profile.reduce.
        d = spec.shape_plan.sweep_dims[0]
        vals_str = ", ".join(str(v) for v in (d.values or []))
        L.append(f"    size_t {d.name}_sizes[] = {{{vals_str}}};")
        L.append(f"    size_t num_{d.name}_sizes = sizeof({d.name}_sizes) / sizeof({d.name}_sizes[0]);")
        L.append("")
        return L
    if spec.is_transpose:
        # Two PAIRED arrays (not cross product) — index N picks (bw[N], bh[N]).
        bw_dim, bh_dim = spec.shape_plan.sweep_dims[0], spec.shape_plan.sweep_dims[1]
        bw_str = ", ".join(str(v) for v in (bw_dim.values or []))
        bh_str = ", ".join(str(v) for v in (bh_dim.values or []))
        L.append(f"    size_t block_width_sizes[]  = {{{bw_str}}};")
        L.append(f"    size_t block_height_sizes[] = {{{bh_str}}};")
        L.append(f"    size_t num_blocks = sizeof(block_width_sizes) / sizeof(block_width_sizes[0]);")
        L.append("")
        return L
    if (spec.is_pool or spec.is_bilinear or spec.is_dwconv
            or spec.is_reduce_2d or spec.is_pack_w or spec.is_prelu
            or spec.is_gemm_group or spec.is_concat2 or spec.is_zip_2
            or spec.is_split_2 or spec.is_outer_product or spec.is_vlut):
        # POOL: 3 dims; GEMM_GROUP: 4 dims; ZIP_2/VLUT: 1 dim; others: 2 dims.
        for d in spec.shape_plan.sweep_dims:
            vals_str = ", ".join(str(v) for v in (d.values or []))
            L.append(f"    size_t {d.name}_sizes[] = {{{vals_str}}};")
            L.append(f"    size_t num_{d.name}_sizes = sizeof({d.name}_sizes) / sizeof({d.name}_sizes[0]);")
        L.append("")
        return L
    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        # Three independent fixture arrays — verifier iterates the cross-product.
        for d in spec.shape_plan.sweep_dims:
            vals_str = ", ".join(str(v) for v in (d.values or []))
            L.append(f"    size_t {d.name}_sizes[] = {{{vals_str}}};")
            L.append(f"    size_t num_{d.name}_sizes = sizeof({d.name}_sizes) / sizeof({d.name}_sizes[0]);")
        L.append("")
        return L
    if spec.is_2d:
        sd = spec.secondary_dim
        sweep = spec.profile.channel_sweep if spec.profile and spec.profile.channel_sweep else [16]
        dual = spec.profile.dual_weight_layout if spec.profile else None
        has_expr = any(isinstance(v, str) for v in sweep)
        if has_expr and dual:
            L.append(f"    size_t _vlmax = {dual['rvv_tile_expr']};")
        sweep_str = ", ".join(str(v) for v in sweep)
        L.append(f"    size_t {sd}_sizes[] = {{{sweep_str}}};")
        L.append(f"    size_t num_{sd}_sizes = sizeof({sd}_sizes) / sizeof({sd}_sizes[0]);")
        L.append("")
    elif spec.is_spatial:
        spatial_sd = _spatial_sd(spec)
        vals = spec.shape_plan.sweep_dims[1].values or [4, 8]
        sweep_str = ", ".join(str(v) for v in vals)
        L.append(f"    size_t {spatial_sd}_sizes[] = {{{sweep_str}}};")
        L.append(f"    size_t num_{spatial_sd}_sizes = sizeof({spatial_sd}_sizes) / sizeof({spatial_sd}_sizes[0]);")
        L.append("")
    return L


def _emit_params_setup(spec: HarnessSpec, configs: list) -> list:
    """Site 6: param struct init — sweep (multi) or single, or none."""
    L = []
    if not spec.params_type:
        return L
    num_configs = len(configs)
    if num_configs > 1:
        for idx, (cfg_name, cfg_init) in enumerate(configs):
            L.append(f"    // {cfg_name}")
            L.append(f"    {spec.params_type} params_{idx}{{}};")
            if cfg_init.strip():
                for init_line in cfg_init.strip().split("\n"):
                    L.append(f"    {init_line.lstrip().replace('params.', f'params_{idx}.')}")
            else:
                L.append(f"    memset(&params_{idx}, 0, sizeof(params_{idx}));")
        L.append("")
        ptrs = ", ".join(f"&params_{i}" for i in range(num_configs))
        names = ", ".join(f'"{cfg_name}"' for cfg_name, _ in configs)
        L.append(f"    const {spec.params_type}* _params_list[] = {{{ptrs}}};")
        L.append(f"    const char* _config_names[] = {{{names}}};")
        L.append(f"    const int _num_configs = {num_configs};")
        L.append("")
    else:
        cfg_name, cfg_init = configs[0]
        L.append(f"    {spec.params_type} params{{}};")
        if cfg_init.strip():
            for init_line in cfg_init.strip().split("\n"):
                L.append(f"    {init_line.lstrip()}")
        else:
            L.append("    memset(&params, 0, sizeof(params));")
        L.append("")
    return L


def _emit_outer_loop_open(spec: HarnessSpec) -> list:
    """Site 7: outer for-loop wrapping the secondary dim sweep."""
    L = []
    if spec.is_reduce:
        d = spec.shape_plan.sweep_dims[0]
        L.append(f"  for (size_t _{d.name}i = 0; _{d.name}i < num_{d.name}_sizes; _{d.name}i++) {{")
        L.append(f"    size_t {d.name} = {d.name}_sizes[_{d.name}i];")
        return L
    if spec.is_transpose:
        # One outer loop, paired indexing into both arrays.
        L.append(f"  for (size_t _bi = 0; _bi < num_blocks; _bi++) {{")
        L.append(f"    size_t block_width  = block_width_sizes[_bi];")
        L.append(f"    size_t block_height = block_height_sizes[_bi];")
        return L
    if (spec.is_pool or spec.is_bilinear or spec.is_dwconv
            or spec.is_reduce_2d or spec.is_pack_w or spec.is_prelu
            or spec.is_gemm_group or spec.is_concat2 or spec.is_zip_2
            or spec.is_split_2 or spec.is_outer_product or spec.is_vlut):
        # Nested cross product — POOL has 3 dims; GEMM_GROUP has 4; ZIP_2/VLUT have 1.
        for d in spec.shape_plan.sweep_dims:
            n = d.name
            L.append(f"  for (size_t _{n}i = 0; _{n}i < num_{n}_sizes; _{n}i++) {{")
            L.append(f"    size_t {n} = {n}_sizes[_{n}i];")
        return L
    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        # Triple-nested fixture iteration. Closed by _emit_main with one `}}`
        # per opened loop.
        for d in spec.shape_plan.sweep_dims:
            n = d.name
            L.append(f"  for (size_t _{n}i = 0; _{n}i < num_{n}_sizes; _{n}i++) {{")
            L.append(f"    size_t {n} = {n}_sizes[_{n}i];")
        return L
    if spec.is_2d:
        sd = spec.secondary_dim
        L.append(f"  for (size_t _ci = 0; _ci < num_{sd}_sizes; _ci++) {{")
        L.append(f"    size_t {sd} = {sd}_sizes[_ci];")
    elif spec.is_spatial:
        spatial_sd = _spatial_sd(spec)
        L.append(f"  for (size_t _ci = 0; _ci < num_{spatial_sd}_sizes; _ci++) {{")
        L.append(f"    size_t {spatial_sd} = {spatial_sd}_sizes[_ci];")
    return L


def _emit_verify_call_block(spec: HarnessSpec, configs: list) -> list:
    """Site 8: per-batch verify() call + timing + per-batch timeout check."""
    L = []
    has_params = bool(spec.params_type)
    num_configs = len(configs)

    if spec.is_bilinear:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_ch%zu_op%zu", channels, output_pixels);')
        if has_params:
            vcall = 'verify(channels, output_pixels, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(channels, output_pixels, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('channels', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_dwconv:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_ch%zu_ow%zu", channels, output_width);')
        if has_params:
            vcall = 'verify(channels, output_width, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(channels, output_width, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('channels', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_reduce_2d:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_ch%zu_rows%zu", channels, rows);')
        if has_params:
            vcall = 'verify(channels, rows, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(channels, rows, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('channels', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_pack_w:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_nc%zu_kc%zu", nc, kc);')
        if has_params:
            vcall = 'verify(nc, kc, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(nc, kc, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('nc', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_prelu:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_ch%zu_rows%zu", channels, rows);')
        if has_params:
            vcall = 'verify(channels, rows, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(channels, rows, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('channels', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_gemm_group:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_g%zu_mr%zu_nc%zu_kc%zu", g, mr, nc, kc);')
        if has_params:
            vcall = 'verify(g, mr, nc, kc, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(g, mr, nc, kc, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('g', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_concat2:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_na%zu_nb%zu", na, nb);')
        if has_params:
            vcall = 'verify(na, nb, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(na, nb, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('na', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_zip_2:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_n%zu", n);')
        if has_params:
            vcall = 'verify(n, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(n, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('n', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_split_2:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_na%zu_nb%zu", na, nb);')
        if has_params:
            vcall = 'verify(na, nb, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(na, nb, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('na', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_outer_product:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_m%zu_n%zu", m, n);')
        if has_params:
            vcall = 'verify(m, n, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(m, n, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('m', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_vlut:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_n%zu", n);')
        if has_params:
            vcall = 'verify(n, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(n, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('n', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_pool:
        if has_params and num_configs > 1:
            L.append(f"        for (int _cfg = 0; _cfg < _num_configs; _cfg++) {{")
            L.append(f'            char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "%s_ch%zu_op%zu_ke%zu", _config_names[_cfg], channels, output_pixels, kernel_elements);')
            vcall = 'verify(channels, output_pixels, kernel_elements, vlen, *_params_list[_cfg], _cfgbuf)'
            L.append(f"            auto t0 = std::chrono::steady_clock::now();")
            L.append(f"            bool ok = {vcall};")
            L.append(f"            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
            L.append(f"            if (!ok) return 1;")
            L.append(f"            if (timeout > 0 && secs > timeout) {{")
            L.append(f"                {_emit_wall_timeout('channels', 'secs', '_cfgbuf')}")
            L.append(f"                return 0;")
            L.append(f"            }}")
            L.append(f"        }}")
            return L

        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[80]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_ch%zu_op%zu_ke%zu", channels, output_pixels, kernel_elements);')
        if has_params:
            vcall = 'verify(channels, output_pixels, kernel_elements, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(channels, output_pixels, kernel_elements, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('channels', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_transpose:
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_bw%zu_bh%zu", block_width, block_height);')
        if has_params:
            vcall = 'verify(block_width, block_height, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(block_width, block_height, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('block_width', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_reduce:
        # REDUCE_1D: verify(batch, vlen, [params,] config_id).
        # Multi-config: iterate _params_list (built by _emit_params_setup).
        d_name = spec.shape_plan.sweep_dims[0].name
        if has_params and num_configs > 1:
            L.append(f"        for (int _cfg = 0; _cfg < _num_configs; _cfg++) {{")
            L.append(f'            char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "%s_{d_name}%zu", _config_names[_cfg], {d_name});')
            vcall = f'verify({d_name}, vlen, *_params_list[_cfg], _cfgbuf)'
            L.append(f"            auto t0 = std::chrono::steady_clock::now();")
            L.append(f"            bool ok = {vcall};")
            L.append(f"            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
            L.append(f"            if (!ok) return 1;")
            L.append(f"            if (timeout > 0 && secs > timeout) {{")
            L.append(f"                {_emit_wall_timeout(d_name, 'secs', '_cfgbuf')}")
            L.append(f"                return 0;")
            L.append(f"            }}")
            L.append(f"        }}")
            return L
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_{d_name}%zu", {d_name});')
        if has_params:
            vcall = f'verify({d_name}, vlen, params, _cfgbuf)'
        else:
            vcall = f'verify({d_name}, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout(d_name, 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    if spec.is_gemm or spec.is_igemm or spec.is_gemm_qc4w:
        # GEMM/IGEMM call: verify(mr, nc, kc, vlen, [params,] config_id)
        cfg_name = configs[0][0] if configs else "default"
        L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_mr%zu_nc%zu_kc%zu", mr, nc, kc);')
        if has_params:
            vcall = 'verify(mr, nc, kc, vlen, params, _cfgbuf)'
        else:
            vcall = 'verify(mr, nc, kc, vlen, _cfgbuf)'
        L.append(f"        auto t0 = std::chrono::steady_clock::now();")
        L.append(f"        bool ok = {vcall};")
        L.append(f"        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"        if (!ok) return 1;")
        L.append(f"        if (timeout > 0 && secs > timeout) {{")
        L.append(f"            {_emit_wall_timeout('mr', 'secs', '_cfgbuf')}")
        L.append(f"            return 0;")
        L.append(f"        }}")
        return L

    ba = spec.sweep_arg
    spatial_sd = _spatial_sd(spec)
    outer_dim = (spec.secondary_dim if spec.is_2d
                 else spatial_sd if spec.is_spatial else "")
    two_dim = spec.is_2d or spec.is_spatial

    if has_params and num_configs > 1:
        L.append(f"        for (int _cfg = 0; _cfg < _num_configs; _cfg++) {{")
        if two_dim:
            L.append(f'            char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "%s_{outer_dim}%zu", _config_names[_cfg], {outer_dim});')
            vcall = f'verify({ba}, {outer_dim}, vlen, *_params_list[_cfg], _cfgbuf)'
        else:
            vcall = f'verify({ba}, vlen, *_params_list[_cfg], _config_names[_cfg])'
        L.append(f"            auto t0 = std::chrono::steady_clock::now();")
        L.append(f"            bool ok = {vcall};")
        L.append(f"            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"            if (!ok) return 1;")
        L.append(f"            if (timeout > 0 && secs > timeout) {{")
        cfg_id = '_cfgbuf' if two_dim else '_config_names[_cfg]'
        L.append(f"                {_emit_wall_timeout(ba, 'secs', cfg_id)}")
        L.append(f"                return 0;")
        L.append(f"            }}")
        L.append(f"        }}")
    else:
        cfg_name = configs[0][0] if configs else "default"
        if two_dim:
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
        cfg_id = '_cfgbuf' if two_dim else f'"{cfg_name}"'
        L.append(f"            {_emit_wall_timeout(ba, 'secs', cfg_id)}")
        L.append(f"            return 0;")
        L.append(f"        }}")
    return L


def _emit_main(spec: HarnessSpec, configs: list[tuple[str, str]]) -> str:
    """main() — for each batch size, run all configs (interleaved for early bug discovery)."""
    num_configs = len(configs)

    L = []
    L.append("")
    L.append("int main(int argc, char** argv) {")
    L.append("    setvbuf(stdout, NULL, _IOLBF, 0);")
    if (spec.is_gemm or spec.is_reduce or spec.is_transpose
            or spec.is_pool or spec.is_bilinear or spec.is_dwconv
            or spec.is_igemm or spec.is_reduce_2d or spec.is_pack_w
            or spec.is_prelu or spec.is_gemm_group or spec.is_concat2
            or spec.is_zip_2 or spec.is_split_2 or spec.is_outer_product
            or spec.is_gemm_qc4w or spec.is_vlut):
        # Fixture-driven shapes: fixtures replace start/end, but accept the
        # same arg layout as non-GEMM kernels (`<start> <end> [vlen] [timeout]`)
        # so the orchestrator's invocation works unchanged.
        L.append('    if (argc < 3) { fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout]\\n", argv[0]); return 2; }')
        L.append("    (void)atoi(argv[1]);  // start — ignored, fixtures drive sweep")
        L.append("    (void)atoi(argv[2]);  // end   — ignored")
        L.append(f"    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : {spec.vlen};")
        L.append("    double timeout = (argc > 4) ? atof(argv[4]) : 0;")
    else:
        L.append('    if (argc < 3) { fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout]\\n", argv[0]); return 2; }')
        L.append("    size_t start = (size_t)atoi(argv[1]);")
        L.append("    size_t end   = (size_t)atoi(argv[2]);")
        L.append(f"    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : {spec.vlen};")
        L.append("    double timeout = (argc > 4) ? atof(argv[4]) : 0;")
    L.append("")
    L.extend(_emit_outer_sweep_setup(spec))
    L.extend(_emit_params_setup(spec, configs))
    L.extend(_emit_outer_loop_open(spec))
    if (spec.is_gemm or spec.is_reduce or spec.is_transpose
            or spec.is_pool or spec.is_bilinear or spec.is_dwconv
            or spec.is_igemm or spec.is_reduce_2d or spec.is_pack_w
            or spec.is_prelu or spec.is_gemm_group or spec.is_concat2
            or spec.is_zip_2 or spec.is_split_2 or spec.is_outer_product
            or spec.is_gemm_qc4w or spec.is_vlut):
        # The fixture-driven loop(s) opened by _emit_outer_loop_open need
        # closing.  Multi-dim shapes open one `{` per sweep dim (cross product);
        # REDUCE_1D/TRANSPOSE_2D/ZIP_2/VLUT open one.
        L.extend(_emit_verify_call_block(spec, configs))
        n_loops = (len(spec.shape_plan.sweep_dims)
                   if (spec.is_gemm or spec.is_pool or spec.is_bilinear
                       or spec.is_dwconv or spec.is_igemm
                       or spec.is_reduce_2d or spec.is_pack_w
                       or spec.is_prelu or spec.is_gemm_group
                       or spec.is_concat2 or spec.is_zip_2
                       or spec.is_split_2 or spec.is_outer_product
                       or spec.is_gemm_qc4w or spec.is_vlut) else 1)
        for _ in range(n_loops):
            L.append("  }")
        # Use first/last fixture of the outermost dim as start/end strings for
        # the all-verified message.
        outer = spec.shape_plan.sweep_dims[0]
        first = outer.values[0] if outer.values else 1
        last  = outer.values[-1] if outer.values else 1
        L.append(f"    {_emit_all_verified(str(first), str(last), num_configs)}")
        L.append("    return 0;")
        L.append("}")
        L.append("")
        return "\n".join(L)
    ba = spec.sweep_arg
    L.append(f"    for (size_t {ba} = start; {ba} <= end; {ba}++) {{")
    L.extend(_emit_verify_call_block(spec, configs))
    L.append(f"    }}")
    if spec.is_2d or spec.is_spatial:
        L.append(f"  }}")
    L.append(f"    {_emit_all_verified('start', 'end', num_configs)}")
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
