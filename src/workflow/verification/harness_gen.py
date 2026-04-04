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
    return f"namespace {namespace} {{\n{cleaned}\n}} // namespace {namespace}\n"


def _emit_verify(spec: HarnessSpec) -> str:
    """Generate the verify() function."""
    output_bufs = [b for b in spec.buffers if b.role == ArgRole.OUTPUT]
    input_bufs = [b for b in spec.buffers if b.role in (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR)]
    other_bufs = [b for b in spec.buffers if b.role not in
                  (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR, ArgRole.OUTPUT)]

    out0 = output_bufs[0]
    eb = out0.elem_type.byte_size or 1
    ba = spec.batch_arg
    has_params = bool(spec.params_type)

    L = []  # lines

    # Function signature
    if has_params:
        L.append(f"bool verify(size_t {ba}, size_t vlen, const {spec.params_type}& params, const char* config_id) {{")
    else:
        L.append(f"bool verify(size_t {ba}, size_t vlen, const char* config_id) {{")

    L.append(f"    VerificationContext ctx(vlen);")
    L.append(f"    g_ctx = &ctx;")
    L.append(f"    size_t padded = (({ba} + 15) / 16) * 16 + 16;")
    L.append(f"")

    # Declare arrays and register buffers
    for buf in spec.buffers:
        L.extend(_emit_buffer_decl(buf))
    L.append("")
    for buf in spec.buffers:
        L.extend(_emit_buffer_register(buf))
    L.append("")

    # Call both kernels
    neon_args = _build_call_args(spec, "neon")
    rvv_args = _build_call_args(spec, "rvv")
    L.append(f"    neon_kernel::{spec.neon_func_name}({', '.join(neon_args)});")
    L.append(f"    rvv_kernel::{spec.rvv_func_name}({', '.join(rvv_args)});")
    L.append("")

    # Compare all outputs
    if len(output_bufs) == 1:
        L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{out0.arg_name}_neon, sym_{out0.arg_name}_rvv,")
        L.append(f"                                {ba}, {eb}, ElementKind::{spec.element_kind});")
    else:
        for i, ob in enumerate(output_bufs):
            obe = ob.elem_type.byte_size or 1
            ok = ob.elem_type.element_kind
            if i == 0:
                L.append(f"    Term equiv = buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {ba}, {obe}, ElementKind::{ok});")
            else:
                L.append(f"    equiv = ctx.tm.mk_term(Kind::AND, {{equiv, buffers_equal(ctx.tm, sym_{ob.arg_name}_neon, sym_{ob.arg_name}_rvv, {ba}, {obe}, ElementKind::{ok})}});")

    L.append(f"    ctx.solver->assert_formula(ctx.tm.mk_term(Kind::NOT, {{equiv}}));")
    L.append(f"    Result result = ctx.solver->check_sat();")
    L.append(f"")

    # UNSAT → verified
    L.append(f'    if (result == Result::UNSAT) {{')
    L.append(f'        printf("{{\\"status\\":\\"VERIFIED\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\"}}\\n", {ba}, vlen, config_id);')
    L.append(f'        return true;')
    L.append(f'    }}')
    L.append(f"")

    # SAT → counterexample: search all output buffers for the first mismatch
    L.append(f'    size_t fi = 0;')
    L.append(f'    const char* fail_buf = "";')

    for ob in output_bufs:
        obe = ob.elem_type.byte_size or 1
        L.append(f'    for (size_t _i = 0; _i < {ba}; _i++) {{')
        L.append(f'        Term _n = ctx.solver->get_value(sym_{ob.arg_name}_neon.loadScalar(_i * {obe}, {obe*8}));')
        L.append(f'        Term _r = ctx.solver->get_value(sym_{ob.arg_name}_rvv.loadScalar(_i * {obe}, {obe*8}));')
        L.append(f'        if (_n.value<std::string>(10) != _r.value<std::string>(10)) {{ fi = _i; fail_buf = "{ob.arg_name}"; goto found_mismatch; }}')
        L.append(f'    }}')

    L.append(f'    found_mismatch:')
    L.append(f'    printf("{{\\"status\\":\\"COUNTEREXAMPLE\\",\\"batch\\":%zu,\\"vlen\\":%zu,\\"config\\":\\"%s\\",\\"fail_index\\":%zu,\\"fail_output\\":\\"%s\\",", {ba}, vlen, config_id, fi, fail_buf);')

    for buf in input_bufs:
        be = buf.elem_type.byte_size or 1
        if buf.role == ArgRole.INPUT_SCALAR:
            L.append(f'    printf("\\"{buf.arg_name}\\":%s,", ctx.solver->get_value(sym_{buf.arg_name}.loadScalar(0, {be*8})).value<std::string>(10).c_str());')
        else:
            L.append(f'    printf("\\"{buf.arg_name}_at_fail\\":%s,", ctx.solver->get_value(sym_{buf.arg_name}.loadScalar(fi * {be}, {be*8})).value<std::string>(10).c_str());')

    # Print neon/rvv values from the failing output buffer
    # Use first output's elem size as default, actual failing buffer identified by fail_buf
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


