#!/usr/bin/env python3
"""
SALTy-RN: LLM Translation Pipeline

Automates the translation of SIMD kernels between ISAs (e.g. ARM Neon -> RVV)
using an LLM, with status tracking and iterative error repair.

Usage:
    python pipeline.py --kernel f32-vmulc
    python pipeline.py --kernel f32-vmulc --source Neon --target RVV
    python pipeline.py --kernel f32-vmulc --model openai::gpt-4o
    python pipeline.py --batch --skip-existing
    python pipeline.py --kernel f32-vmulc --dry-run

Environment Variables:
    GOOGLE_CLOUD_PROJECT  - GCP project ID for Vertex AI
    GOOGLE_CLOUD_LOCATION - GCP region (default: us-central1)
    GOOGLE_API_KEY        - Google AI API key (alternative to Vertex AI)
    OPENAI_API_KEY        - OpenAI API key
    ANTHROPIC_API_KEY     - Anthropic API key
    TOGETHER_API_KEY      - Together AI API key
    AWS_ACCESS_KEY_ID     - AWS access key for Bedrock
    AWS_SECRET_ACCESS_KEY - AWS secret key for Bedrock
    AWS_REGION            - AWS region (default: us-west-2)
    ZEPHYR_BASE           - Path to Zephyr SDK installation
    SPIKE_PATH            - Path to Spike simulator binary (optional)
"""

import argparse
import logging
import re
import sys
from pathlib import Path

# ---------------------------------------------------------------------------
# Add src/workflow/ to sys.path so sibling imports work
# ---------------------------------------------------------------------------
SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent  # src/workflow/ -> SALT/
sys.path.insert(0, str(SCRIPT_DIR))

from config import Config, TranslationResult
from agents import load_reference_docs, load_translation_prompt
from intrinsics_tools import build_intrinsics_tools
from status import StatusTracker

# ---------------------------------------------------------------------------
# Logging
# ---------------------------------------------------------------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S",
)
log = logging.getLogger("pipeline")


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def extract_params(source_code: str) -> str:
    """Extract the parameter struct comment from the top of a kernel file.

    Expects a block comment like:
        /* struct xnn_qs8_add_minmax_params { ... }; */
    """
    match = re.search(r'/\*\s*(struct\s+\w+.*?)\*/', source_code, re.DOTALL)
    if match:
        return match.group(1).strip()
    return ""


def extract_code(response: str) -> str:
    """Extract C code from LLM response, stripping markdown fences if present."""
    # Try to extract from ```c ... ``` blocks
    match = re.search(r'```(?:c|cpp)?\n(.*?)```', response, re.DOTALL)
    if match:
        return match.group(1).strip()
    # If no fences, assume the whole response is code
    return response.strip()


def find_kernels(source_dir: Path) -> list[Path]:
    """Find all kernel source files in the source directory."""
    patterns = ["*.c", "*.cpp"]
    files = []
    for pat in patterns:
        files.extend(source_dir.glob(pat))
    return sorted(files)


def find_kernel_by_name(source_dir: Path, name: str) -> Path | None:
    """Find a kernel file by name (without extension)."""
    for ext in [".c", ".cpp"]:
        for pattern in [f"*{name}*{ext}"]:
            matches = list(source_dir.glob(pattern))
            if matches:
                return matches[0]
    return None


# ---------------------------------------------------------------------------
# Translation
# ---------------------------------------------------------------------------

