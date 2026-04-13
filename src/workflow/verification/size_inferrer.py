"""
Buffer size inference for verification harness generation.

Auto-infers sizes for common patterns. Falls back to LLM for
GEMM/DWCONV/pooling kernels where sizes depend on multiple dimensions.
"""

import json
import logging
import re
from dataclasses import dataclass
from typing import Optional

from .sig_parser import FuncSignature, FuncArg, ArgRole, ElemType
from .kernel_profiles import get_profile, KernelProfile

log = logging.getLogger("pipeline")


@dataclass
class BufferSpec:
    """Specification for one symbolic buffer in the harness."""
    arg_name: str
    role: ArgRole
    elem_type: ElemType
    size_expr: str       # C++ expression for byte size (e.g., "batch * 1", "kc * nc * 4")
    is_symbolic: bool    # True = symbolic (solver explores all values), False = concrete/zero
    note: str = ""       # explanation


@dataclass
class HarnessSpec:
    """Complete specification for generating a verification harness."""
    kernel_name: str
    neon_func_name: str
    rvv_func_name: str
    params_type: str
    batch_arg: str              # name of the batch/loop-count argument
    buffers: list[BufferSpec]
    scalar_args: dict[str, str] # arg_name → C++ value expression for scalar size args
    elem_bytes: int             # output element size for comparison
    element_kind: str           # "SINT", "UINT", "F32"
    needs_llm: bool = False     # True if LLM was needed to infer sizes
    vlen: int = 256
    arg_order: list[dict] = None  # original arg order: [{"name": ..., "role": ArgRole}]
    layout: str = "1D"          # "1D" (flat batch) or "2D" (rows x channels)
    secondary_dim: str = ""     # name of the secondary dimension arg (e.g., "channels")
    profile: Optional[KernelProfile] = None  # optional kernel-specific profile

    # True if the kernel's `batch` argument is measured in BYTES (e.g. f32-velu
    # with `assert(batch % sizeof(float) == 0)`), not in elements.  When set:
    #   - the generated sweep starts at elem_bytes and steps by elem_bytes
    #     (so invalid sub-element batches are never tested)
    #   - the output comparison uses `batch / elem_bytes` as the element count
    batch_is_bytes: bool = False


def infer_buffer_sizes(sig: FuncSignature, kernel_name: str = "",
                       source: str = "") -> HarnessSpec:
    """Auto-infer buffer sizes from a classified signature.

    Returns a HarnessSpec with size expressions for each buffer.
    Sets needs_llm=True if any size couldn't be determined.
    """
    buffers = []
    scalar_args = {}
    needs_llm = False
    batch_arg_name = sig.batch_arg.name if sig.batch_arg else "batch"

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

    # Preserve original argument order for call generation
    arg_order = [{"name": a.name, "role": a.role} for a in sig.args]

    # Check for kernel profile first, then fall back to auto-detection
    profile = get_profile(kernel_name)
    if profile:
        layout = profile.layout
        secondary = profile.secondary_dim
    else:
        # Auto-detect 2D: row x channels kernels with stride-based access
        has_strides = any(a.role == ArgRole.STRIDE for a in sig.args)
        secondary = "channels" if "channels" in scalar_args else ""
        layout = "2D" if has_strides and secondary else "1D"

    return HarnessSpec(
        kernel_name=kernel_name,
        neon_func_name=sig.name,
        rvv_func_name=sig.name,  # will be overridden with RVV function name
        params_type=sig.params_type,
        batch_arg=batch_arg_name,
        buffers=buffers,
        scalar_args=scalar_args,
        elem_bytes=elem_bytes,
        element_kind=element_kind,
        needs_llm=needs_llm,
        arg_order=arg_order,
        layout=layout,
        secondary_dim=secondary,
        profile=profile,
    )


def resolve_unknown_sizes_with_llm(spec: HarnessSpec, neon_source: str,
                                    rvv_source: str, llm_client) -> HarnessSpec:
    """Use an LLM to infer unknown buffer sizes.

    Sends the kernel source + signature to the LLM, asks for size formulas.
    """
    unknown_bufs = [b for b in spec.buffers if b.size_expr == "UNKNOWN"]
    if not unknown_bufs:
        return spec

    prompt = _build_size_inference_prompt(spec, neon_source, unknown_bufs)
    system = (
        "You are a SIMD kernel analysis expert. Given a kernel's function signature "
        "and source code, determine the correct buffer sizes for verification.\n"
        "Respond with ONLY a JSON object mapping argument names to C++ size expressions "
        "in bytes. Use the other function arguments as variables.\n"
        "Example: {\"weights\": \"kc * nc * 4 + nc * 4\", \"input_ptrs\": \"ks * 8\"}"
    )

    try:
        response = llm_client.chat(prompt, system=system, temperature=0.1, max_tokens=1024)
        sizes = _parse_size_response(response)

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
        log.error("LLM size inference failed: %s", e)

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
    return f"""Given this SIMD kernel:

```c
{source[:3000]}
```

The function has these arguments with unknown buffer sizes:
{buf_list}

The other size arguments are:
{json.dumps(spec.scalar_args, indent=2)}

For each unknown buffer, provide the size in bytes as a C++ expression
using the other argument names as variables.

Respond with ONLY a JSON object. Example:
{{"weights": "kc * nc * 4 + nc * 4", "input_ptrs": "ks * 8"}}
"""


def _parse_size_response(response: str) -> dict[str, str]:
    """Extract JSON size mapping from LLM response."""
    # Try to find JSON in the response
    match = re.search(r'\{[^}]+\}', response)
    if match:
        try:
            return json.loads(match.group())
        except json.JSONDecodeError:
            pass

    # Try the whole response as JSON
    try:
        return json.loads(response.strip())
    except json.JSONDecodeError:
        log.warning("Could not parse LLM size response: %s", response[:200])
        return {}
