"""Zephyr compilation and Spike execution for kernel validation.

Handles:
    - Copying harness into build directory
    - Building kernels via west/Zephyr toolchain
    - Running compiled ELF on Spike simulator
    - Parsing build errors and Spike output
"""

import asyncio
import logging
import re
import shutil
import subprocess
import tempfile
import time
from dataclasses import dataclass
from pathlib import Path

log = logging.getLogger("pipeline")

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent.parent  # src/workflow/build/ -> SALT/

# Defaults
DEFAULT_ZEPHYR_BASE = PROJECT_ROOT / "third_party" / "zephyr"
DEFAULT_CHIPYARD_PATH = ""  # e.g. /scratch/kchern2/chipyard
DEFAULT_APP_DIR = PROJECT_ROOT / "build" / "xnnpack-kernel" / "app"
DEFAULT_BUILD_DIR = PROJECT_ROOT / "build" / "xnnpack-kernel" / "build"
DEFAULT_HARNESS_DIR = PROJECT_ROOT / "kernels" / "harness"
DEFAULT_SPIKE_ISA = "rv64gcv_zvl512b_zicntr"
DEFAULT_SPIKE_TIMEOUT = 15


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


def _extract_compile_errors(raw: str) -> str:
    """Pull actual compiler diagnostics out of cmake/ninja build log.

    Keeps lines that contain ': error:', 'undefined reference', etc.
    plus surrounding context lines.  Falls back to the last 40 non-junk
    lines if no diagnostics are found.
    """
    diag = re.compile(
        r"(: error:|: fatal error:|undefined reference"
        r"|In file included from|In function|: note:)"
    )
    lines = raw.splitlines()
    keep = set()
    for i, line in enumerate(lines):
        if diag.search(line):
            keep.add(i)

    if keep:
        # Only include matched lines, skip huge gcc command lines
        extracted = "\n".join(
            lines[i] for i in sorted(keep) if len(lines[i]) < 500
        )
        if extracted.strip():
            return extracted[:3000]

    # Fallback: short lines only, skip gcc commands and cmake noise
    useful = [l for l in lines if l.strip() and len(l) < 500
              and not l.startswith("--") and not l.startswith("[")]
    if useful:
        return "\n".join(useful[-30:])[:3000]

    return raw[-1500:]


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
    app_dir: Path = DEFAULT_APP_DIR,
    build_dir: Path = DEFAULT_BUILD_DIR,
    harness_dir: Path = DEFAULT_HARNESS_DIR,
) -> BuildResult:
    """Copy harness into place and compile via west build."""
    zephyr_base = Path(zephyr_base)

    if not _install_harness(kernel_name, harness_dir, app_dir):
        return BuildResult(success=False, error=f"Harness not found for '{kernel_name}'")

    pristine_flag = "" if _has_cached_build(build_dir) else "-p"
    log.info("Building %s: pristine=%s", kernel_name, bool(pristine_flag))

    # Write build output to a log file under the project logs dir
    logs_dir = PROJECT_ROOT / "logs" / "builds" / kernel_name
    logs_dir.mkdir(parents=True, exist_ok=True)
    build_log = logs_dir / "build.log"

    cmd = (
        f"cd {zephyr_base} && "
        f"source scripts/set_envvars_sdk.sh && "
        f"source tools/miniforge3/etc/profile.d/conda.sh && "
        f"conda activate zephyr && "
        f"west build {pristine_flag} -b spike_riscv64 "
        f"-d {build_dir} {app_dir} "
        f"-DXNNPACK_ENABLE_RISCV_VECTOR=ON "
        f"-DXNNPACK_ENABLE_RISCV_GEMMINI=OFF "
        f"> {build_log} 2>&1"
    )

    t0 = time.perf_counter()
    try:
        returncode = subprocess.call(
            cmd, shell=True, executable="/bin/bash", timeout=300,
        )
        elapsed = time.perf_counter() - t0

        raw = build_log.read_text() if build_log.exists() else ""

        if returncode != 0:
            error = _extract_compile_errors(raw)
            log.error("Build failed (%.1fs):\n%s", elapsed, error)
            log.info("Full build log: %s", build_log)
            return BuildResult(success=False, error=error, elapsed=elapsed)

        log.info("Build succeeded in %.1fs", elapsed)
        return BuildResult(success=True, elapsed=elapsed)

    except subprocess.TimeoutExpired:
        elapsed = time.perf_counter() - t0
        return BuildResult(success=False, error="Build timed out (300s)", elapsed=elapsed)
    except Exception as e:
        elapsed = time.perf_counter() - t0
        return BuildResult(success=False, error=str(e), elapsed=elapsed)


