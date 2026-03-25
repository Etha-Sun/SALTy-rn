"""
Grep-based intrinsics search over NEON and RVV op-semantics docs.

Parses the markdown docs once at import time, then provides fast lookups
by intrinsic name. Used to inject relevant semantics into LLM prompts.
"""

import logging
import re
from functools import lru_cache
from pathlib import Path

log = logging.getLogger("pipeline")

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent  # src/workflow/ -> SALT/
OP_SEMANTICS_DIR = PROJECT_ROOT / "op-semantics"

NEON_DOC = OP_SEMANTICS_DIR / "neon-intrinsics.md"
RVV_DOC = OP_SEMANTICS_DIR / "rvv-intrinsics.md"

# NEON suffixes include scalar type suffixes like _s8/_u16/_f32/_p64 and bf16.
NEON_SUFFIX_RE = r"(?:[sufp]\d+|bf16)"

# Regex to match NEON intrinsic names in C source code
# Matches patterns like: vaddq_s32, vld1q_f16, vmulq_lane_f32, etc.
NEON_INTRINSIC_RE = re.compile(rf"\bv[a-z][a-z0-9_]*_{NEON_SUFFIX_RE}\b")

# Regex to match RVV intrinsic names in C source code
RVV_INTRINSIC_RE = re.compile(r"\b__riscv_v[a-z0-9_]+\b")

# Strip comments and string literals before extraction so we do not inject
# semantics for intrinsics that only appear in commented-out code or examples.
C_STRING_RE = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'', re.DOTALL)
C_COMMENT_RE = re.compile(r"//.*?$|/\*.*?\*/", re.MULTILINE | re.DOTALL)


def _sanitize_c_source(source_code: str) -> str:
    """Remove comments and string literals before intrinsic extraction."""
    without_strings = C_STRING_RE.sub(" ", source_code)
    return C_COMMENT_RE.sub(" ", without_strings)


def _iter_markdown_sections(text: str, heading_level: int) -> list[str]:
    """Split markdown into sections starting at a specific heading level."""
    heading_prefix = "#" * heading_level
    heading_re = re.compile(rf"^{re.escape(heading_prefix)} .*$", re.MULTILINE)
    matches = list(heading_re.finditer(text))
    if not matches:
        return []

    sections = []
    for i, match in enumerate(matches):
        start = match.start()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        sections.append(text[start:end].rstrip())
    return sections


def _parse_neon_sections(text: str) -> dict[str, str]:
    """Parse NEON doc into {intrinsic_name: full_section_text}.

    Each ## heading is an instruction group (e.g. ## ADD) containing
    a table of intrinsic variants. We index by each intrinsic name
    found in the table, pointing back to the full section.
    """
    index: dict[str, str] = {}

    for section in _iter_markdown_sections(text, heading_level=2):
        names = {
            match.group(1)
            for match in re.finditer(r"\b(v[a-z][a-z0-9_]+)\s*\(", section)
            if NEON_INTRINSIC_RE.fullmatch(match.group(1))
        }
        for name in names:
            index[name] = section

    return index


def _parse_rvv_sections(text: str) -> dict[str, str]:
    """Parse RVV doc into {intrinsic_name: full_section_text}.

    Each ### heading is a single intrinsic entry.
    """
    index: dict[str, str] = {}

    for section in _iter_markdown_sections(text, heading_level=3):
        lines = section.splitlines()
        heading_names = RVV_INTRINSIC_RE.findall(lines[0]) if lines else []
        for name in heading_names:
            index[name] = section

        for name in set(RVV_INTRINSIC_RE.findall(section)):
            index.setdefault(name, section)

    return index


@lru_cache(maxsize=None)
def _load_neon_index(neon_path: str) -> dict[str, str]:
    path = Path(neon_path)
    if not path.exists():
        return {}
    return _parse_neon_sections(path.read_text())


@lru_cache(maxsize=None)
def _load_rvv_index(rvv_path: str) -> dict[str, str]:
    path = Path(rvv_path)
    if not path.exists():
        return {}
    return _parse_rvv_sections(path.read_text())


