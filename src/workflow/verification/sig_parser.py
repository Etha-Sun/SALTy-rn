"""
C function signature parser for SIMD kernel verification harness generation.

Parses a C function signature into structured argument metadata.
Framework-agnostic — works for XNNPACK, TFLite, oneDNN, hand-written kernels, etc.
"""

import re
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Optional


class ArgRole(Enum):
    """Role of a function argument in the kernel."""
    BATCH = auto()          # scalar loop count (size_t batch, size_t n, etc.)
    SCALAR_SIZE = auto()    # other scalar size (mr, nc, kc, channels, etc.)
    INPUT_ARRAY = auto()    # const T* — symbolic input buffer
    INPUT_SCALAR = auto()   # const T* — scalar broadcast (1 element, e.g., input_b in vaddc)
    OUTPUT = auto()         # T* — output buffer to compare
    PARAMS = auto()         # const struct/union X* — concrete params
    INDIRECT_INPUT = auto() # const T** — indirect pointer array (GEMM, DWCONV)
    WEIGHTS = auto()        # const void* w / const T* weights — weight data
    STRIDE = auto()         # size_t stride — stride/offset parameter
    ZERO_BUFFER = auto()    # const T* zero — zero-padding buffer
    UNKNOWN = auto()        # couldn't classify


class ElemType(Enum):
    """Element type inferred from C pointer type."""
    INT8 = ("int8_t", 1, "SINT")
    UINT8 = ("uint8_t", 1, "UINT")
    INT16 = ("int16_t", 2, "SINT")
    UINT16 = ("uint16_t", 2, "UINT")
    INT32 = ("int32_t", 4, "SINT")
    UINT32 = ("uint32_t", 4, "UINT")
    FLOAT = ("float", 4, "F32")
    VOID = ("void", 0, "UNKNOWN")
    OTHER = ("other", 0, "UNKNOWN")

    def __init__(self, c_type: str, byte_size: int, element_kind: str):
        self.c_type = c_type
        self.byte_size = byte_size
        self.element_kind = element_kind


@dataclass
class FuncArg:
    """A parsed function argument."""
    name: str
    c_type: str            # full C type string (e.g., "const int8_t*")
    is_const: bool
    is_pointer: bool
    is_double_pointer: bool
    is_restrict: bool
    base_type: str         # stripped type (e.g., "int8_t")
    elem_type: ElemType
    role: ArgRole = ArgRole.UNKNOWN


@dataclass
class FuncSignature:
    """A parsed C function signature."""
    name: str
    args: list[FuncArg] = field(default_factory=list)
    raw: str = ""

    # Classified summary (filled by classify())
    batch_arg: Optional[FuncArg] = None
    input_args: list[FuncArg] = field(default_factory=list)
    output_args: list[FuncArg] = field(default_factory=list)
    params_arg: Optional[FuncArg] = None
    params_type: str = ""


# ---------------------------------------------------------------------------
# Type inference
# ---------------------------------------------------------------------------
_TYPE_MAP = {
    "int8_t": ElemType.INT8,
    "uint8_t": ElemType.UINT8,
    "int16_t": ElemType.INT16,
    "uint16_t": ElemType.UINT16,
    "int32_t": ElemType.INT32,
    "uint32_t": ElemType.UINT32,
    "float": ElemType.FLOAT,
    "void": ElemType.VOID,
}


def _infer_elem_type(base_type: str) -> ElemType:
    """Infer ElemType from the base C type string."""
    for key, et in _TYPE_MAP.items():
        if key in base_type:
            return et
    return ElemType.OTHER


# ---------------------------------------------------------------------------
# Signature parser
# ---------------------------------------------------------------------------
def parse_signature(source: str) -> Optional[FuncSignature]:
    """Parse the first C function signature from source code.

    Handles multi-line declarations. Returns None if no function found.
    """
    # Collapse multi-line function declarations
    # Match: void func_name( ... )
    pattern = r'void\s+(\w+)\s*\(([\s\S]*?)\)\s*(?:XNN_OOB_READS)?\s*\{'
    match = re.search(pattern, source)
    if not match:
        # Try without opening brace (forward declaration)
        pattern = r'void\s+(\w+)\s*\(([\s\S]*?)\)\s*(?:XNN_OOB_READS)?\s*;'
        match = re.search(pattern, source)
    if not match:
        return None

    func_name = match.group(1)
    args_str = match.group(2)
    raw = match.group(0)

    # Split arguments by comma, handling nested parens/templates
    args = _split_args(args_str)

    parsed_args = []
    for arg_str in args:
        arg_str = arg_str.strip()
        if not arg_str:
            continue
        parsed = _parse_one_arg(arg_str)
        if parsed:
            parsed_args.append(parsed)

    sig = FuncSignature(name=func_name, args=parsed_args, raw=raw)
    return sig