async def run_spike_async(
    build_dir: Path = DEFAULT_BUILD_DIR,
    chipyard_path: str = DEFAULT_CHIPYARD_PATH,
    isa: str = DEFAULT_SPIKE_ISA,
    timeout: int = DEFAULT_SPIKE_TIMEOUT,
) -> RunResult:
    """Run the compiled ELF on Spike simulator (async).

    Spike runs under chipyard's environment (source env.sh).
    """
    elf_path = build_dir / "zephyr" / "zephyr.elf"
    if not elf_path.exists():
        return RunResult(success=False, error=f"ELF not found: {elf_path}")

    if not chipyard_path:
        return RunResult(success=False, error="CHIPYARD_PATH not set")

    cmd = (
        f"cd {chipyard_path} && "
        f"source env.sh && "
        f"spike --isa={isa} {elf_path}"
    )
    log.info("Running Spike: isa=%s elf=%s", isa, elf_path)

    t0 = time.perf_counter()
    try:
        proc = await asyncio.create_subprocess_shell(
            cmd,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
            executable="/bin/bash",
        )
        stdout, stderr = await asyncio.wait_for(
            proc.communicate(), timeout=timeout
        )
        elapsed = time.perf_counter() - t0

        stdout_str = stdout.decode(errors="replace")
        stderr_str = stderr.decode(errors="replace")

        if proc.returncode != 0:
            error = stderr_str or stdout_str
            log.error("Spike failed (%.1fs, exit=%d):\n%s",
                      elapsed, proc.returncode, error[-2000:])
            return RunResult(
                success=False, output=stdout_str, error=error, elapsed=elapsed,
            )

        passed = "PASS" in stdout_str
        failed = "FAIL" in stdout_str

        if passed:
            log.info("Spike: PASS (%.1fs)", elapsed)
        elif failed:
            log.warning("Spike: FAIL (%.1fs)\n%s", elapsed, stdout_str[-2000:])
        else:
            log.warning("Spike: no PASS/FAIL in output (%.1fs)", elapsed)

        return RunResult(
            success=True, output=stdout_str, passed=passed, elapsed=elapsed,
        )

    except asyncio.TimeoutError:
        elapsed = time.perf_counter() - t0
        log.error("Spike timed out after %.1fs", elapsed)
        try:
            proc.kill()
        except Exception:
            pass
        return RunResult(success=False, error=f"Spike timed out ({timeout}s)", elapsed=elapsed)
    except Exception as e:
        elapsed = time.perf_counter() - t0
        return RunResult(success=False, error=str(e), elapsed=elapsed)


def run_spike(
    build_dir: Path = DEFAULT_BUILD_DIR,
    chipyard_path: str = DEFAULT_CHIPYARD_PATH,
    isa: str = DEFAULT_SPIKE_ISA,
    timeout: int = DEFAULT_SPIKE_TIMEOUT,
) -> RunResult:
    """Sync wrapper for run_spike_async."""
    loop = asyncio.new_event_loop()
    try:
        return loop.run_until_complete(
            run_spike_async(build_dir, chipyard_path, isa, timeout)
        )
    finally:
        loop.close()


def compile_and_run(
    kernel_name: str,
    zephyr_base: Path | str = DEFAULT_ZEPHYR_BASE,
    chipyard_path: str = DEFAULT_CHIPYARD_PATH,
    app_dir: Path = DEFAULT_APP_DIR,
    build_dir: Path = DEFAULT_BUILD_DIR,
    harness_dir: Path = DEFAULT_HARNESS_DIR,
    spike_isa: str = DEFAULT_SPIKE_ISA,
    spike_timeout: int = DEFAULT_SPIKE_TIMEOUT,
) -> tuple[BuildResult, RunResult | None]:
    """Build the kernel and run it on Spike if build succeeds."""
    build = build_kernel(kernel_name, zephyr_base, app_dir, build_dir, harness_dir)
    if not build.success:
        return build, None

    run = run_spike(build_dir, chipyard_path, spike_isa, spike_timeout)
    return build, run


def main():
    import argparse
    from ..config import Config

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        datefmt="%H:%M:%S",
    )

    cfg = Config()  # picks up defaults (zephyr_base, chipyard_path)

    p = argparse.ArgumentParser(description="Compile and run a kernel on Spike")
    p.add_argument("kernel", help="Kernel name (e.g. qs8-vaddc)")
    p.add_argument("--app-dir", type=Path, default=DEFAULT_APP_DIR)
    p.add_argument("--build-dir", type=Path, default=DEFAULT_BUILD_DIR)
    p.add_argument("--harness-dir", type=Path, default=DEFAULT_HARNESS_DIR)
    p.add_argument("--spike-isa", default=DEFAULT_SPIKE_ISA)
    p.add_argument("--spike-timeout", type=int, default=DEFAULT_SPIKE_TIMEOUT)
    p.add_argument("--build-only", action="store_true", help="Skip Spike run")
    args = p.parse_args()

    zephyr_base = cfg.zephyr_base
    chipyard_path = cfg.chipyard_path

    build_result = build_kernel(
        args.kernel, zephyr_base, args.app_dir, args.build_dir, args.harness_dir
    )
    print(f"Build: {'PASS' if build_result.success else 'FAIL'} ({build_result.elapsed:.1f}s)")
    if not build_result.success:
        print(f"Error:\n{build_result.error}")
        exit(1)

    if args.build_only:
        exit(0)

    run_result = run_spike(
        args.build_dir, chipyard_path, args.spike_isa, args.spike_timeout
    )
    print(f"Spike: {'PASS' if run_result.passed else 'FAIL'} ({run_result.elapsed:.1f}s)")
    if run_result.output:
        print(f"Output: {run_result.output.strip()}")
    if run_result.error:
        print(f"Error: {run_result.error[:1000]}")


if __name__ == "__main__":
    main()