class IntrinsicsDB:
    """Pre-parsed index of NEON and RVV intrinsics for fast lookup."""

    def __init__(
        self,
        neon_path: Path = NEON_DOC,
        rvv_path: Path = RVV_DOC,
    ):
        log.info("Loading intrinsics DB...")
        self._neon_index: dict[str, str] = {}
        self._rvv_index: dict[str, str] = {}

        if neon_path.exists():
            self._neon_index = dict(_load_neon_index(str(neon_path)))
            log.info("NEON intrinsics indexed: %d entries", len(self._neon_index))
        else:
            log.warning("NEON op-semantics not found: %s", neon_path)

        if rvv_path.exists():
            self._rvv_index = dict(_load_rvv_index(str(rvv_path)))
            log.info("RVV intrinsics indexed: %d entries", len(self._rvv_index))
        else:
            log.warning("RVV op-semantics not found: %s", rvv_path)

    def lookup_neon(self, name: str) -> str | None:
        """Look up a NEON intrinsic by name. Returns the full section or None."""
        return self._neon_index.get(name)

    def lookup_rvv(self, name: str) -> str | None:
        """Look up an RVV intrinsic by name. Returns the full section or None."""
        return self._rvv_index.get(name)

    def extract_neon_names(self, source_code: str) -> list[str]:
        """Extract all NEON intrinsic names from C source code."""
        return sorted(set(NEON_INTRINSIC_RE.findall(_sanitize_c_source(source_code))))

    def extract_rvv_names(self, source_code: str) -> list[str]:
        """Extract all RVV intrinsic names from C source code."""
        return sorted(set(RVV_INTRINSIC_RE.findall(_sanitize_c_source(source_code))))

    def _collect_sections(
        self,
        names: list[str],
        lookup,
    ) -> tuple[list[str], list[str], list[str]]:
        """Look up names and return unique sections, found names, and missing names."""
        sections_seen = set()
        sections = []
        found_names = []
        missing_names = []

        for name in names:
            section = lookup(name)
            if not section:
                missing_names.append(name)
                continue

            found_names.append(name)
            if section not in sections_seen:
                sections_seen.add(section)
                sections.append(section)

        return sections, found_names, missing_names

    def _format_reference(
        self,
        title: str,
        names: list[str],
        sections: list[str],
        max_sections: int | None,
        max_chars: int | None,
    ) -> str:
        """Format a prompt-ready reference block with bounded size."""
        if not sections:
            return ""

        if max_sections is not None:
            sections = sections[:max_sections]

        parts = [title]
        truncated = False
        selected_sections = 0
        for section in sections:
            candidate_parts = [*parts, section]
            candidate_text = "\n\n".join(candidate_parts)
            if max_chars is not None and len(candidate_text) > max_chars:
                truncated = True
                break
            parts.append(section)
            selected_sections += 1

        text = "\n\n".join(parts)
        if truncated:
            note = "[reference truncated to stay within prompt budget]"
            if max_chars is None:
                text = f"{text}\n\n{note}"
            else:
                body_budget = max_chars - len(note) - 2
                if body_budget > 0:
                    if selected_sections == 0 and sections:
                        first_section_budget = body_budget - len(title) - 2
                        if first_section_budget > 0:
                            text = "\n\n".join([title, sections[0][:first_section_budget].rstrip()])
                        else:
                            text = title[:body_budget].rstrip()
                    else:
                        text = text[:body_budget].rstrip()
                    text = f"{text}\n\n{note}"
                else:
                    text = note[:max_chars]

        log.info(
            "Injecting op-semantics for %d intrinsics (%d sections%s)",
            len(names),
            selected_sections,
            ", truncated" if truncated else "",
        )
        return text

    def lookup_neon_batch(
        self,
        names: list[str],
        max_sections: int | None = 8,
        max_chars: int | None = 12000,
    ) -> str:
        """Look up multiple NEON intrinsics and return formatted reference."""
        if not names:
            return ""

        sections, found_names, missing_names = self._collect_sections(names, self.lookup_neon)
        if missing_names:
            log.debug("No NEON op-semantics found for: %s", missing_names)
        if not sections:
            log.warning("No NEON op-semantics found for: %s", names)
            return ""

        return self._format_reference(
            "--- NEON Intrinsics Reference (extracted from source) ---",
            found_names,
            sections,
            max_sections=max_sections,
            max_chars=max_chars,
        )

    def extract_and_lookup(
        self,
        neon_source: str,
        max_sections: int | None = 8,
        max_chars: int | None = 12000,
    ) -> str:
        """Extract NEON intrinsics from source, look up their semantics,
        and return a formatted reference block for the LLM prompt.

        Args:
            neon_source: C source code containing NEON intrinsics

        Returns:
            Formatted string with op-semantics for all found intrinsics,
            ready to inject into the translation prompt.
        """
        names = self.extract_neon_names(neon_source)
        return self.lookup_neon_batch(
            names,
            max_sections=max_sections,
            max_chars=max_chars,
        )

    def lookup_rvv_batch(
        self,
        names: list[str],
        max_sections: int | None = 8,
        max_chars: int | None = 12000,
    ) -> str:
        """Look up multiple RVV intrinsics and return formatted reference.

        Args:
            names: List of RVV intrinsic names

        Returns:
            Formatted string with op-semantics for all found intrinsics.
        """
        if not names:
            return ""

        sections, found_names, missing_names = self._collect_sections(names, self.lookup_rvv)
        if missing_names:
            log.debug("No RVV op-semantics found for: %s", missing_names)
        if not sections:
            return ""

        return self._format_reference(
            "--- RVV Intrinsics Reference ---",
            found_names,
            sections,
            max_sections=max_sections,
            max_chars=max_chars,
        )

    def extract_rvv_and_lookup(
        self,
        rvv_source: str,
        max_sections: int | None = 8,
        max_chars: int | None = 12000,
    ) -> str:
        """Extract RVV intrinsics from source and return a prompt-ready block."""
        names = self.extract_rvv_names(rvv_source)
        return self.lookup_rvv_batch(
            names,
            max_sections=max_sections,
            max_chars=max_chars,
        )