def _emit_buffer_decl(buf: BufferSpec) -> list[str]:
    """Emit C++ array declaration for a buffer."""
    ct = buf.elem_type.c_type or "uint8_t"
    n = buf.arg_name

    if buf.role == ArgRole.INPUT_SCALAR:
        return [f"    {ct} {n}_val = 0;"]
    elif buf.role == ArgRole.INPUT_ARRAY:
        return [f"    std::vector<{ct}> {n}_arr(padded);"]
    elif buf.role == ArgRole.OUTPUT:
        return [f"    std::vector<{ct}> {n}_neon_arr(padded);",
                f"    std::vector<{ct}> {n}_rvv_arr(padded);"]
    elif buf.role == ArgRole.ZERO_BUFFER:
        return [f"    std::vector<{ct}> {n}_arr(padded, 0);"]
    elif buf.role == ArgRole.WEIGHTS:
        return [f"    size_t {n}_size = {buf.size_expr};",
                f"    std::vector<uint8_t> {n}_arr({n}_size);"]
    elif buf.role == ArgRole.INDIRECT_INPUT:
        eb = buf.elem_type.byte_size or 1
        return [f"    size_t {n}_nptrs = {buf.size_expr};",
                f"    std::vector<std::vector<{ct}>> {n}_rows({n}_nptrs, std::vector<{ct}>(padded));",
                f"    std::vector<const {ct}*> {n}_ptrs({n}_nptrs);",
                f"    for (size_t _r = 0; _r < {n}_nptrs; _r++) {n}_ptrs[_r] = {n}_rows[_r].data();"]
    return []


def _emit_buffer_register(buf: BufferSpec) -> list[str]:
    """Emit symbolic buffer registration."""
    n = buf.arg_name
    eb = buf.elem_type.byte_size or 1

    if buf.role == ArgRole.INPUT_SCALAR:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {eb});",
                f"    sym_{n}.bind(&{n}_val);"]
    elif buf.role == ArgRole.INPUT_ARRAY:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {buf.size_expr});",
                f"    sym_{n}.bind({n}_arr.data());"]
    elif buf.role == ArgRole.OUTPUT:
        return [f"    auto& sym_{n}_neon = ctx.registerBuffer(\"{n}_neon\", {buf.size_expr});",
                f"    sym_{n}_neon.bind({n}_neon_arr.data());",
                f"    auto& sym_{n}_rvv = ctx.registerBuffer(\"{n}_rvv\", {buf.size_expr});",
                f"    sym_{n}_rvv.bind({n}_rvv_arr.data());"]
    elif buf.role == ArgRole.ZERO_BUFFER:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {buf.size_expr});",
                f"    sym_{n}.bind({n}_arr.data());"]
    elif buf.role == ArgRole.WEIGHTS:
        return [f"    auto& sym_{n} = ctx.registerBuffer(\"{n}\", {n}_size);",
                f"    sym_{n}.bind({n}_arr.data());"]
    elif buf.role == ArgRole.INDIRECT_INPUT:
        return [f"    for (size_t _r = 0; _r < {n}_nptrs; _r++) {{",
                f"        auto& sym_row = ctx.registerBuffer(\"{n}_\" + std::to_string(_r), padded * {eb});",
                f"        sym_row.bind({n}_rows[_r].data());",
                f"    }}"]
    return []


def _build_call_args(spec: HarnessSpec, variant: str) -> list[str]:
    """Build argument list for calling a kernel function."""
    args = []
    for arg in spec.arg_order or []:
        name = arg["name"]
        role = arg["role"]

        if role == ArgRole.BATCH:
            args.append(spec.batch_arg)
        elif role == ArgRole.PARAMS:
            args.append("&params")
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

    L = []
    L.append("")
    L.append("int main(int argc, char** argv) {")
    L.append('    if (argc < 3) { fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout]\\n", argv[0]); return 2; }')
    L.append("    size_t start = (size_t)atoi(argv[1]);")
    L.append("    size_t end   = (size_t)atoi(argv[2]);")
    L.append(f"    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : {spec.vlen};")
    L.append("    double timeout = (argc > 4) ? atof(argv[4]) : 0;")
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
            vcall = f'verify({ba}, vlen, params, "{cfg_name}")'
        else:
            vcall = f'verify({ba}, vlen, "{cfg_name}")'

        L.append(f"        for (size_t {ba} = start; {ba} <= end; {ba}++) {{")
        L.append(f"            auto t0 = std::chrono::steady_clock::now();")
        L.append(f"            bool ok = {vcall};")
        L.append(f"            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();")
        L.append(f"            if (!ok) return 1;")
        L.append(f"            if (timeout > 0 && secs > timeout) {{")
        L.append(f'                printf("{{\\"status\\":\\"TIMEOUT\\",\\"batch\\":%zu,\\"seconds\\":%.1f,\\"config\\":\\"{cfg_name}\\"}}\\n", {ba}, secs);')
        L.append(f"                break;")
        L.append(f"            }}")
        L.append(f"        }}")
        L.append("    }")
        L.append("")

    L.append(f'    printf("{{\\"status\\":\\"ALL_VERIFIED\\",\\"start\\":%zu,\\"end\\":%zu,\\"configs\\":%d}}\\n", start, end, {len(configs)});')
    L.append("    return 0;")
    L.append("}")
    L.append("")
    return "\n".join(L)
