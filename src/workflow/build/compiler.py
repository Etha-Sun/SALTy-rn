"""Zephyr compilation and Spike execution for kernel validation.

Handles:
    - Copying harness into build directory
    - Building kernels via west/Zephyr toolchain
    - Running compiled ELF on Spike simulator
    - Parsing build errors and Spike output
"""

import logging
import re
import shutil
import subprocess
import time
from dataclasses import dataclass
from pathlib import Path

log = logging.getLogger("pipeline")

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent.parent  # src/workflow/build/ -> SALT/

# Defaults
DEFAULT_ZEPHYR_BASE = PROJECT_ROOT / "third_party" / "zephyr"
DEFAULT_CHIPYARD_PATH = ""  # e.g. /scratch/kchern2/chipyard
DEFAULT_TEMPLATE_DIR = PROJECT_ROOT / "build" / "templates" / "xnnpack-kernel" / "app"
DEFAULT_SLOTS_DIR = PROJECT_ROOT / "build" / "slots"
DEFAULT_HARNESS_DIR = PROJECT_ROOT / "kernels" / "harness"
DEFAULT_SPIKE_ISA = "rv64gcv_zfh_zfhmin_zvfh_zvfhmin_zvl512b_zicntr"
DEFAULT_SPIKE_TIMEOUT = 15

# Pre-compiled regexes for error extraction
_NOISE_RE = re.compile(r"(^FAILED:|^ninja:|^FATAL ERROR:|^\s*\^)")


@dataclass
class BuildResult:
    """Result of a Zephyr west build."""
    success: bool
    error: str = ""
    elapsed: float = 0.0


@dataclass
class RunResult:
    """Result of a Spike simulation run."""
    success: bool
    output: str = ""
    error: str = ""
    passed: bool = False  # harness printed PASS
    elapsed: float = 0.0


_ERROR_RE = re.compile(r"(: error:|: fatal error:|undefined reference)")
_CONTEXT_RE = re.compile(r"(In file included from|In function|: note:)")


def _extract_compile_errors(raw: str) -> str:
    """Pull compiler diagnostics from a cmake/ninja build log.

    Prioritizes actual error lines over include-stack context to avoid
    truncating real errors when the include stack is deep.
    Falls back to the last 30 short lines if no diagnostics match.
    """
    lines = raw.splitlines()

    errors = [l for l in lines
              if _ERROR_RE.search(l) and len(l) < 500 and not _NOISE_RE.search(l)]
    context = [l for l in lines
               if _CONTEXT_RE.search(l) and len(l) < 500 and not _NOISE_RE.search(l)]

    if errors:
        # Errors first (budgeted 2500 chars), then context with remaining space
        error_block = "\n".join(errors)[:2500]
        remaining = 3000 - len(error_block) - 1
        if remaining > 0 and context:
            # Only keep the last few context lines (closest to the error)
            ctx_block = "\n".join(context[-5:])[:remaining]
            return ctx_block + "\n" + error_block
        return error_block

    # Fallback: short lines, skip gcc commands and cmake noise
    useful = [l for l in lines if l.strip() and len(l) < 500
              and not l.startswith("--") and not l.startswith("[")]
    if useful:
        return "\n".join(useful[-30:])[:3000]

    return raw[-1500:]


def _get_build_slot(slot_id: int = 0,
                     template_dir: Path = DEFAULT_TEMPLATE_DIR,
                     slots_dir: Path = DEFAULT_SLOTS_DIR) -> tuple[Path, Path]:
    """Get or create a build slot from the template.

    Returns (app_dir, build_dir) for the slot.
    If the slot doesn't exist, copies the template into it.
    If the slot exists, reuses it (no copy, no pristine build needed).
    """
    slot_dir = slots_dir / f"slot_{slot_id}"
    app_dir = slot_dir / "app"
    build_dir = slot_dir / "build"

    if not app_dir.exists():
        if not template_dir.exists():
            raise FileNotFoundError(
                f"Zephyr app template not found at {template_dir}. "
                f"Create it with CMakeLists.txt, prj.conf, and src/ directory.")
        log.info("Creating build slot %d from template: %s -> %s",
                 slot_id, template_dir, slot_dir)
        slot_dir.mkdir(parents=True, exist_ok=True)
        shutil.copytree(template_dir, app_dir)
    else:
        log.info("Reusing existing build slot %d: %s", slot_id, slot_dir)

    build_dir.mkdir(parents=True, exist_ok=True)
    return app_dir, build_dir


def _has_cached_build(build_dir: Path) -> bool:
    """Check if a previous build exists that can be incrementally updated."""
    return (build_dir / "build.ninja").exists() or (build_dir / "Makefile").exists()


