"""Source-text inspection for the harness generator.

Single home for any `re.search` over kernel source. Produces structured
SourceFacts the generator consumes; harness_gen.py never inspects source.

Usage:
    facts = extract_source_facts(neon_source, sweep_arg)
    spec.batch_unit_bytes = facts.batch_unit_bytes
    for buf in spec.buffers:
        buf.layout = facts.buffer_layouts.get(buf.arg_name, MemoryLayout())
"""
from __future__ import annotations

import re
from dataclasses import dataclass, field


_SIZEOF_TABLE = {
    "int8_t": 1, "uint8_t": 1, "char": 1, "unsigned char": 1, "signed char": 1,
    "int16_t": 2, "uint16_t": 2, "short": 2, "unsigned short": 2,
    "int32_t": 4, "uint32_t": 4, "int": 4, "unsigned int": 4,
    "int64_t": 8, "uint64_t": 8, "long long": 8, "unsigned long long": 8,
    "float": 4, "double": 8,
    "xnn_float16": 2, "xnn_bfloat16": 2, "_Float16": 2, "__fp16": 2,
}


@dataclass
class MemoryLayout:
    """How one logical buffer maps to physical storage.

    Orthogonal to ShapePlan (which is how the verifier sweeps dimensions).
    A kernel can have any combination of shape × layout.
    """
    kind: str = "flat"          # "flat" | "split_by_batch_bytes"
    planes: int = 1             # 1 for flat; 2 for split (real | imag)
    evidence: str = ""          # source-pattern hint that drove the inference


@dataclass
class SourceFacts:
    """Structured facts derived from kernel source. Consumed by harness_gen."""
    batch_unit_bytes: int = 1
    buffer_layouts: dict = field(default_factory=dict)   # arg_name -> MemoryLayout
    evidence: list = field(default_factory=list)         # human-readable trail


class SourceFactsError(ValueError):
    """Raised when source contains a pattern we can't classify."""


def _detect_batch_unit_bytes(neon_source: str, sweep_arg: str, facts: SourceFacts) -> None:
    ba = re.escape(sweep_arg)
    m = re.search(
        rf'{ba}\s*[%/]\s*sizeof\s*\(\s*([A-Za-z_][A-Za-z0-9_ ]*)\s*\)',
        neon_source,
    )
    if not m:
        return
    type_name = m.group(1).strip()
    if type_name not in _SIZEOF_TABLE:
        raise SourceFactsError(
            f"Unrecognized type in `{sweep_arg} % sizeof({type_name})`. "
            f"Add to _SIZEOF_TABLE in source_facts.py."
        )
    facts.batch_unit_bytes = _SIZEOF_TABLE[type_name]
    facts.evidence.append(f"batch_unit_bytes={facts.batch_unit_bytes} from sizeof({type_name})")


def _detect_split_layouts(neon_source: str, sweep_arg: str, facts: SourceFacts) -> None:
    """Detect `(uintptr_t) <buf> + <batch>` — half-pointer split (e.g., complex vcmul)."""
    ba = re.escape(sweep_arg)
    pattern = rf'\(\s*uintptr_t\s*\)\s*([A-Za-z_][A-Za-z0-9_]*)\s*\+\s*{ba}\b'
    for m in re.finditer(pattern, neon_source):
        buf_name = m.group(1)
        if buf_name not in facts.buffer_layouts:
            facts.buffer_layouts[buf_name] = MemoryLayout(
                kind="split_by_batch_bytes",
                planes=2,
                evidence=f"(uintptr_t) {buf_name} + {sweep_arg}",
            )
            facts.evidence.append(f"buffer {buf_name}: split_by_batch_bytes (planes=2)")


def _lint_uintptr_batch_arithmetic(source: str, sweep_arg: str,
                                    allowed_buffers: set, label: str) -> None:
    """Fail closed: every (uintptr_t) ... + batch occurrence must reference an allowed buffer."""
    ba = re.escape(sweep_arg)
    broad = rf'\(\s*uintptr_t\s*\)[^;]*?\+\s*{ba}\b'
    precise = rf'\(\s*uintptr_t\s*\)\s*([A-Za-z_][A-Za-z0-9_]*)\s*\+\s*{ba}\b'
    for m in re.finditer(broad, source):
        sub = m.group(0)
        p = re.search(precise, sub)
        if p and p.group(1) in allowed_buffers:
            continue
        raise SourceFactsError(
            f"{label}: unclassified `(uintptr_t) ... + {sweep_arg}` pattern: "
            f"'{sub.strip()}'. No matching MemoryLayout kind."
        )


def _lint_unclassified_layout(neon_source: str, sweep_arg: str,
                                facts: SourceFacts, profile_layouts: dict) -> None:
    allowed = set(facts.buffer_layouts) | set(profile_layouts or {})
    _lint_uintptr_batch_arithmetic(neon_source, sweep_arg, allowed, "NEON")


def lint_rvv_against_neon(rvv_source: str, sweep_arg: str, neon_facts: SourceFacts,
                           profile_layouts: dict = None) -> None:
    """RVV must reference only buffers classified in NEON facts OR declared in
    profile.buffer_layouts. NEON + profile together are the source of truth."""
    allowed = set(neon_facts.buffer_layouts) | set(profile_layouts or {})
    _lint_uintptr_batch_arithmetic(rvv_source, sweep_arg, allowed, "RVV")


def _lint_layout_keys_match_buffers(facts: SourceFacts, known_buffers: set) -> None:
    """Every classified layout key must reference a real BufferSpec.

    Catches the alias case (e.g., `base = input_a; ... (uintptr_t) base + batch`)
    where the regex detector classifies `base` but no BufferSpec exists for it.
    """
    unknown = set(facts.buffer_layouts) - known_buffers
    if unknown:
        raise SourceFactsError(
            f"Layouts inferred for non-buffer identifiers {sorted(unknown)} — "
            f"likely an alias of a real buffer (e.g., `base = input_a`). "
            f"Regex detector does not follow aliases; rewrite source to reference "
            f"buffer args directly, or extend the detector with dataflow analysis."
        )


def extract_source_facts(neon_source: str, sweep_arg: str,
                          known_buffers: set = None,
                          profile_layouts: dict = None) -> SourceFacts:
    """Run all detectors, return structured facts. Fail closed on unknown patterns.

    known_buffers:   if provided, validate that every classified layout key
                     matches a real BufferSpec arg_name (catches alias hole).
    profile_layouts: profile-declared layouts to count as "allowed" in the
                     unclassified-layout lint, so a profile override can
                     rescue patterns the regex detector misses.
    """
    facts = SourceFacts()
    _detect_batch_unit_bytes(neon_source, sweep_arg, facts)
    _detect_split_layouts(neon_source, sweep_arg, facts)
    _lint_unclassified_layout(neon_source, sweep_arg, facts, profile_layouts or {})
    if known_buffers is not None:
        _lint_layout_keys_match_buffers(facts, known_buffers)
    return facts