def _split_args(args_str: str) -> list[str]:
    """Split argument list by commas, respecting parentheses."""
    args = []
    depth = 0
    current = []
    for ch in args_str:
        if ch == '(':
            depth += 1
            current.append(ch)
        elif ch == ')':
            depth -= 1
            current.append(ch)
        elif ch == ',' and depth == 0:
            args.append(''.join(current))
            current = []
        else:
            current.append(ch)
    if current:
        args.append(''.join(current))
    return args


def _parse_one_arg(arg_str: str) -> Optional[FuncArg]:
    """Parse a single argument like 'const int8_t* restrict input_a'."""
    arg_str = arg_str.strip()
    if not arg_str or arg_str == 'void':
        return None

    # Remove __builtin_constant_p wrapper
    arg_str = re.sub(r'__builtin_constant_p\((\w+)\)', r'\1', arg_str)

    is_const = 'const' in arg_str
    is_restrict = 'restrict' in arg_str
    is_double_pointer = '**' in arg_str
    is_pointer = '*' in arg_str

    # Clean up qualifiers to extract base type and name
    cleaned = arg_str.replace('const ', '').replace('restrict ', '').replace('  ', ' ').strip()

    # Extract name (last word) and type (everything before it)
    parts = cleaned.rsplit(None, 1)
    if len(parts) == 2:
        type_part, name = parts
    elif len(parts) == 1:
        # No name, just type (shouldn't happen in real code)
        type_part = parts[0]
        name = "unnamed"
    else:
        return None

    # Clean pointer stars from name
    name = name.strip('*').strip()

    # Base type: remove pointers
    base_type = type_part.replace('*', '').replace('struct ', '').replace('union ', '').strip()
    elem_type = _infer_elem_type(base_type)

    return FuncArg(
        name=name,
        c_type=arg_str.strip(),
        is_const=is_const,
        is_pointer=is_pointer,
        is_double_pointer=is_double_pointer,
        is_restrict=is_restrict,
        base_type=base_type,
        elem_type=elem_type,
    )


# ---------------------------------------------------------------------------
# Auto-classification heuristics
# ---------------------------------------------------------------------------
def classify_args(sig: FuncSignature, kernel_name: str = "") -> FuncSignature:
    """Classify each argument's role using heuristics.

    Works for most SIMD kernel conventions. Falls back to UNKNOWN
    for args it can't classify — caller should use LLM or user input.

    kernel_name: optional hint (e.g., 'qs8-vaddc'). If empty, uses sig.name.
    """
    # Use function name as fallback for kernel_name (carries the 'c' suffix info)
    effective_name = kernel_name or sig.name
    for arg in sig.args:
        arg.role = _classify_one_arg(arg, sig, effective_name)

    # Fill summary fields
    sig.batch_arg = next((a for a in sig.args if a.role == ArgRole.BATCH), None)
    sig.input_args = [a for a in sig.args if a.role in (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR)]
    sig.output_args = [a for a in sig.args if a.role == ArgRole.OUTPUT]
    sig.params_arg = next((a for a in sig.args if a.role == ArgRole.PARAMS), None)
    return sig


def refine_with_source(sig: FuncSignature, source: str) -> FuncSignature:
    """Refine argument classification using source-level analysis.

    Detects scalar vs array by checking pointer usage in the source code.
    Call this after classify_args for more accurate classification.
    """
    for arg in sig.args:
        if arg.role == ArgRole.INPUT_ARRAY and arg.is_pointer and not arg.is_double_pointer:
            if detect_scalar_broadcast_from_source(source, arg.name):
                arg.role = ArgRole.INPUT_SCALAR

    # Re-fill summary
    sig.input_args = [a for a in sig.args if a.role in (ArgRole.INPUT_ARRAY, ArgRole.INPUT_SCALAR)]
    if sig.params_arg:
        # Extract the struct/union type name from the full C type
        m = re.search(r'(?:struct|union)\s+(\w+)', sig.params_arg.c_type)
        sig.params_type = m.group(0) if m else sig.params_arg.base_type

    return sig


