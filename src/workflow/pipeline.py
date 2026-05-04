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
import time
from datetime import datetime
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent  # src/workflow/ -> SALT/

from .config import Config, TranslationResult
from .prompts_pkg import (
    load_reference_docs,
    load_translation_prompt,
    build_compile_repair_prompt,
    build_execution_repair_prompt,
    build_verification_repair_prompt,
    build_intrinsics_tools,
)
from .status import StatusTracker

# ---------------------------------------------------------------------------
# Logging
# ---------------------------------------------------------------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S",
)
log = logging.getLogger("pipeline")

LOGS_DIR = PROJECT_ROOT / "logs"


def _setup_run_logging() -> Path:
    """Create a timestamped run directory under logs/ and add a file handler."""
    run_id = datetime.now().strftime("%Y%m%d_%H%M%S")
    run_dir = LOGS_DIR / run_id
    run_dir.mkdir(parents=True, exist_ok=True)

    # File handler for the full run log
    run_log = run_dir / "run.log"
    fh = logging.FileHandler(run_log)
    fh.setLevel(logging.DEBUG)
    fh.setFormatter(logging.Formatter("%(asctime)s [%(levelname)s] %(message)s", datefmt="%H:%M:%S"))
    logging.getLogger().addHandler(fh)

    log.info("Run log: %s", run_log)
    return run_dir


def _setup_kernel_logging(run_dir: Path, kernel_name: str) -> logging.FileHandler:
    """Add a per-kernel file handler. Returns the handler so it can be removed later."""
    kernel_dir = run_dir / kernel_name
    kernel_dir.mkdir(parents=True, exist_ok=True)

    kh = logging.FileHandler(kernel_dir / "kernel.log")
    kh.setLevel(logging.DEBUG)
    kh.setFormatter(logging.Formatter("%(asctime)s [%(levelname)s] %(message)s", datefmt="%H:%M:%S"))
    logging.getLogger().addHandler(kh)
    return kh


def _teardown_kernel_logging(handler: logging.FileHandler):
    """Remove and close a per-kernel file handler."""
    logging.getLogger().removeHandler(handler)
    handler.close()


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
    """Extract C code from LLM response, stripping markdown fences and any
    `#include` directives.  Salt's harness inlines the kernel source into
    a namespace block; upstream-style includes (e.g. `<riscv_vector.h>`,
    `"src/xnnpack/common.h"`) either don't resolve on salt's include path
    or duplicate symbols salt already shims, so they get dropped here."""
    match = re.search(r'```(?:c|cpp)?\n(.*?)```', response, re.DOTALL)
    code = match.group(1).strip() if match else response.strip()
    # Strip every `#include <...>` and `#include "..."` line.
    code = re.sub(r'^[ \t]*#\s*include\s+[<"][^>"]+[>"][ \t]*\n?',
                  '', code, flags=re.MULTILINE)
    return code.strip()


def find_kernels(source_dir: Path) -> list[Path]:
    """Find all kernel source files in the source directory."""
    patterns = ["*.c", "*.cpp"]
    files = []
    for pat in patterns:
        files.extend(source_dir.glob(pat))
    return sorted(files)


def find_kernel_by_name(source_dir: Path, name: str) -> Path | None:
    """Find a kernel file by name (without extension).

    Prefers exact match (name.c) over substring glob (*name*.c)
    to avoid e.g. 'qs8-vadd' matching 'qs8-vaddc.c'.
    """
    # 1. Exact match
    for ext in [".c", ".cpp"]:
        exact = source_dir / f"{name}{ext}"
        if exact.exists():
            return exact
    # 2. Substring glob fallback — pick shortest filename to prefer exact-ish matches
    for ext in [".c", ".cpp"]:
        matches = list(source_dir.glob(f"*{name}*{ext}"))
        if matches:
            return min(matches, key=lambda p: len(p.name))
    return None


# ---------------------------------------------------------------------------
# Translation
# ---------------------------------------------------------------------------

