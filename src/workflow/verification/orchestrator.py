"""
Verification orchestrator — compiles and runs harnesses with progressive batch sizing.

Runs batch=1,2,3,... in a single process. Stops when any single batch
exceeds the per-batch timeout, or on counterexample/crash.
"""

import json
import logging
import os
import re
import subprocess
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

log = logging.getLogger("pipeline")

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent  # src/workflow/verification/ -> SALT/

DEFAULT_MAX_BATCH = 256

# Backend → (cmake source dir, build subdir under build/) mapping.  The
# generated harness is identical between backends; only the include path /
# library link differs.
VERIFICATION_DIRS = {
    "bitwuzla": PROJECT_ROOT / "src" / "verification",
    "cvc5":     PROJECT_ROOT / "src" / "verification_cvc5",
}
VERIFICATION_BUILD_SUBDIRS = {
    "bitwuzla": "verification",
    "cvc5":     "verification_cvc5",
}

# Legacy alias kept for any downstream import.
VERIFICATION_DIR = VERIFICATION_DIRS["bitwuzla"]


@dataclass
class BatchResult:
    batch: int
    status: str        # "VERIFIED", "COUNTEREXAMPLE", "TIMEOUT", "CRASH"
    elapsed: float = 0.0
    details: str = ""


@dataclass
class VerificationResult:
    kernel_name: str
    verdict: str           # "ALL_PASSED", "COUNTEREXAMPLE", "COMPILE_ERROR",
                           # "MISSING_INTRINSIC", "UNSUPPORTED", "CRASH",
                           # "HARNESS_GEN_ERROR", "EMPTY_RANGE", "PARTIAL"
    verified_batches: list[BatchResult] = field(default_factory=list)
    max_verified_batch: int = 0
    compile_error: str = ""
    missing_intrinsics: list[str] = field(default_factory=list)
    counterexample: dict = field(default_factory=dict)
    configs_tested: int = 0
    config_results: dict = field(default_factory=dict)  # config_name → max_verified_batch
    failed_config: str = ""

    def to_json(self) -> str:
        d = {
            "kernel": self.kernel_name,
            "verdict": self.verdict,
            "max_verified_batch": self.max_verified_batch,
            "num_verified": len([b for b in self.verified_batches if b.status == "VERIFIED"]),
        }
        if self.configs_tested > 1:
            d["configs_tested"] = self.configs_tested
            d["config_results"] = self.config_results
        if self.failed_config:
            d["failed_config"] = self.failed_config
        if self.missing_intrinsics:
            d["missing_intrinsics"] = self.missing_intrinsics
        if self.counterexample:
            d["counterexample"] = self.counterexample
        if self.compile_error:
            d["compile_error"] = self.compile_error[:500]
        return json.dumps(d, indent=2)


def compile_harness(harness_source: str, kernel_name: str,
                     output_dir: Path = None,
                     backend: str = "bitwuzla") -> tuple[Optional[Path], str]:
    """Compile a C++ harness via CMake. Returns (binary_path, error_string).

    backend: "bitwuzla" (default) or "cvc5".  Picks the cmake source directory
    and the build dir layout.

    Layout (bitwuzla):
      build/verification/harnesses/<kernel>.cpp   — source
      build/verification/cmake_build/             — shared CMake build dir
      build/verification/cmake_build/<kernel>     — compiled binary
    Layout (cvc5):
      build/verification_cvc5_pipeline/...        — same shape, different root
    """
    if backend not in VERIFICATION_DIRS:
        raise ValueError(f"Unknown backend '{backend}'. "
                         f"Supported: {list(VERIFICATION_DIRS)}")
    cmake_source_dir = VERIFICATION_DIRS[backend]

    if output_dir is None:
        output_dir = PROJECT_ROOT / "build" / VERIFICATION_BUILD_SUBDIRS[backend]

    harness_dir = output_dir / "harnesses"
    harness_dir.mkdir(parents=True, exist_ok=True)
    cmake_build_dir = output_dir / "cmake_build"
    cmake_build_dir.mkdir(parents=True, exist_ok=True)

    # Write harness source (one file per kernel, overwritten on re-verify)
    harness_name = f"verify_{kernel_name}"
    src_path = harness_dir / f"{harness_name}.cpp"
    src_path.write_text(harness_source)

    # Configure CMake (reconfigure each time to pick up the right source)
    configure_cmd = [
        "cmake", str(cmake_source_dir),
        f"-DHARNESS_SRC={src_path}",
        "-DCMAKE_BUILD_TYPE=Release",
    ]
    cmake_cache = cmake_build_dir / "CMakeCache.txt"
    if not cmake_cache.exists():
        log.info("Configuring CMake...")
    result = subprocess.run(configure_cmd, capture_output=True, text=True,
                            cwd=str(cmake_build_dir), timeout=60)
    if result.returncode != 0:
        error = result.stderr + "\n" + result.stdout
        log.error("CMake configure failed:\n%s", error[:2000])
        return None, error

    # Build
    build_cmd = ["cmake", "--build", ".", "--target", harness_name, "-j"]
    log.info("Compiling %s...", harness_name)
    t0 = time.perf_counter()
    result = subprocess.run(build_cmd, capture_output=True, text=True,
                            cwd=str(cmake_build_dir), timeout=120)
    compile_time = time.perf_counter() - t0

    if result.returncode != 0:
        error = result.stderr + "\n" + result.stdout
        log.error("Compilation failed (%.1fs):\n%s", compile_time, error[:2000])
        return None, error

    bin_path = cmake_build_dir / harness_name
    if not bin_path.exists():
        return None, f"Binary not found at {bin_path}"

    log.info("Compiled successfully: %s (%.1fs)", bin_path.name, compile_time)
    return bin_path, ""