def _classify_one_arg(arg: FuncArg, sig: FuncSignature, kernel_name: str) -> ArgRole:
    """Classify a single argument by heuristics."""
    name = arg.name.lower()
    base = arg.base_type.lower()

    # --- Params: const struct/union pointer with 'params' in name ---
    if arg.is_const and arg.is_pointer and ('params' in name or 'params' in base):
        return ArgRole.PARAMS

    # --- Batch/size scalar: size_t with batch/n/rows/channels ---
    if not arg.is_pointer and ('size_t' in arg.c_type or 'intptr_t' in arg.c_type):
        if name in ('batch', 'n', 'count', 'len', 'length'):
            return ArgRole.BATCH
        if name in ('rows', 'channels', 'output_pixels', 'input_height', 'input_width',
                     'mr', 'nc', 'kc', 'ks', 'mc', 'm', 'k', 'g',
                     'output_width', 'kernel_elements'):
            # Could be BATCH for simple kernels, SCALAR_SIZE for complex ones
            # If it's the first size_t arg, likely batch
            first_size = next((a for a in sig.args if 'size_t' in a.c_type and not a.is_pointer), None)
            if first_size and first_size.name == arg.name:
                return ArgRole.BATCH
            return ArgRole.SCALAR_SIZE
        if 'stride' in name or 'offset' in name or 'increment' in name or 'pixel' in name:
            return ArgRole.STRIDE
        return ArgRole.SCALAR_SIZE

    # --- Indirect pointer (T**) ---
    if arg.is_double_pointer:
        if arg.is_const:
            return ArgRole.INDIRECT_INPUT
        return ArgRole.OUTPUT

    # --- Const pointer: input or weights ---
    if arg.is_const and arg.is_pointer:
        if 'weight' in name or name == 'w':
            return ArgRole.WEIGHTS
        if name == 'zero':
            return ArgRole.ZERO_BUFFER
        if 'table' in name:
            return ArgRole.WEIGHTS
        if name == 'scale' or name == 'bias':
            return ArgRole.WEIGHTS
        if 'max' in name and arg.elem_type == ElemType.FLOAT:
            return ArgRole.INPUT_ARRAY  # raddstoreexpminusmax has const float* max
        # Check if this is a scalar broadcast (vaddc, vmulc pattern)
        if name in ('input_b',) and _is_scalar_broadcast(kernel_name):
            return ArgRole.INPUT_SCALAR
        return ArgRole.INPUT_ARRAY

    # --- Non-const pointer: output ---
    if not arg.is_const and arg.is_pointer:
        if name in ('output', 'out', 'c', 'y', 'packed_weights'):
            return ArgRole.OUTPUT
        if name == 'sum':
            return ArgRole.OUTPUT
        return ArgRole.OUTPUT

    # --- uint32_t padding_top, etc. ---
    if not arg.is_pointer:
        return ArgRole.SCALAR_SIZE

    return ArgRole.UNKNOWN


def _is_scalar_broadcast(kernel_name: str) -> bool:
    """Detect if the kernel uses scalar broadcast for input_b.

    Convention: kernel names ending in 'c' (vaddc, vmulc, vmaxc, etc.)
    use input_b as a single-element broadcast.
    """
    # Match patterns like qs8-vaddc, f32-vmulc, etc.
    if re.search(r'v\w+c[_\-]', kernel_name) or kernel_name.endswith('c'):
        return True
    # Also check the full name for the 'c' suffix before the variant
    if re.search(r'v(add|sub|mul|max|min|div)c', kernel_name):
        return True
    return False


# ---------------------------------------------------------------------------
# Source-level analysis for scalar vs array detection
# ---------------------------------------------------------------------------
def detect_scalar_broadcast_from_source(source: str, arg_name: str) -> bool:
    """Detect if a pointer argument is used as scalar (dereferenced once, never advanced).

    Only scans the function body (after the opening brace), not the signature.
    Returns True if the arg is likely scalar broadcast, False if array.
    """
    # Extract function body only (after first '{')
    brace_pos = source.find('{')
    if brace_pos == -1:
        return False
    body = source[brace_pos:]

    # Check: does the body advance the pointer? (arg_name += N)
    if re.search(rf'{arg_name}\s*\+\=', body):
        return False
    # Check: does it dereference as *arg_name (scalar read)?
    if re.search(rf'\*\s*{arg_name}\b', body):
        return True
    # Check: does it use it in vld1_dup (broadcast load)?
    if re.search(rf'vld1[q]?_dup_\w+\s*\(\s*{arg_name}\s*\)', body):
        return True
    # Default: assume array
    return False


# ---------------------------------------------------------------------------
# Summary / pretty-print
# ---------------------------------------------------------------------------
def format_signature(sig: FuncSignature) -> str:
    """Format a parsed signature for human review."""
    lines = [f"Function: {sig.name}"]
    lines.append(f"Params type: {sig.params_type}")
    lines.append("Arguments:")
    for arg in sig.args:
        lines.append(f"  {arg.role.name:20s} {arg.c_type:40s}  →  {arg.name}")
    unclassified = [a for a in sig.args if a.role == ArgRole.UNKNOWN]
    if unclassified:
        lines.append(f"\n⚠ {len(unclassified)} argument(s) could not be classified:")
        for a in unclassified:
            lines.append(f"  {a.c_type}  {a.name}")
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Main (CLI for testing)
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python sig_parser.py <kernel_source.c> [kernel_name]")
        sys.exit(1)

    with open(sys.argv[1]) as f:
        source = f.read()
    kernel_name = sys.argv[2] if len(sys.argv) > 2 else ""

    sig = parse_signature(source)
    if sig is None:
        print("No function signature found.")
        sys.exit(1)

    sig = classify_args(sig, kernel_name)
    print(format_signature(sig))