def translate_kernel(
    kernel_path: Path,
    cfg: Config,
    client,
    tools: dict[str, callable],
    tracker: StatusTracker,
) -> TranslationResult:
    """Translate a single kernel file from source ISA to target ISA.

    The model can call intrinsics search tools during translation to
    look up NEON/RVV operation semantics as needed.

    Steps:
        1. Read source kernel
        2. Build translation prompt
        3. Call LLM with tools (model decides when to search intrinsics)
        4. Write output to target dir
        5. Update status
    """
    kernel_name = kernel_path.stem
    log.info("Translating: %s", kernel_name)

    # Skip if already translated and skip_existing is set
    if cfg.skip_existing and tracker.is_translated(kernel_name):
        log.info("Skipping %s (already translated)", kernel_name)
        return TranslationResult(
            kernel_name=kernel_name, success=True,
            output_file=str(cfg.target_dir / kernel_path.name),
        )

    # 1. Read source
    source_code = kernel_path.read_text()
    log.info("Read source: %s (%d chars)", kernel_path.name, len(source_code))

    # 2. Build prompts
    params_section = extract_params(source_code)
    if params_section:
        log.info("Extracted params struct (%d chars)", len(params_section))
    system_prompt = load_reference_docs(cfg.source, rules_only=cfg.rules_only)
    user_prompt = load_translation_prompt(cfg.source, source_code, params_section)

    # 3. Dry run check
    if cfg.dry_run:
        log.info("[DRY RUN] Would call LLM for %s", kernel_name)
        log.info("[DRY RUN] System prompt: %d chars", len(system_prompt))
        log.info("[DRY RUN] User prompt: %d chars", len(user_prompt))
        log.info("[DRY RUN] Tools: %s", "disabled" if not tools else list(tools.keys()))
        return TranslationResult(kernel_name=kernel_name, success=False)

    # 4. Call LLM
    try:
        if tools:
            log.info("Calling LLM with tools: model=%s thinking=%s tools=%s",
                     cfg.model, cfg.thinking, list(tools.keys()))
            response = client.chat_with_tools(
                prompt=user_prompt,
                tools=tools,
                system=system_prompt,
                temperature=cfg.temperature,
                thinking=cfg.thinking,
            )
        else:
            log.info("Calling LLM (no tools): model=%s thinking=%s",
                     cfg.model, cfg.thinking)
            response = client.chat(
                prompt=user_prompt,
                system=system_prompt,
                temperature=cfg.temperature,
                thinking=cfg.thinking,
            )
        translated_code = extract_code(response)
        log.info("Got translation: %d chars", len(translated_code))
    except Exception as e:
        log.error("LLM call failed for %s: %s", kernel_name, e)
        tracker.update(kernel_name, translated=False, attempts=1, error=str(e))
        return TranslationResult(
            kernel_name=kernel_name, success=False,
            attempts=1, error=str(e),
        )

    # 6. Write output
    cfg.target_dir.mkdir(parents=True, exist_ok=True)
    output_path = cfg.target_dir / kernel_path.name
    output_path.write_text(translated_code)
    log.info("Wrote translation: %s", output_path)

    # 7. Update status
    tracker.update(kernel_name, translated=True, attempts=1)

    return TranslationResult(
        kernel_name=kernel_name,
        success=True,
        attempts=1,
        output_file=str(output_path),
    )


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(description="SALTy-RN Translation Pipeline")

    # What to translate
    g = p.add_mutually_exclusive_group(required=True)
    g.add_argument("--kernel", type=str, help="Kernel name to translate (e.g. f32-vmulc)")
    g.add_argument("--file", type=Path, help="Path to a specific source kernel file")
    g.add_argument("--batch", action="store_true", help="Translate all kernels in source dir")

    # Translation config
    p.add_argument("--source", default="Neon", help="Source ISA (default: Neon)")
    p.add_argument("--target", default="RVV", help="Target ISA (default: RVV)")
    p.add_argument("--model", default="gemini-3.1-pro-preview-customtools",
                    help="LLM model (provider::model format)")
    p.add_argument("--temperature", type=float, default=0.1)
    p.add_argument("--repair-temperature", type=float, default=0.3)
    p.add_argument("--thinking", default="none",
                    help="Gemini thinking level (low/medium/high/none)")
    p.add_argument("--max-retries", type=int, default=5)

    # Build / simulation
    p.add_argument("--zephyr-base", default="", help="Path to Zephyr SDK")
    p.add_argument("--spike-path", default="", help="Path to Spike simulator")

    # Directories
    p.add_argument("--kernels-dir", type=Path, default=None,
                    help="Override kernels directory")

    # Flags
    p.add_argument("--dry-run", action="store_true", help="Show what would be done")
    p.add_argument("--skip-existing", action="store_true",
                    help="Skip already-translated kernels")
    p.add_argument("--tools", action="store_true",
                    help="Enable intrinsics search tools (model can look up op-semantics)")
    p.add_argument("--rules-only", action="store_true",
                    help="Only include translation rules as reference (skip background docs)")

    return p


def main():
    parser = build_parser()
    args = parser.parse_args()

    # Handle --thinking none
    if args.thinking == "none":
        args.thinking = None

    # Build config
    cfg = Config.from_env_and_args(args)

    log.info("Pipeline config: source=%s target=%s model=%s", cfg.source, cfg.target, cfg.model)
    log.info("Directories: source=%s target=%s", cfg.source_dir, cfg.target_dir)

    # Init components
    client = cfg.create_llm_client()
    if args.tools and client.supports_tools:
        tools = build_intrinsics_tools()
    elif args.tools and not client.supports_tools:
        log.warning("Provider '%s' does not support tool calling — tools disabled",
                    client.provider)
        tools = {}
    else:
        tools = {}
    tracker = StatusTracker(cfg.status_file)

    log.info("Tools: %s", "disabled" if not tools else list(tools.keys()))

    # Determine which kernels to translate
    if args.file:
        kernel_files = [args.file]
    elif args.kernel:
        match = find_kernel_by_name(cfg.source_dir, args.kernel)
        if not match:
            log.error("Kernel '%s' not found in %s", args.kernel, cfg.source_dir)
            sys.exit(1)
        kernel_files = [match]
    else:  # --batch
        kernel_files = find_kernels(cfg.source_dir)
        if not kernel_files:
            log.error("No kernel files found in %s", cfg.source_dir)
            sys.exit(1)
        log.info("Batch mode: found %d kernels", len(kernel_files))

    # Translate
    results = []
    for kernel_path in kernel_files:
        result = translate_kernel(kernel_path, cfg, client, tools, tracker)
        results.append(result)

    # Summary
    total = len(results)
    success = sum(1 for r in results if r.success)
    log.info("Done: %d/%d translations succeeded", success, total)
    log.info("Status: %s", tracker.summary())


if __name__ == "__main__":
    main()
