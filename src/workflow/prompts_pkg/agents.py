"""Prompt loading and template building for the translation pipeline.

Prompts are organized by source language under prompts/<source>/:
    prompts/Neon/prompt.md              - translation prompt template
    prompts/Neon/source_background.md   - source ISA reference
    prompts/Neon/target_background.md   - target ISA reference
    prompts/Neon/translation_rules.md   - correctness rules
    prompts/Neon/example_translation.md - annotated examples
    prompts/Neon/compilation_repair.md  - repair prompt template

To add a new source language (e.g. RVV -> Neon), create prompts/RVV/
with the same file structure.
"""

import logging
from pathlib import Path

log = logging.getLogger("pipeline")

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent.parent  # src/workflow/prompts_pkg/ -> SALT/
PROMPTS_DIR = PROJECT_ROOT / "prompts"

# Standard prompt files expected in each source language directory
_REFERENCE_DOCS = [
    ("translation_rules.md", "Translation Rules"),
    ("source_background.md", "Source ISA Reference"),
    ("target_background.md", "Target ISA Reference"),
    ("example_translation.md", "Annotated Translation Examples"),
]


class PromptFileNotFound(FileNotFoundError):
    """Raised when a required prompt file is missing."""


def _source_dir(source: str) -> Path:
    """Return the prompt directory for a given source language."""
    d = PROMPTS_DIR / source
    if not d.is_dir():
        raise PromptFileNotFound(
            f"No prompt directory for source '{source}': expected {d}"
        )
    return d


def _load_file(path: Path) -> str:
    """Load a file, raising PromptFileNotFound if missing."""
    if not path.exists():
        raise PromptFileNotFound(f"Required prompt file not found: {path}")
    return path.read_text()


def load_reference_docs(source: str, rules_only: bool = False) -> str:
    """Load and concatenate the reference documents for a source language.

    Args:
        source: Source language directory name (e.g. "Neon")
        rules_only: If True, only load translation_rules.md
    """
    src_dir = _source_dir(source)
    docs_to_load = (
        [("translation_rules.md", "Translation Rules")]
        if rules_only
        else _REFERENCE_DOCS
    )
    docs = []
    for name, label in docs_to_load:
        path = src_dir / name
        if path.exists():
            docs.append(f"--- {label} ---\n{path.read_text()}")
        else:
            log.warning("Reference doc not found, skipping: %s", path)
    return "\n\n".join(docs)


def load_translation_prompt(
    source: str,
    source_code: str,
    params_section: str,
) -> str:
    """Load and fill the translation prompt template.

    Args:
        source: Source language directory name (e.g. "Neon")
        source_code: The source code to translate
        params_section: Parameter struct description
    """
    src_dir = _source_dir(source)
    template = _load_file(src_dir / "prompt.md")
    return (
        template
        .replace("{source_code}", source_code)
        .replace("{parameter}", params_section)
    )


def build_compile_repair_prompt(
    source: str,
    translated_code: str,
    error: str,
) -> str:
    """Fill the compilation repair prompt (no NEON source needed).

    Args:
        source: Source language directory name (e.g. "Neon")
        translated_code: The failed translated code
        error: Compilation error message
    """
    src_dir = _source_dir(source)
    template = _load_file(src_dir / "compilation_repair.md")
    return (
        template
        .replace("{target_code}", translated_code)
        .replace("{error}", error)
    )


def build_execution_repair_prompt(
    source: str,
    source_code: str,
    translated_code: str,
    error: str,
) -> str:
    """Fill the execution repair prompt (includes NEON source as ground truth).

    Args:
        source: Source language directory name (e.g. "Neon")
        source_code: The original source code
        translated_code: The failed translated code
        error: Execution/verification failure message
    """
    src_dir = _source_dir(source)
    template = _load_file(src_dir / "execution_repair.md")
    return (
        template
        .replace("{source_code}", source_code)
        .replace("{target_code}", translated_code)
        .replace("{error}", error)
    )


if __name__ == "__main__":
    import argparse

    p = argparse.ArgumentParser(description="Preview prompts")
    p.add_argument("--source", default="Neon")
    p.add_argument("--rules-only", action="store_true")
    p.add_argument("--type", choices=["reference", "translation", "repair"], default="reference")
    args = p.parse_args()

    if args.type == "reference":
        print(load_reference_docs(args.source, rules_only=args.rules_only))
    elif args.type == "translation":
        print(load_translation_prompt(args.source, "<source_code>", "<params>"))
    elif args.type == "repair":
        print(build_repair_prompt(args.source, "<source_code>", "<target_code>", "<error>"))