def _format_counterexample(ce: dict) -> str:
    """Format a bitwuzla counterexample as human-readable text for LLM repair."""
    lines = []
    batch = ce.get("batch", "?")
    fi = ce.get("fail_index", "?")
    lines.append(f"At batch={batch}, element index {fi} produces different outputs:")
    lines.append("")

    # Print inputs
    for k, v in ce.items():
        if k.endswith("_at_fail"):
            name = k.replace("_at_fail", "")
            lines.append(f"  {name}[{fi}] = {v}")
        elif k in ("input_b",):
            lines.append(f"  {k} = {v} (scalar broadcast)")

    lines.append("")
    neon_out = ce.get("neon_out", "?")
    rvv_out = ce.get("rvv_out", "?")
    lines.append(f"  NEON output[{fi}] = {neon_out}")
    lines.append(f"  RVV  output[{fi}] = {rvv_out}")
    lines.append("")
    lines.append(f"Expected: {neon_out}, Got: {rvv_out}")
    return "\n".join(lines)


def _run_formal_verification(kernel_path, output_path, kernel_name, cfg) -> dict | None:
    """Run bitwuzla-based formal verification on the kernel pair.

    Returns verification result dict, or None only if bitwuzla is not installed.
    Errors during verification are propagated as results, not swallowed.
    """
    try:
        from .verification.orchestrator import verify_kernel
    except ImportError:
        log.warning("Formal verification module not available")
        return None

    log.info("Starting formal verification for %s", kernel_name)

    # Use verification-specific LLM for buffer size inference if needed
    try:
        verification_llm = cfg.create_verification_llm_client()
    except Exception:
        verification_llm = None

    # 2D kernels (stride-based) cap at smaller max_batch since each batch is heavier.
    source_text = kernel_path.read_text()
    is_2d = "stride" in source_text and "channels" in source_text
    per_batch_timeout = cfg.verification_timeout
    if cfg.verification_batch > 0:
        # Single-batch mode — pin both ends.
        min_batch = max_batch = cfg.verification_batch
        log.info("  Single-batch mode: batch=%d", cfg.verification_batch)
    else:
        min_batch = 1
        max_batch = 64 if is_2d else 256
        if is_2d:
            log.info("  2D kernel detected — max_batch=%d", max_batch)

    result = verify_kernel(
        neon_path=str(kernel_path),
        rvv_path=str(output_path),
        kernel_name=kernel_name,
        vlen=256,
        per_batch_timeout=per_batch_timeout,
        max_batch=max_batch,
        min_batch=min_batch,
        backend=cfg.verification_backend,
        llm_client=verification_llm,
    )
    import json
    result_dict = json.loads(result.to_json())
    log.info("Formal verification complete: %s → %s",
             kernel_name, result_dict.get("verdict", "UNKNOWN"))
    return result_dict


def _call_llm(client, prompt: str, system: str, tools: dict, cfg: Config,
              temperature: float | None = None, thinking: str | None = None) -> str:
    """Call the LLM with or without tools. Returns raw response text."""
    temp = temperature if temperature is not None else cfg.temperature
    think = thinking if thinking is not None else cfg.thinking

    if tools:
        return client.chat_with_tools(
            prompt=prompt, tools=tools, system=system,
            temperature=temp, thinking=think,
        )
    else:
        return client.chat(
            prompt=prompt, system=system,
            temperature=temp, thinking=think,
        )


def _compile_and_run(kernel_name: str, cfg: Config):
    """Compile the kernel and optionally run on Spike. Returns (build_result, run_result)."""
    from .build import build_kernel, run_spike

    if not cfg.zephyr_base or not Path(cfg.zephyr_base).exists():
        log.info("Skipping compilation (zephyr not found at %s)", cfg.zephyr_base)
        return None, None

    log.info("Compiling %s...", kernel_name)
    build_result = build_kernel(kernel_name, zephyr_base=cfg.zephyr_base)

    if not build_result.success:
        return build_result, None

    log.info("Compilation passed (%.1fs)", build_result.elapsed)

    if not cfg.chipyard_path:
        log.info("Skipping Spike (CHIPYARD_PATH not set)")
        return build_result, None

    run_result = run_spike(kernel_name=kernel_name, chipyard_path=cfg.chipyard_path)
    return build_result, run_result