def _install_harness(kernel_name: str, harness_dir: Path, app_dir: Path) -> bool:
    """Copy the kernel's harness into app/src/main.c for compilation."""
    harness = harness_dir / f"{kernel_name}.c"
    if not harness.exists():
        log.error("Harness not found: %s", harness)
        return False

    dest = app_dir / "src" / "main.c"
    shutil.copy2(harness, dest)
    log.info("Installed harness: %s -> %s", harness.name, dest)
    return True


def build_kernel(
    kernel_name: str,
    zephyr_base: Path | str = DEFAULT_ZEPHYR_BASE,
    slot_id: int = 0,
    harness_dir: Path = DEFAULT_HARNESS_DIR,
) -> BuildResult:
    """Copy harness into place and compile via west build.

    Uses build slot system: template is copied to slot on first use,
    reused on subsequent builds (incremental, no pristine).
    """
    zephyr_base = Path(zephyr_base)
    app_dir, build_dir = _get_build_slot(slot_id)

    if not _install_harness(kernel_name, harness_dir, app_dir):
        return BuildResult(success=False, error=f"Harness not found for '{kernel_name}'")

    pristine_flag = "" if _has_cached_build(build_dir) else "-p"
    log.info("Building %s: pristine=%s", kernel_name, bool(pristine_flag))

    # Build log goes under logs/builds/<kernel>/<timestamp>.log
    from datetime import datetime
    logs_dir = PROJECT_ROOT / "logs" / "builds" / kernel_name
    logs_dir.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    build_log = logs_dir / f"{timestamp}.log"

    cmd = (
        f"cd {zephyr_base} && "
        f"source scripts/set_envvars_sdk.sh && "
        f"source tools/miniforge3/etc/profile.d/conda.sh && "
        f"conda activate zephyr && "
        f"west build {pristine_flag} -b spike_riscv64 "
        f"-d {build_dir} {app_dir} "
        f"-DXNNPACK_ENABLE_RISCV_VECTOR=ON "
        f"-DXNNPACK_ENABLE_RISCV_GEMMINI=OFF"
    )

    t0 = time.perf_counter()
    try:
        with open(build_log, "w") as logf:
            returncode = subprocess.call(
                cmd, shell=True, executable="/bin/bash",
                stdout=logf, stderr=logf, timeout=300,
            )
        elapsed = time.perf_counter() - t0

        raw = build_log.read_text() if build_log.exists() else ""

        if returncode != 0:
            error = _extract_compile_errors(raw)
            log.error("Build failed (%.1fs): %s", elapsed, build_log)
            return BuildResult(success=False, error=error, elapsed=elapsed)

        log.info("Build succeeded in %.1fs", elapsed)
        return BuildResult(success=True, elapsed=elapsed)

    except subprocess.TimeoutExpired:
        elapsed = time.perf_counter() - t0
        partial = ""
        if build_log.exists():
            partial = _extract_compile_errors(build_log.read_text())
        return BuildResult(success=False, error=f"Build timed out (300s)\n{partial}", elapsed=elapsed)
    except Exception as e:
        elapsed = time.perf_counter() - t0
        return BuildResult(success=False, error=str(e), elapsed=elapsed)


