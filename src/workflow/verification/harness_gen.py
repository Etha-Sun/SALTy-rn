"""
C++ verification harness generator.

Takes a HarnessSpec (from sig_parser + size_inferrer) and generates
a complete C++ file that runs both kernels symbolically and compares outputs.
"""

import logging
from pathlib import Path

from .sig_parser import ArgRole, parse_signature, classify_args, refine_with_source
from .size_inferrer import HarnessSpec, BufferSpec, infer_buffer_sizes, resolve_unknown_sizes_with_llm
from .param_configs import generate_configs, config_to_cpp

log = logging.getLogger("pipeline")


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

def generate_harness_from_files(neon_path: str, rvv_path: str,
                                 kernel_name: str = "",
                                 params_init: str = "",
                                 param_configs: list[tuple[str, str]] = None,
                                 vlen: int = 256,
                                 llm_client=None) -> str:
    """End-to-end: parse → validate → infer → generate.

    param_configs: list of (config_name, init_code) pairs. If provided,
                   overrides params_init. If neither is provided and the kernel
                   has params, auto-generates edge-case configs.
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

    # Build param configs
    if param_configs is None:
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
    return _generate(spec, neon_source, rvv_source, param_configs)


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
              configs: list[tuple[str, str]]) -> str:
    """Assemble the complete C++ harness."""
    # Validate spec
    unknown = [b for b in spec.buffers if b.size_expr == "UNKNOWN"]
    if unknown:
        raise ValueError(f"Unknown buffer sizes: {[b.arg_name for b in unknown]}")

    output_bufs = [b for b in spec.buffers if b.role == ArgRole.OUTPUT]
    if not output_bufs:
        raise ValueError("No output buffers — cannot verify")

    parts = [
        _emit_header(),
        _emit_kernel("neon_kernel", neon_source, ["arm_neon.h"]),
        _emit_kernel("rvv_kernel", rvv_source, ["riscv_vector.h"]),
        _emit_verify(spec),
        _emit_main(spec, configs),
    ]
    return "\n".join(parts)


def _emit_header() -> str:
    return """// Auto-generated verification harness
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