def extract_missing_intrinsics(compile_error: str) -> list[str]:
    """Parse compiler errors to find undefined/undeclared SIMD intrinsics."""
    missing = set()
    patterns = [
        r"undeclared identifier '(\w+)'",
        r"no matching function for call to '(\w+)'",
        r"undefined reference to.*?'(?:salt::)?(\w+)'",
        r"implicit declaration of function '(\w+)'",
    ]
    for pat in patterns:
        for m in re.finditer(pat, compile_error):
            name = m.group(1)
            if name.startswith(('v', '__riscv_')):
                missing.add(name)
    return sorted(missing)


def run_verification(bin_path: Path, kernel_name: str,
                      per_batch_timeout: int = 600,
                      max_batch: int = DEFAULT_MAX_BATCH,
                      vlen: int = 256,
                      min_batch: int = 1) -> VerificationResult:
    """Run the harness on batch=min_batch..max_batch in a single process.

    The harness handles the loop internally and checks per-batch time.
    Stops when any single batch exceeds per_batch_timeout seconds.
    per_batch_timeout=0 disables both the per-query and the outer wall-clock cap.
    """
    result = VerificationResult(kernel_name=kernel_name, verdict="ALL_PASSED")
    env = os.environ.copy()
    env["DYLD_LIBRARY_PATH"] = "/usr/local/lib"
    env["LD_LIBRARY_PATH"] = "/usr/local/lib"

    # Overall wall-clock kill — None means no outer kill (per_batch_timeout=0).
    n_batches = max_batch - min_batch + 1
    overall_timeout = None if per_batch_timeout == 0 else \
        max(n_batches * 20, per_batch_timeout * n_batches, 600)

    log.info("  Running: %s %d %d %d %d", bin_path.name, min_batch, max_batch, vlen, per_batch_timeout)

    t0 = time.perf_counter()
    last_logged_batch = 0
    current_config = ""
    stderr_buf = []

    # Stream stdout line-by-line for real-time progress
    try:
        proc = subprocess.Popen(
            [str(bin_path), str(min_batch), str(max_batch), str(vlen), str(per_batch_timeout)],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            text=True, env=env,
            bufsize=1,  # line-buffered on the Python side of the pipe
        )

        import threading

        def _read_stderr():
            for line in proc.stderr:
                stderr_buf.append(line)

        stderr_thread = threading.Thread(target=_read_stderr, daemon=True)
        stderr_thread.start()

        for line in proc.stdout:
            line = line.strip()
            if not line:
                continue

            # Check overall timeout (None = no outer kill)
            if overall_timeout is not None and time.perf_counter() - t0 > overall_timeout:
                log.warning("Overall timeout after %.1fs — killing process",
                            time.perf_counter() - t0)
                proc.kill()
                result.verdict = "PARTIAL"
                break

            try:
                data = json.loads(line)
            except json.JSONDecodeError:
                continue

            status = data.get("status", "")
            batch = data.get("batch", 0)
            config = data.get("config", "default")

            # Log config transitions
            if config != current_config:
                if current_config:
                    log.info("  config=%s: verified up to batch=%d",
                             current_config, result.config_results.get(current_config, 0))
                current_config = config
                log.info("  Starting config=%s...", config)
                last_logged_batch = 0

            if status == "SOLVING":
                # Visibility ping from verify() before check_sat() runs.
                # Prevents silence when a single batch takes a long time.
                elapsed_so_far = time.perf_counter() - t0
                log.info("  batch=%-4d solving... (%.1fs)", batch, elapsed_so_far)

            elif status == "VERIFIED":
                result.max_verified_batch = max(result.max_verified_batch, batch)
                result.verified_batches.append(BatchResult(batch=batch, status="VERIFIED"))
                result.config_results[config] = max(
                    result.config_results.get(config, 0), batch)
                # Log every batch
                elapsed_so_far = time.perf_counter() - t0
                log.info("  batch=%-4d VERIFIED  (%.1fs)", batch, elapsed_so_far)
                last_logged_batch = batch

            elif status == "COUNTEREXAMPLE":
                result.verdict = "COUNTEREXAMPLE"
                result.counterexample = data
                result.failed_config = config
                result.verified_batches.append(
                    BatchResult(batch=batch, status="COUNTEREXAMPLE", details=json.dumps(data)))
                log.error("  batch=%-4d COUNTEREXAMPLE config=%s", batch, config)
                log.error("    input[%s]=%s  neon_out=%s  rvv_out=%s",
                           data.get("fail_index", "?"),
                           data.get("input_at_fail", "?"),
                           data.get("neon_out", "?"),
                           data.get("rvv_out", "?"))

            elif status == "TIMEOUT":
                result.verdict = "PARTIAL"
                log.info("  config=%s batch=%d exceeded %ds — verified up to batch=%d",
                         config, batch, per_batch_timeout,
                         result.config_results.get(config, 0))

            elif status == "ALL_VERIFIED" and result.verdict == "ALL_PASSED":
                # Harness always prints ALL_VERIFIED at its `done:` label, even
                # after a TIMEOUT goto. Only trust it if no TIMEOUT/COUNTEREXAMPLE
                # has already downgraded the verdict.
                result.max_verified_batch = data.get("end", 0)
                result.configs_tested = data.get("configs", 1)

        proc.wait(timeout=10)
        stderr_thread.join(timeout=5)

    except Exception as e:
        elapsed = time.perf_counter() - t0
        log.warning("Process error after %.1fs: %s", elapsed, e)
        try:
            proc.kill()
        except Exception:
            pass
        if result.verdict == "ALL_PASSED":
            result.verdict = "PARTIAL"

    returncode = proc.returncode if proc.returncode is not None else -1
    stderr_text = "".join(stderr_buf)

    # Check for crash
    if result.verdict not in ("PARTIAL", "COUNTEREXAMPLE"):
        if returncode not in (0, 1, 2):
            result.verdict = "CRASH"
            result.compile_error = stderr_text[:1000]
            log.error("Harness crashed (exit=%d): %s", returncode, stderr_text[:500])
        elif returncode == 1 and result.verdict != "COUNTEREXAMPLE":
            result.verdict = "CRASH"
            result.compile_error = stderr_text[:1000]

    total_elapsed = time.perf_counter() - t0
    num_verified = len([b for b in result.verified_batches if b.status == "VERIFIED"])
    num_configs = len(result.config_results)

    # Harness alignment can produce an empty loop body (e.g. byte-count kernel
    # with end < elem_bytes). It still emits ALL_VERIFIED at `done:`, which
    # otherwise looks like a successful run.
    if result.verdict == "ALL_PASSED" and num_verified == 0:
        result.verdict = "EMPTY_RANGE"
        result.max_verified_batch = 0

    if result.verdict == "ALL_PASSED":
        log.info("═══════════════════════════════════════════════════════════")
        log.info("VERIFIED: %s — %d batches, %d configs, max_batch=%d (%.1fs)",
                 kernel_name, num_verified, num_configs, result.max_verified_batch,
                 total_elapsed)
    elif result.verdict == "COUNTEREXAMPLE":
        log.error("FAILED: %s — counterexample at batch=%d config=%s",
                  kernel_name, result.counterexample.get("batch", 0), result.failed_config)
    elif result.verdict == "PARTIAL":
        log.info("PARTIAL: %s — %d batches verified, max=%d (%.1fs)",
                 kernel_name, num_verified, result.max_verified_batch, total_elapsed)
    elif result.verdict == "EMPTY_RANGE":
        log.warning("EMPTY: %s — no batches in requested range (alignment skipped all of [min,max]?)",
                    kernel_name)
    else:
        log.error("RESULT: %s — %s", kernel_name, result.verdict)

    return result


