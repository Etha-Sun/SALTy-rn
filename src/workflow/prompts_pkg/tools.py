"""Intrinsics search tools for LLM tool calling.

Wraps IntrinsicsDB lookups as callable tools that can be registered
with LLMClient.chat_with_tools().

Usage:
    from intrinsics_tools import build_intrinsics_tools

    tools = build_intrinsics_tools()
    response = client.chat_with_tools(prompt, tools=tools, system=system)
"""

import logging
import re
from .search import IntrinsicsDB

log = logging.getLogger("pipeline")

# Singleton — parsed once, reused across calls
_db: IntrinsicsDB | None = None


def _get_db() -> IntrinsicsDB:
    global _db
    if _db is None:
        _db = IntrinsicsDB()
    return _db


def _normalize_name(raw: str) -> str:
    """Normalize an intrinsic name from LLM input.

    Handles common model outputs like:
        'vaddq_s32'           -> 'vaddq_s32'
        ' vaddq_s32 '         -> 'vaddq_s32'
        'vaddq_s32(a, b)'     -> 'vaddq_s32'
        '`vaddq_s32`'         -> 'vaddq_s32'
    """
    name = raw.strip().strip('`').strip()
    # Strip function call args: vaddq_s32(a, b) -> vaddq_s32
    paren = name.find('(')
    if paren != -1:
        name = name[:paren].strip()
    return name


def _extract_neon_slim(section: str, intrinsic_name: str) -> str:
    """Extract only the description, operation, and matching variant from a NEON section.

    The full section includes a table of all type variants (e.g. s8, s16, s32, u8, ...).
    This returns only:
      - The instruction heading + description
      - The operation pseudocode
      - The specific table row matching the requested intrinsic
    """
    parts = []

    # Heading (## ADD, ## FADD, etc.)
    heading_match = re.match(r'(## .+)', section)
    if heading_match:
        parts.append(heading_match.group(1))

    # Description paragraph
    desc_match = re.search(r'\*\*Description:\*\*(.+?)(?=\n\n|\*\*Operation)', section, re.DOTALL)
    if desc_match:
        parts.append(f"**Description:** {desc_match.group(1).strip()}")

    # Operation pseudocode block
    op_match = re.search(r'(\*\*Operation:\*\*\s*```.*?```)', section, re.DOTALL)
    if op_match:
        parts.append(op_match.group(1))

    # Matching table row only
    table_header = "| Intrinsic | Instruction | Result | Arch |"
    table_sep = "|-----------|------------|--------|------|"
    matching_rows = [
        line for line in section.splitlines()
        if intrinsic_name in line and line.strip().startswith('|')
    ]
    if matching_rows:
        parts.append(table_header)
        parts.append(table_sep)
        parts.extend(matching_rows)

    result = "\n\n".join(parts) if parts else section
    if len(result) > 4000:
        return result[:4000] + "\n\n[truncated]"
    return result


def search_neon_intrinsics(intrinsic_name: str) -> str:
    """Look up the operation semantics of a NEON intrinsic by name."""
    name = _normalize_name(intrinsic_name)
    db = _get_db()
    result = db.lookup_neon(name)
    if result:
        return _extract_neon_slim(result, name)
    return f"Intrinsic '{name}' not found in NEON database."


search_neon_intrinsics._tool_description = (
    "Look up the operation semantics of a NEON (ARM) intrinsic. "
    "Returns the description, pseudocode operation, and signature. "
    "Use this when you need to understand what a specific NEON intrinsic does "
    "before translating it. Pass just the intrinsic name, e.g. 'vaddq_f32'."
)
search_neon_intrinsics._tool_schema = {
    'type': 'object',
    'properties': {
        'intrinsic_name': {
            'type': 'string',
            'description': 'The NEON intrinsic name, e.g. vaddq_f32, vld1q_s8, vmulq_lane_f32',
        },
    },
    'required': ['intrinsic_name'],
}


def search_rvv_intrinsics(intrinsic_name: str) -> str:
    """Look up the operation semantics of an RVV intrinsic by name."""
    name = _normalize_name(intrinsic_name)
    db = _get_db()
    result = db.lookup_rvv(name)
    if result:
        if len(result) > 4000:
            return result[:4000] + "\n\n[truncated]"
        return result
    return f"Intrinsic '{name}' not found in RVV database."


search_rvv_intrinsics._tool_description = (
    "Look up the operation semantics of an RVV (RISC-V Vector) intrinsic. "
    "Returns the signature, pseudocode operation, and policy variations. "
    "Use this when you need to find the correct RVV intrinsic or verify "
    "its semantics during translation. Pass just the intrinsic name, "
    "e.g. '__riscv_vfadd_vv_f32m1'."
)
search_rvv_intrinsics._tool_schema = {
    'type': 'object',
    'properties': {
        'intrinsic_name': {
            'type': 'string',
            'description': 'The RVV intrinsic name, e.g. __riscv_vfadd_vv_f32m1, __riscv_vse32_v_f32m1',
        },
    },
    'required': ['intrinsic_name'],
}


def build_intrinsics_tools() -> dict[str, callable]:
    """Build the tools dict for LLMClient.chat_with_tools().

    Returns:
        Dict mapping tool names to callables with attached schema metadata.
    """
    return {
        'search_neon_intrinsics': search_neon_intrinsics,
        'search_rvv_intrinsics': search_rvv_intrinsics,
    }