def _emit_verify(spec: HarnessSpec) -> str:
    """Generate the verify() function."""
    output_bufs = [b for b in spec.buffers if b.role == ArgRole.OUTPUT]
    input_bufs = [b for b in spec.buffers if b.role in (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR)]

    out0 = output_bufs[0]
    eb = out0.elem_type.byte_size or 1
    ba = spec.batch_arg
    has_params = bool(spec.params_type)
    is_2d = spec.layout == "2D"
    sd = spec.secondary_dim  # e.g., "channels"

    L = []  # lines

    # Function signature — 2D kernels take channels as a parameter to allow sweeping
    if is_2d:
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

    # Declare scalar size args as local variables (skip secondary_dim for 2D — it's a parameter)
    for arg_name, arg_val in spec.scalar_args.items():
        if is_2d and arg_name == sd:
            continue  # already a function parameter
        elif is_2d and arg_name in ("input_stride", "output_stride"):
            # Use padded stride so each row has room for NEON tail over-reads
            L.append(f"    size_t {arg_name} = {sd} + 16;  // padded stride")
        else:
            L.append(f"    size_t {arg_name} = {arg_val};")

    if is_2d:
        # 2D: total elements = rows * (channels / elem_bytes)
        # Pad each row by 16 bytes (4 floats) so NEON tail over-reads don't segfault
        L.append(f"    size_t num_elems_per_row = {sd} / {eb};")
        L.append(f"    size_t total_elems = {ba} * num_elems_per_row;")
        L.append(f"    size_t total_bytes = total_elems * {eb};")
        pad = spec.profile.pad_bytes if spec.profile else 16
        L.append(f"    size_t padded_row_bytes = {sd} + {pad};  // pad for SIMD tail over-read")
        L.append(f"    size_t padded_total_elems = {ba} * (padded_row_bytes / {eb});")
    else:
        L.append(f"    size_t padded = (({ba} + 15) / 16) * 16 + 16;")
    L.append(f"")

    # Declare arrays and register buffers
    for buf in spec.buffers:
        L.extend(_emit_buffer_decl(buf, spec))
    L.append("")
    for buf in spec.buffers:
        L.extend(_emit_buffer_register(buf, spec))
    L.append("")

    # Call both kernels
    neon_args = _build_call_args(spec, "neon")
    rvv_args = _build_call_args(spec, "rvv")
    L.append(f"    neon_kernel::{spec.neon_func_name}({', '.join(neon_args)});")
    L.append(f"    rvv_kernel::{spec.rvv_func_name}({', '.join(rvv_args)});")
    L.append("")

    # Compare all outputs
    if is_2d:
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
        L.append(f"        equiv = ctx.tm.mk_term(Kind::AND, {lbrace}equiv, _row_eqs[_i]{rbrace});")
    else:
        cmp_count = ba
        if len(output_bufs) == 1:
            L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{out0.arg_name}_neon, sym_{out0.arg_name}_rvv,")
            L.append(f"                                {cmp_count}, {eb}, ElementKind::{spec.element_kind});")
        else:
            for i, ob in enumerate(output_bufs):
                obe = ob.elem_type.byte_size or 1
                ok = ob.elem_type.element_kind
                if i == 0:
                    L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {cmp_count}, {obe}, ElementKind::{ok});")
                else:
                    L.append(f"    equiv = ctx.tm.mk_term(Kind::AND, {{equiv, buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {cmp_count}, {obe}, ElementKind::{ok})}});")

    L.append(f"    ctx.solver->assert_formula(ctx.tm.mk_term(Kind::NOT, {{equiv}}));")
    L.append(f"    Result result = ctx.solver->check_sat();")
    L.append(f"")

    # UNSAT → verified
    L.append(f'    if (result == Result::UNSAT) {{')
    L.append(f'        printf("{{\\"status\\":\\"VERIFIED\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {ba}, vlen, config_id);')
    L.append(f'        return true;')
    L.append(f'    }}')
    L.append(f"")

    # SAT → counterexample
    L.append(f'    size_t fi = 0;')
    L.append(f'    const char* fail_buf = "";')

    if is_2d:
        lbrace, rbrace = "{", "}"
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    for (size_t _r = 0; _r < {ba}; _r++) {lbrace}')
            L.append(f'      size_t _roff = _r * padded_row_bytes;')
            L.append(f'      for (size_t _c = 0; _c < num_elems_per_row; _c++) {lbrace}')
            L.append(f'        Term _n = ctx.solver->get_value(sym_{ob.arg_name}_neon.loadScalar(_roff + _c * {obe}, {obe*8}));')
            L.append(f'        Term _r2 = ctx.solver->get_value(sym_{ob.arg_name}_rvv.loadScalar(_roff + _c * {obe}, {obe*8}));')
            L.append(f'        if (_n.value<std::string>(10) != _r2.value<std::string>(10)) {lbrace} fi = _r * num_elems_per_row + _c; fail_buf = "{ob.arg_name}"; goto found_mismatch; {rbrace}')
            L.append(f'      {rbrace}')
            L.append(f'    {rbrace}')
    else:
        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    for (size_t _i = 0; _i < {ba}; _i++) {{')
            L.append(f'        Term _n = ctx.solver->get_value(sym_{ob.arg_name}_neon.loadScalar(_i * {obe}, {obe*8}));')
            L.append(f'        Term _r = ctx.solver->get_value(sym_{ob.arg_name}_rvv.loadScalar(_i * {obe}, {obe*8}));')
            L.append(f'        if (_n.value<std::string>(10) != _r.value<std::string>(10)) {{ fi = _i; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
            L.append(f'    }}')

    L.append(f'    found_mismatch:')
    L.append(f'    printf("{{\\"status\\":\\"COUNTEREXAMPLE\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\",\\"fail_index\\":%zu,\\"fail_output\\":\\"%s\\",", {ba}, vlen, config_id, fi, fail_buf);')

    if is_2d:
        # Use strided offset for input/output value printing
        for buf in input_bufs:
            be = buf.elem_type.byte_size or 1
            if buf.role == ArgRole.INPUT_SCALAR:
                L.append(f'    printf("\\"{buf.arg_name}\\":%s,", ctx.solver->get_value(sym_{buf.arg_name}.loadScalar(0, {be*8})).value<std::string>(10).c_str());')
            else:
                L.append(f'    {lbrace} size_t _fr = fi / num_elems_per_row; size_t _fc = fi % num_elems_per_row;')
                L.append(f'      size_t _foff = _fr * padded_row_bytes + _fc * {be};')
                L.append(f'      printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.solver->get_value(sym_{buf.arg_name}.loadScalar(_foff, {be*8})).value<std::string>(10).c_str()); {rbrace}')

        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {lbrace}')
            L.append(f'        size_t _fr = fi / num_elems_per_row; size_t _fc = fi % num_elems_per_row;')
            L.append(f'        size_t _foff = _fr * padded_row_bytes + _fc * {obe};')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.solver->get_value(sym_{ob.arg_name}_neon.loadScalar(_foff, {obe*8})).value<std::string>(10).c_str(),')
            L.append(f'               ctx.solver->get_value(sym_{ob.arg_name}_rvv.loadScalar(_foff, {obe*8})).value<std::string>(10).c_str());')
            L.append(f'    {rbrace}')
    else:
        for buf in input_bufs:
            be = buf.elem_type.byte_size or 1
            if buf.role == ArgRole.INPUT_SCALAR:
                L.append(f'    printf("\\"{buf.arg_name}\\":%s,", ctx.solver->get_value(sym_{buf.arg_name}.loadScalar(0, {be*8})).value<std::string>(10).c_str());')
            else:
                L.append(f'    printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.solver->get_value(sym_{buf.arg_name}.loadScalar(fi * {be}, {be*8})).value<std::string>(10).c_str());')

        for ob in output_bufs:
            obe = ob.elem_type.byte_size or 1
            L.append(f'    if (std::string(fail_buf) == "{ob.arg_name}") {{')
            L.append(f'        printf("\\"neon_out\\":%s,\\"rvv_out\\":%s",')
            L.append(f'               ctx.solver->get_value(sym_{ob.arg_name}_neon.loadScalar(fi * {obe}, {obe*8})).value<std::string>(10).c_str(),')
            L.append(f'               ctx.solver->get_value(sym_{ob.arg_name}_rvv.loadScalar(fi * {obe}, {obe*8})).value<std::string>(10).c_str());')
            L.append(f'    }}')

    L.append(f'    printf("}}\\n");')
    L.append(f"    return false;")
    L.append(f"}}")
    return "\n".join(L)


def _emit_buffer_decl(buf: BufferSpec, spec: HarnessSpec = None) -> list[str]:
    """Emit C++ array declaration for a buffer."""
    ct = buf.elem_type.c_type or "uint8_t"
    n = buf.arg_name
    is_2d = spec and spec.layout == "2D"
    dual = spec and spec.profile and spec.profile.dual_weight_layout
    # For 2D, use padded_total_elems for allocation (includes over-read padding)
    # but total_elems for comparison
    alloc_count = "padded_total_elems" if is_2d else "padded"
    count = "total_elems" if is_2d else "padded"

    if buf.role == ArgRole.INPUT_SCALAR:
        return [f"    {ct} {n}_val = 0;"]
    elif buf.role == ArgRole.INPUT_ARRAY:
        return [f"    std::vector<{ct}> {n}_arr({alloc_count}, 0);"]
    elif buf.role == ArgRole.OUTPUT:
        return [f"    std::vector<{ct}> {n}_neon_arr({alloc_count}, 0);",
                f"    std::vector<{ct}> {n}_rvv_arr({alloc_count}, 0);"]
    elif buf.role == ArgRole.ZERO_BUFFER:
        return [f"    std::vector<{ct}> {n}_arr({count}, 0);"]
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
        return [f"    size_t {n}_nptrs = {buf.size_expr};",
                f"    std::vector<std::vector<{ct}>> {n}_rows({n}_nptrs, std::vector<{ct}>({count}));",
                f"    std::vector<const {ct}*> {n}_ptrs({n}_nptrs);",
                f"    for (size_t _r = 0; _r < {n}_nptrs; _r++) {n}_ptrs[_r] = {n}_rows[_r].data();"]
    return []


def _emit_buffer_register(buf: BufferSpec, spec: HarnessSpec = None) -> list[str]:
    """Emit symbolic buffer registration."""
    n = buf.arg_name
    eb = buf.elem_type.byte_size or 1
    is_2d = spec and spec.layout == "2D"
    # Use padded byte size for registration so over-reads don't go out of bounds
    padded_bytes = f"padded_total_elems * {eb}" if is_2d else f"padded * {eb}"

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
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {bytes_expr});",
                f"    sym_{n}.bind({n}_arr.data());"]
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
                lines.append(f"                ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL,")
                lines.append(f"                    {lbrace}sym_{n}_neon.loadScalar(_ns + _b, 8), sym_{n}_rvv.loadScalar(_rs + _b, 8){rbrace}));")
                lines.append(f"                ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL,")
                lines.append(f"                    {lbrace}sym_{n}_neon.loadScalar(_nb + _b, 8), sym_{n}_rvv.loadScalar(_rb + _b, 8){rbrace}));")
                lines.append(f"            {rbrace}")
                lines.append(f"        {rbrace}")
                # Zero-pad NEON tail
                lines.append(f"        size_t _tail = num_{sd}_elems % {neon_tile};")
                lines.append(f"        if (_tail != 0) {lbrace}")
                lines.append(f"            Term _z = ctx.tm.mk_bv_value_uint64(ctx.tm.mk_bv_sort(8), 0);")
                lines.append(f"            size_t _lt = num_{sd}_elems / {neon_tile};")
                lines.append(f"            for (size_t _lane = _tail; _lane < {neon_tile}; _lane++) {lbrace}")
                lines.append(f"                size_t _ps = (_lt * {neon_tile * 2} + _lane) * {eb};")
                lines.append(f"                size_t _pb = (_lt * {neon_tile * 2} + {neon_tile} + _lane) * {eb};")
                lines.append(f"                for (size_t _b = 0; _b < {eb}; _b++) {lbrace}")
                lines.append(f"                    ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL, {lbrace}sym_{n}_neon.loadScalar(_ps + _b, 8), _z{rbrace}));")
                lines.append(f"                    ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL, {lbrace}sym_{n}_neon.loadScalar(_pb + _b, 8), _z{rbrace}));")
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
                lines.append(f"        Term _cv = ctx.tm.mk_bv_value_uint64(ctx.tm.mk_bv_sort(8), ((uint8_t*){n}_neon_arr.data())[_i]);")
                lines.append(f"        ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL, {lbrace}_wb, _cv{rbrace}));")
                lines.append(f"    {rbrace}")
                lines.append(f"    auto& sym_{n}_rvv = ctx.registerBuffer(\"{n}_rvv\", {n}_rvv_size);")
                lines.append(f"    sym_{n}_rvv.bind({n}_rvv_arr.data());")
                lines.append(f"    for (size_t _i = 0; _i < {n}_rvv_size; _i++) {lbrace}")
                lines.append(f"        Term _wb = sym_{n}_rvv.loadScalar(_i, 8);")
                lines.append(f"        Term _cv = ctx.tm.mk_bv_value_uint64(ctx.tm.mk_bv_sort(8), ((uint8_t*){n}_rvv_arr.data())[_i]);")
                lines.append(f"        ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL, {lbrace}_wb, _cv{rbrace}));")
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
                    f"        Term _cval = ctx.tm.mk_bv_value_uint64(ctx.tm.mk_bv_sort(8), ((uint8_t*){n}_arr.data())[_i]);",
                    f"        ctx.solver->assert_formula(ctx.tm.mk_term(Kind::EQUAL, {lbrace}_wbyte, _cval{rbrace}));",
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
    is_2d = spec.layout == "2D"
    sd = spec.secondary_dim
    args = []
    for arg in spec.arg_order or []:
        name = arg["name"]
        role = arg["role"]

        if role == ArgRole.BATCH:
            args.append(spec.batch_arg)
        elif role == ArgRole.PARAMS:
            args.append("&params")
        elif role == ArgRole.SCALAR_SIZE and is_2d and name == sd:
            # 2D: channels is a function parameter, use the variable directly
            args.append(name)
        elif role == ArgRole.STRIDE and is_2d:
            # 2D: strides must match padded_row_bytes for consistent addressing
            args.append("padded_row_bytes")
        elif role in (ArgRole.SCALAR_SIZE, ArgRole.STRIDE):
            args.append(spec.scalar_args.get(name, "0"))
        elif role == ArgRole.INPUT_ARRAY:
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
    """Generate main() — loops over param configs, each running a batch sweep."""
    has_params = bool(spec.params_type)
    ba = spec.batch_arg
    is_2d = spec.layout == "2D"
    sd = spec.secondary_dim

    L = []
    L.append("")
    L.append("int main(int argc, char** argv) {")
    L.append('    if (argc < 3) { fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout]\\n", argv[0]); return 2; }')
    L.append("    size_t start = (size_t)atoi(argv[1]);")
    L.append("    size_t end   = (size_t)atoi(argv[2]);")
    L.append(f"    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : {spec.vlen};")
    L.append("    double timeout = (argc > 4) ? atof(argv[4]) : 0;")
    L.append("")

    if is_2d:
        sweep = spec.profile.channel_sweep if spec.profile and spec.profile.channel_sweep else [16]
        dual = spec.profile.dual_weight_layout if spec.profile else None
        # Emit _vlmax if any sweep entry is a string expression that needs it
        has_expr = any(isinstance(v, str) for v in sweep)
        if has_expr and dual:
            L.append(f"    size_t _vlmax = {dual['rvv_tile_expr']};")
        sweep_str = ", ".join(str(v) for v in sweep)
        L.append(f"    size_t {sd}_sizes[] = {{{sweep_str}}};")
        L.append(f"    size_t num_{sd}_sizes = sizeof({sd}_sizes) / sizeof({sd}_sizes[0]);")
        L.append("")

    for cfg_name, cfg_init in configs:
        L.append(f"    // --- {cfg_name} ---")
        L.append("    {")

        if has_params:
            L.append(f"        {spec.params_type} params{{}};")
            if cfg_init.strip():
                for init_line in cfg_init.strip().split("\n"):
                    L.append(f"        {init_line.lstrip()}")
            else:
                L.append("        memset(&params, 0, sizeof(params));")

        if is_2d:
            # Outer loop over channel sizes
            L.append(f"      for (size_t _ci = 0; _ci < num_{sd}_sizes; _ci++) {{")
            L.append(f"        size_t {sd} = {sd}_sizes[_ci];")
            # Build config id that includes channel size
            L.append(f'        char _cfgbuf[64]; snprintf(_cfgbuf, sizeof(_cfgbuf), "{cfg_name}_{sd}%zu", {sd});')
            if has_params:
                vcall = f'verify({ba}, {sd}, vlen, params, _cfgbuf)'
            else:
                vcall = f'verify({ba}, {sd}, vlen, _cfgbuf)'
        else:
            if has_params:
                vcall = f'verify({ba}, vlen, params, "{cfg_name}")'
            else:
                vcall = f'verify({ba}, vlen, "{cfg_name}")'

        L.append(f"        for (size_t {ba} = start; {ba} <= end; {ba}++) {{")
        L.append(f"            auto t0 = std::chrono::steady_clock::now();")
        L.append(f"            bool ok = {vcall};")
        L.append(f"            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"            if (!ok) return 1;")
        L.append(f"            if (timeout > 0 && secs > timeout) {{")
        cfg_id = '_cfgbuf' if is_2d else f'"{cfg_name}"'
        L.append(f'                printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"seconds\\":%.1f,\\"config\\":\\"%s\\"}}\\n", {ba}, secs, {cfg_id});')
        L.append(f"                break;")
        L.append(f"            }}")
        L.append(f"        }}")

        if is_2d:
            L.append(f"      }}")  # close channel sweep loop

        L.append("    }")
        L.append("")

    L.append(f'    printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":%zu,\\"end\\":%zu,\\"configs\\":%d}}\\n", start, end, {len(configs)});')
    L.append("    return 0;")
    L.append("}")
    L.append("")
    return "\n".join(L)