def verify_kernel(neon_path: str, rvv_path: str,
                   kernel_name: str = "",
                   params_init: str = "",
                   param_configs: list[tuple[str, str]] = None,
                   symbolic_params: bool = False,
                   vlen: int = 256,
                   per_batch_timeout: int = 600,
                   max_batch: int = DEFAULT_MAX_BATCH,
                   min_batch: int = 1,
                   backend: str = "bitwuzla",
                   llm_client=None) -> VerificationResult:
    """Full pipeline: parse → infer → generate → compile → run.

    If neither params_init nor param_configs is provided, auto-generates
    edge-case configs from the params struct definition.
    symbolic_params: if True, proves equivalence for ALL valid params.
    """
    from .harness_gen import generate_harness_from_files

    # Always derive kernel_name from filename if not provided
    if not kernel_name:
        kernel_name = Path(neon_path).stem

    log.info("═══════════════════════════════════════════════════════════")
    log.info("Verification: %s", kernel_name)
    log.info("  NEON source: %s", neon_path)
    log.info("  RVV source:  %s", rvv_path)
    log.info("  Backend: %s", backend)
    log.info("  VLEN=%d  max_batch=%d  per_batch_timeout=%ds",
             vlen, max_batch, per_batch_timeout)

    # Check kernel profile
    from .kernel_profiles import get_profile
    profile = get_profile(kernel_name)
    if profile:
        log.info("  Kernel profile found: symbolic_params=%s",
                 profile.symbolic_params)
        if profile.symbolic_params and profile.param_ranges:
            log.info("  Param ranges: %s", profile.param_ranges)
        if not symbolic_params and profile.symbolic_params:
            log.info("  Profile overrides symbolic_params → True")
    else:
        log.info("  No kernel profile — using defaults")

    if symbolic_params:
        log.info("  Mode: SYMBOLIC PARAMS (proving for all valid param values)")
    else:
        log.info("  Mode: CONCRETE CONFIGS (testing specific param values)")

    # 1. Generate harness
    log.info("Step 1/3: Generating verification harness...")
    try:
        harness = generate_harness_from_files(
            neon_path, rvv_path,
            kernel_name=kernel_name,
            params_init=params_init,
            param_configs=param_configs,
            symbolic_params=symbolic_params,
            vlen=vlen,
            backend=backend,
            per_query_timeout_ms=per_batch_timeout * 1000,
            llm_client=llm_client,
        )
    except Exception as e:
        log.error("Harness generation failed: %s", e)
        return VerificationResult(
            kernel_name=kernel_name,
            verdict="HARNESS_GEN_ERROR",
            compile_error=str(e),
        )
    log.info("  Harness generated (%d lines)", harness.count('\n') + 1)

    # 2. Compile
    log.info("Step 2/3: Compiling verification harness...")
    bin_path, compile_error = compile_harness(harness, kernel_name, backend=backend)
    if bin_path is None:
        missing = extract_missing_intrinsics(compile_error)
        if missing:
            log.error("  Missing intrinsics: %s", missing)
        return VerificationResult(
            kernel_name=kernel_name,
            verdict="MISSING_INTRINSIC" if missing else "COMPILE_ERROR",
            compile_error=compile_error[:3000],
            missing_intrinsics=missing,
        )
    log.info("  Compilation successful")

    # 3. Run
    log.info("Step 3/3: Starting bounded verification (batch=%d..%d)...", min_batch, max_batch)
    return run_verification(bin_path, kernel_name,
                             per_batch_timeout=per_batch_timeout,
                             max_batch=max_batch,
                             min_batch=min_batch,
                             vlen=vlen)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------