def translate_kernel(
    kernel_path: Path,
    cfg: Config,
    client,
    tools: dict[str, callable],
    tracker: StatusTracker,
) -> TranslationResult:
    """Translate a single kernel with compile/run repair loop.

    Flow:
        1. Initial LLM translation
        2. Compile → if fail, compilation repair (up to max_compile_retries)
        3. Run on Spike → if fail, execution repair (uses compile retry budget)
        4. Formal verification → if counterexample, verification repair (up to max_verification_retries)
    """
    kernel_name = kernel_path.stem
    log.info("Translating: %s", kernel_name)

    # Skip if already verified and skip_existing is set
    if cfg.skip_existing and tracker.is_verified(kernel_name):
        log.info("Skipping %s (already verified)", kernel_name)
        return TranslationResult(
            kernel_name=kernel_name, success=True,
            output_file=str(cfg.target_dir / kernel_path.name),
        )

    # 1. Read source
    source_code = kernel_path.read_text()
    log.info("Read source: %s (%d chars)", kernel_path.name, len(source_code))

    cfg.target_dir.mkdir(parents=True, exist_ok=True)
    output_path = cfg.target_dir / kernel_path.name

    if cfg.skip_translation:
        # Skip LLM, use existing target kernel
        if not output_path.exists():
            log.error("--skip-translation but target not found: %s", output_path)
            return TranslationResult(
                kernel_name=kernel_name, success=False, attempts=0,
                error=f"Target file not found: {output_path}",
            )
        translated_code = output_path.read_text()
        log.info("Skipping translation, using existing target: %s (%d chars)",
                 output_path, len(translated_code))
    else:
        # 2. Build initial translation prompts
        params_section = extract_params(source_code)
        if params_section:
            log.info("Extracted params struct (%d chars)", len(params_section))
        system_prompt = load_reference_docs(cfg.source, rules_only=cfg.rules_only)
        user_prompt = load_translation_prompt(cfg.source, source_code, params_section)

        # 3. Dry run check
        if cfg.dry_run:
            log.info("[DRY RUN] Would call LLM for %s", kernel_name)
            return TranslationResult(kernel_name=kernel_name, success=False)

        # 4. Initial translation
        try:
            log.info("Starting initial LLM translation for %s (model=%s, tools=%s)",
                     kernel_name, cfg.model, bool(tools))
            t0 = time.perf_counter()
            response = _call_llm(client, user_prompt, system_prompt, tools, cfg)
            elapsed = time.perf_counter() - t0
            translated_code = extract_code(response)
            log.info("Got translation: %d chars in %.1fs", len(translated_code), elapsed)
        except Exception as e:
            log.error("LLM call failed for %s: %s", kernel_name, e)
            tracker.update(kernel_name, generated=False, attempts=1, error=str(e))
            return TranslationResult(
                kernel_name=kernel_name, success=False, attempts=1, error=str(e),
            )

        output_path.write_text(translated_code)
        log.info("Wrote translation: %s", output_path)

    tracker.update(kernel_name, generated=True, attempts=1)

    # Pre-load reference docs for execution repairs (full docs, not rules-only)
    exec_system_prompt = load_reference_docs(cfg.source, rules_only=False)
    # Compilation repairs use only the target ISA intrinsics reference
    compile_system_prompt = load_reference_docs(cfg.source, rules_only=True)

    attempts = 1  # initial translation counts as attempt 1
    compile_attempts = 0
    verification_attempts = 0
    last_error = ""

    # Skip straight to verification if already compiled+passed and --skip-spike is set
    if cfg.skip_spike and tracker.get(kernel_name).get("compiled", False):
        log.info("Skipping compile+Spike for %s (already passed), jumping to verification", kernel_name)

        verify_result = _run_formal_verification(kernel_path, output_path, kernel_name, cfg)

        if verify_result is None:
            log.warning("Formal verification unavailable — skipping")
            tracker.update(kernel_name, compiled=True, attempts=attempts)
            return TranslationResult(
                kernel_name=kernel_name, success=True,
                attempts=attempts, output_file=str(output_path),
            )

        verdict = verify_result.get("verdict", "")
        max_batch = verify_result.get("max_verified_batch", 0)
        log.info("Formal verification: %s (max_batch=%d)", verdict, max_batch)

        if verdict in ("ALL_PASSED", "PARTIAL") and max_batch > 0:
            tracker.update(kernel_name, compiled=True, verified=True,
                           max_verified_batch=max_batch, attempts=attempts)
            return TranslationResult(
                kernel_name=kernel_name, success=True,
                attempts=attempts, output_file=str(output_path),
            )

        if verdict != "COUNTEREXAMPLE":
            log.warning("Formal verification: %s — accepting based on prior Spike pass", verdict)
            tracker.update(kernel_name, compiled=True, attempts=attempts)
            return TranslationResult(
                kernel_name=kernel_name, success=True,
                attempts=attempts, output_file=str(output_path),
            )

        # COUNTEREXAMPLE — fall through to the repair loop below

    while True:
        # --- Compile ---
        build_result, run_result = _compile_and_run(kernel_name, cfg)

        if build_result is None:
            # No Zephyr available — translation succeeded, just untested
            tracker.update(kernel_name, generated=True, attempts=attempts)
            return TranslationResult(
                kernel_name=kernel_name, success=True,
                attempts=attempts, output_file=str(output_path),
            )

        if not build_result.success:
            compile_attempts += 1
            if compile_attempts > cfg.max_compile_retries:
                log.error("Exhausted %d compile repair attempts for %s",
                          cfg.max_compile_retries, kernel_name)
                last_error = f"compile_error: {build_result.error}"
                break

            last_error = f"compile_error: {build_result.error}"
            attempts += 1
            log.error("Compile repair %d/%d: compilation failed for %s",
                      compile_attempts, cfg.max_compile_retries, kernel_name)

            # Compilation repair: higher temp, no thinking, minimal context
            repair_prompt = build_compile_repair_prompt(
                cfg.source, translated_code, build_result.error,
            )
            try:
                response = _call_llm(
                    client, repair_prompt, compile_system_prompt, {},
                    cfg, temperature=cfg.repair_temperature, thinking=None,
                )
                translated_code = extract_code(response)
                output_path.write_text(translated_code)
                log.info("Compile repair %d/%d: wrote repair (%d chars)",
                         compile_attempts, cfg.max_compile_retries, len(translated_code))
                continue  # retry compile
            except Exception as e:
                log.error("Compile repair LLM call failed: %s", e)
                last_error = str(e)
                break

        # --- Run on Spike ---
        if run_result is None:
            # No Spike available — compiled OK, just not run-tested
            tracker.update(kernel_name, compiled=True, attempts=attempts)
            return TranslationResult(
                kernel_name=kernel_name, success=True,
                attempts=attempts, output_file=str(output_path),
            )

        if run_result.passed:
            log.info("Spike: PASS (%.1fs)", run_result.elapsed)

            # --- Formal verification via bitwuzla ---
            verify_result = _run_formal_verification(
                kernel_path, output_path, kernel_name, cfg)

            if verify_result is None:
                # Verification not available (bitwuzla not installed, etc.)
                log.warning("Formal verification unavailable — skipping")
                tracker.update(kernel_name, compiled=True, attempts=attempts)
                return TranslationResult(
                    kernel_name=kernel_name, success=True,
                    attempts=attempts, output_file=str(output_path),
                )

            verdict = verify_result.get("verdict", "")
            log.info("Formal verification: %s (max_batch=%d)",
                     verdict, verify_result.get("max_verified_batch", 0))

            max_batch = verify_result.get("max_verified_batch", 0)

            if verdict in ("ALL_PASSED", "PARTIAL") and max_batch > 0:
                # Bounded verification succeeded up to max_batch
                tracker.update(kernel_name, compiled=True, verified=True,
                               max_verified_batch=max_batch, attempts=attempts)
                return TranslationResult(
                    kernel_name=kernel_name, success=True,
                    attempts=attempts, output_file=str(output_path),
                )

            if verdict == "COUNTEREXAMPLE":
                verification_attempts += 1
                if verification_attempts > cfg.max_verification_retries:
                    log.error("Exhausted %d verification repair attempts for %s",
                              cfg.max_verification_retries, kernel_name)
                    ce = verify_result.get("counterexample", {})
                    last_error = f"formal_verification_counterexample: {_format_counterexample(ce)}"
                    break

                # Formal verification found a bug that Spike missed
                ce = verify_result.get("counterexample", {})
                ce_text = _format_counterexample(ce)
                last_error = f"formal_verification_counterexample: {ce_text}"
                attempts += 1
                log.error("Verification repair %d/%d: COUNTEREXAMPLE:\n%s",
                          verification_attempts, cfg.max_verification_retries, ce_text)

                # Repair using the verification-specific prompt
                repair_prompt = build_verification_repair_prompt(
                    cfg.source, source_code, translated_code, ce_text,
                )
                try:
                    response = _call_llm(
                        client, repair_prompt, exec_system_prompt, {},
                        cfg, temperature=1.0, thinking="medium",
                    )
                    translated_code = extract_code(response)
                    output_path.write_text(translated_code)
                    log.info("Verification repair %d/%d: wrote repair (%d chars)",
                             verification_attempts, cfg.max_verification_retries, len(translated_code))
                    # Reset compile attempts since verification repair may introduce compile errors
                    compile_attempts = 0
                    continue  # retry compile + run + verify
                except Exception as e:
                    log.error("Verification repair LLM call failed: %s", e)
                    last_error = str(e)
                    break

            # Other verdicts (COMPILE_ERROR, MISSING_INTRINSIC, etc.)
            # Treat as non-blocking — Spike already passed
            log.warning("Formal verification: %s — accepting based on Spike pass", verdict)
            tracker.update(kernel_name, compiled=True, attempts=attempts)
            return TranslationResult(
                kernel_name=kernel_name, success=True,
                attempts=attempts, output_file=str(output_path),
            )

        # Execution failure — wrong output or crash/timeout
        compile_attempts += 1
        if compile_attempts > cfg.max_compile_retries:
            log.error("Exhausted %d compile/execution repair attempts for %s",
                      cfg.max_compile_retries, kernel_name)
            last_error = (f"wrong_output: {run_result.output}" if run_result.success
                          else f"runtime_error: {run_result.error}")
            break

        if run_result.success:
            last_error = f"wrong_output: {run_result.output}"
            log.warning("Compile repair %d/%d: Spike FAIL (wrong output)",
                        compile_attempts, cfg.max_compile_retries)
        else:
            last_error = f"runtime_error: {run_result.error}"
            log.error("Compile repair %d/%d: Spike error: %s",
                      compile_attempts, cfg.max_compile_retries, run_result.error[:200])

        # Execution repair: thinking=medium, temp=1.0, full reference docs + NEON source
        attempts += 1
        error_for_prompt = run_result.output if run_result.success else run_result.error
        repair_prompt = build_execution_repair_prompt(
            cfg.source, source_code, translated_code, error_for_prompt,
        )
        try:
            response = _call_llm(
                client, repair_prompt, exec_system_prompt, {},
                cfg, temperature=1.0, thinking="medium",
            )
            translated_code = extract_code(response)
            output_path.write_text(translated_code)
            log.info("Compile repair %d/%d: wrote execution repair (%d chars)",
                     compile_attempts, cfg.max_compile_retries, len(translated_code))
            continue  # retry compile + run
        except Exception as e:
            log.error("Execution repair LLM call failed: %s", e)
            last_error = str(e)
            break

    # If we reach here, retries were exhausted or an error broke the loop
    tracker.update(kernel_name, attempts=attempts, error=last_error)
    return TranslationResult(
        kernel_name=kernel_name, success=False,
        attempts=attempts, output_file=str(output_path),
        error=last_error,
    )


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(description="SALTy-RN Translation Pipeline")

    # What to translate
    g = p.add_mutually_exclusive_group(required=True)
    g.add_argument("-k", "--kernel", type=str, help="Kernel name to translate (e.g. f32-vmulc)")
    g.add_argument("-f", "--file", type=Path, help="Path to a specific source kernel file")
    g.add_argument("-b", "--batch", action="store_true", help="Translate all kernels in source dir")

    # Translation config
    p.add_argument("--source", default="Neon", help="Source ISA (default: Neon)")
    p.add_argument("--target", default="RVV", help="Target ISA (default: RVV)")
    p.add_argument("--model", default="gemini-3.1-pro-preview-customtools",
                    help="LLM model (provider::model format)")
    p.add_argument("--temperature", type=float, default=0.1)
    p.add_argument("--repair-temperature", type=float, default=0.3)
    p.add_argument("--thinking", default="none",
                    help="Gemini thinking level (low/medium/high/none)")
    p.add_argument("--max-compile-retries", type=int, default=5,
                    help="Max repair attempts for compile/execution errors")
    p.add_argument("--max-verification-retries", type=int, default=5,
                    help="Max repair attempts for formal verification failures")
    p.add_argument("--backend", choices=["bitwuzla", "cvc5"], default="bitwuzla",
                    help="SMT backend for formal verification (cvc5 is much faster on f16 chained-FMA)")
    p.add_argument("--verification-timeout", type=int, default=600,
                    help="Per-batch verification timeout in seconds (also enforced inside the solver via tlimit-per). Default: 600 (10 min).  0 = no timeout (run until cvc5 returns).")
    p.add_argument("--verify-batch", type=int, default=0,
                    help="Run ONLY this batch size in verification (skip the 1..max sweep). 0 = sweep (default).")

    # Build / simulation
    p.add_argument("--zephyr-base", default="", help="Path to Zephyr SDK")
    p.add_argument("--chipyard-path", default="", help="Path to Chipyard (for Spike)")

    # Directories
    p.add_argument("--kernels-dir", type=Path, default=None,
                    help="Override kernels directory")

    # Flags
    p.add_argument("--dry-run", action="store_true", help="Show what would be done")
    p.add_argument("--skip-existing", action="store_true",
                    help="Skip already-generated kernels")
    p.add_argument("--tools", action="store_true",
                    help="Enable intrinsics search tools (model can look up op-semantics)")
    p.add_argument("--rules-only", action="store_true",
                    help="Only include translation rules as reference (skip background docs)")
    p.add_argument("--skip-translation", action="store_true",
                    help="Skip LLM translation, start from compile+run+verify using existing target kernel")
    p.add_argument("--skip-spike", action="store_true",
                    help="Skip compile+Spike if kernel already passed (compiled=true in status.json)")

    return p


def main():
    parser = build_parser()
    args = parser.parse_args()

    if args.thinking == "none":
        args.thinking = None

    cfg = Config.from_env_and_args(args)
    run_dir = _setup_run_logging()

    log.info("Pipeline config: source=%s target=%s model=%s", cfg.source, cfg.target, cfg.model)
    log.info("Directories: source=%s target=%s", cfg.source_dir, cfg.target_dir)

    client = None if cfg.dry_run else cfg.create_llm_client()
    tools = {}
    if not cfg.dry_run and args.tools:
        if client.supports_tools:
            tools = build_intrinsics_tools()
        else:
            log.warning("Provider '%s' does not support tool calling — tools disabled",
                        client.provider)
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

    results = []
    for kernel_path in kernel_files:
        kh = _setup_kernel_logging(run_dir, kernel_path.stem)
        result = translate_kernel(kernel_path, cfg, client, tools, tracker)
        _teardown_kernel_logging(kh)
        results.append(result)

    total = len(results)
    success = sum(1 for r in results if r.success)
    log.info("Done: %d/%d translations succeeded", success, total)
    log.info("Status: %s", tracker.summary())


if __name__ == "__main__":
    main()