def run_spike(
    kernel_name: str = "",
    build_dir: Path = None,
    chipyard_path: str = DEFAULT_CHIPYARD_PATH,
    isa: str = DEFAULT_SPIKE_ISA,
    timeout: int = DEFAULT_SPIKE_TIMEOUT,
) -> RunResult:
    """Run the compiled ELF on Spike simulator.

    Output is written to a log file so partial output is preserved on timeout.
    """
    if build_dir is None:
        _, build_dir = _get_build_slot(0)
    elf_path = build_dir / "zephyr" / "zephyr.elf"
    if not elf_path.exists():
        return RunResult(success=False, error=f"ELF not found: {elf_path}")

    if not chipyard_path:
        return RunResult(success=False, error="CHIPYARD_PATH not set")

    # Spike log goes alongside the build logs
    name = kernel_name or "unknown"
    logs_dir = PROJECT_ROOT / "logs" / "builds" / name
    logs_dir.mkdir(parents=True, exist_ok=True)
    from datetime import datetime
    spike_log = logs_dir / f"spike_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"

    cmd = (
        f"cd {chipyard_path} && "
        f"source env.sh && "
        f"spike --isa={isa} {elf_path}"
    )
    log.info("Running Spike: isa=%s elf=%s", isa, elf_path)

    t0 = time.perf_counter()
    try:
        with open(spike_log, "w") as logf:
            proc = subprocess.Popen(
                cmd, shell=True, executable="/bin/bash",
                stdout=logf, stderr=subprocess.STDOUT,
            )
            try:
                proc.wait(timeout=timeout)
            except subprocess.TimeoutExpired:
                proc.kill()
                proc.wait()

        elapsed = time.perf_counter() - t0
        output = spike_log.read_text() if spike_log.exists() else ""

        # Timed out
        if proc.returncode == -9 or proc.returncode is None:
            log.error("Spike timed out (%.1fs): %s", elapsed, spike_log)
            return RunResult(
                success=False, output=output,
                error=f"Spike timed out ({timeout}s). Partial output:\n{output[-2000:]}",
                elapsed=elapsed,
            )

        # Crashed (non-zero exit)
        if proc.returncode != 0:
            log.error("Spike failed (%.1fs, exit=%d): %s",
                      elapsed, proc.returncode, spike_log)
            return RunResult(
                success=False, output=output, error=output[-2000:], elapsed=elapsed,
            )

        # Completed — check for PASS/FAIL
        passed = "PASS" in output
        failed = "FAIL" in output

        if passed:
            log.info("Spike: PASS (%.1fs)", elapsed)
        elif failed:
            log.warning("Spike: FAIL (%.1fs)\n%s", elapsed, output[-2000:])
        else:
            log.warning("Spike: no PASS/FAIL in output (%.1fs)", elapsed)

        return RunResult(
            success=True, output=output, passed=passed, elapsed=elapsed,
        )

    except Exception as e:
        elapsed = time.perf_counter() - t0
        return RunResult(success=False, error=str(e), elapsed=elapsed)


def compile_and_run(
    kernel_name: str,
    zephyr_base: Path | str = DEFAULT_ZEPHYR_BASE,
    chipyard_path: str = DEFAULT_CHIPYARD_PATH,
    slot_id: int = 0,
    harness_dir: Path = DEFAULT_HARNESS_DIR,
    spike_isa: str = DEFAULT_SPIKE_ISA,
    spike_timeout: int = DEFAULT_SPIKE_TIMEOUT,
) -> tuple[BuildResult, RunResult | None]:
    """Build the kernel and run it on Spike if build succeeds."""
    build = build_kernel(kernel_name, zephyr_base, slot_id=slot_id, harness_dir=harness_dir)
    if not build.success:
        return build, None

    _, build_dir = _get_build_slot(slot_id)
    run = run_spike(kernel_name, build_dir, chipyard_path, spike_isa, spike_timeout)
    return build, run


def main():
    import argparse
    from ..config import Config

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        datefmt="%H:%M:%S",
    )

    cfg = Config()

    p = argparse.ArgumentParser(description="Compile and run a kernel on Spike")
    p.add_argument("kernel", help="Kernel name (e.g. qs8-vaddc)")
    p.add_argument("--zephyr-base", default=None, help="Path to Zephyr (default: from config/env)")
    p.add_argument("--chipyard-path", default=None, help="Path to Chipyard (default: from config/env)")
    p.add_argument("--slot", type=int, default=0, help="Build slot ID (for parallel builds)")
    p.add_argument("--harness-dir", type=Path, default=DEFAULT_HARNESS_DIR)
    p.add_argument("--spike-isa", default=DEFAULT_SPIKE_ISA)
    p.add_argument("--spike-timeout", type=int, default=DEFAULT_SPIKE_TIMEOUT)
    p.add_argument("--build-only", action="store_true", help="Skip Spike run")
    args = p.parse_args()

    zephyr_base = args.zephyr_base or cfg.zephyr_base
    chipyard_path = args.chipyard_path or cfg.chipyard_path

    build_result = build_kernel(
        args.kernel, zephyr_base, slot_id=args.slot, harness_dir=args.harness_dir
    )
    print(f"Build: {'PASS' if build_result.success else 'FAIL'} ({build_result.elapsed:.1f}s)")
    if not build_result.success:
        print(f"Error:\n{build_result.error}")
        exit(1)

    if args.build_only:
        exit(0)

    _, build_dir = _get_build_slot(args.slot)
    run_result = run_spike(
        args.kernel, build_dir, chipyard_path, args.spike_isa, args.spike_timeout
    )
    print(f"Spike: {'PASS' if run_result.passed else 'FAIL'} ({run_result.elapsed:.1f}s)")
    if run_result.output:
        print(f"Output: {run_result.output.strip()}")
    if run_result.error:
        print(f"Error: {run_result.error[:1000]}")


if __name__ == "__main__":
    main()