def main():
    import argparse

    logging.basicConfig(level=logging.INFO,
                        format="%(asctime)s [%(levelname)s] %(message)s",
                        datefmt="%H:%M:%S")

    p = argparse.ArgumentParser(description="SALTy-RN Bounded Verification")
    p.add_argument("--neon", required=True, help="Path to NEON kernel source")
    p.add_argument("--rvv", required=True, help="Path to RVV kernel source")
    p.add_argument("--params-init", default="", help="C++ params initialization code")
    p.add_argument("--params-file", default="", help="File containing params init code")
    p.add_argument("--vlen", type=int, default=256, help="Target VLEN in bits")
    p.add_argument("--timeout", type=int, default=600, help="Per-batch timeout in seconds (default: 600 = 10 min)")
    p.add_argument("--max-batch", type=int, default=DEFAULT_MAX_BATCH, help="Max batch size")
    p.add_argument("--batch", type=int, default=0,
                   help="Run ONLY this batch size (shortcut for --min-batch=N --max-batch=N). 0 = sweep.")
    p.add_argument("--symbolic-params", action="store_true",
                   help="Use symbolic params (proves for ALL valid params)")
    p.add_argument("--backend", choices=sorted(VERIFICATION_DIRS.keys()),
                   default="bitwuzla",
                   help="SMT backend (default: bitwuzla; cvc5 is much faster on f16 chained-FMA)")
    args = p.parse_args()

    params_init = args.params_init
    if args.params_file:
        params_init = Path(args.params_file).read_text()

    min_batch = args.batch if args.batch > 0 else 1
    max_batch = args.batch if args.batch > 0 else args.max_batch
    result = verify_kernel(
        args.neon, args.rvv,
        params_init=params_init,
        symbolic_params=args.symbolic_params,
        vlen=args.vlen,
        per_batch_timeout=args.timeout,
        max_batch=max_batch,
        min_batch=min_batch,
        backend=args.backend,
    )

    print(result.to_json())


if __name__ == "__main__":
    main()
