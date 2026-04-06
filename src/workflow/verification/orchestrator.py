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

DEFAULT_MAX_BATCH = 10000

VERIFICATION_DIR = PROJECT_ROOT / "src" / "verification"


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
                           # "MISSING_INTRINSIC", "UNSUPPORTED", "CRASH", "HARNESS_GEN_ERROR"
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
                     output_dir: Path = None) -> tuple[Optional[Path], str]:
    """Compile a C++ harness via CMake. Returns (binary_path, error_string).

    Layout:
      build/verification/harnesses/<kernel>.cpp   — source
      build/verification/cmake_build/             — shared CMake build dir
      build/verification/cmake_build/<kernel>     — compiled binary
    """
    if output_dir is None:
        output_dir = PROJECT_ROOT / "build" / "verification"

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
        "cmake", str(VERIFICATION_DIR),
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
    result = subprocess.run(build_cmd, capture_output=True, text=True,
                            cwd=str(cmake_build_dir), timeout=120)

    if result.returncode != 0:
        error = result.stderr + "\n" + result.stdout
        log.error("Compilation failed:\n%s", error[:2000])
        return None, error

    bin_path = cmake_build_dir / harness_name
    if not bin_path.exists():
        return None, f"Binary not found at {bin_path}"

    log.info("Compiled: %s", bin_path)
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
                      per_batch_timeout: int = 60,
                      max_batch: int = DEFAULT_MAX_BATCH,
                      vlen: int = 256) -> VerificationResult:
    """Run the harness on batch=1,2,3,...,max_batch in a single process.

    The harness handles the loop internally and checks per-batch time.
    Stops when any single batch exceeds per_batch_timeout seconds.
    """
    result = VerificationResult(kernel_name=kernel_name, verdict="ALL_PASSED")
    env = os.environ.copy()
    env["DYLD_LIBRARY_PATH"] = "/usr/local/lib"
    env["LD_LIBRARY_PATH"] = "/usr/local/lib"

    # Overall timeout: scale with per-batch timeout and batch count
    overall_timeout = max(max_batch * 20, per_batch_timeout * max_batch, 600)

    t0 = time.perf_counter()
    try:
        proc = subprocess.run(
            [str(bin_path), "1", str(max_batch), str(vlen), str(per_batch_timeout)],
            capture_output=True, text=True,
            timeout=overall_timeout, env=env,
        )
        elapsed = time.perf_counter() - t0
    except subprocess.TimeoutExpired as e:
        elapsed = time.perf_counter() - t0
        log.warning("Overall process timeout after %.1fs — recovering partial results", elapsed)
        # Recover whatever stdout was captured before the kill
        stdout = (e.stdout or "") if isinstance(e.stdout, str) else ""
        proc = type('R', (), {'stdout': stdout, 'stderr': '', 'returncode': -1})()
        result.verdict = "PARTIAL"

    # Parse output lines
    for line in proc.stdout.strip().split("\n"):
        line = line.strip()
        if not line:
            continue
        try:
            data = json.loads(line)
        except json.JSONDecodeError:
            continue

        status = data.get("status", "")
        batch = data.get("batch", 0)
        config = data.get("config", "default")

        if status == "VERIFIED":
            result.max_verified_batch = max(result.max_verified_batch, batch)
            result.verified_batches.append(BatchResult(batch=batch, status="VERIFIED"))
            # Track per-config max batch
            result.config_results[config] = max(
                result.config_results.get(config, 0), batch)

        elif status == "COUNTEREXAMPLE":
            result.verdict = "COUNTEREXAMPLE"
            result.counterexample = data
            result.failed_config = config
            result.verified_batches.append(
                BatchResult(batch=batch, status="COUNTEREXAMPLE", details=json.dumps(data)))
            log.error("COUNTEREXAMPLE at batch=%d config=%s", batch, config)

        elif status == "TIMEOUT":
            # Per-batch timeout — this config verified up to previous batch
            result.verdict = "PARTIAL"
            log.info("config=%s batch=%d exceeded %ds — verified up to batch=%d",
                     config, batch, per_batch_timeout,
                     result.config_results.get(config, 0))

        elif status == "ALL_VERIFIED":
            result.max_verified_batch = data.get("end", 0)
            result.configs_tested = data.get("configs", 1)

    # Check for crash (skip if we already set PARTIAL from timeout)
    if result.verdict != "PARTIAL":
        if proc.returncode not in (0, 1, 2):
            result.verdict = "CRASH"
            result.compile_error = proc.stderr[:1000]
            log.error("Harness crashed (exit=%d): %s", proc.returncode, proc.stderr[:500])
        elif proc.returncode == 1 and result.verdict != "COUNTEREXAMPLE":
            result.verdict = "CRASH"
            result.compile_error = proc.stderr[:1000] or proc.stdout[:1000]

    num_verified = len([b for b in result.verified_batches if b.status == "VERIFIED"])
    num_configs = len(result.config_results)
    log.info("Verified %d batch sizes across %d configs, max_batch=%d",
             num_verified, num_configs, result.max_verified_batch)

    return result


def verify_kernel(neon_path: str, rvv_path: str,
                   kernel_name: str = "",
                   params_init: str = "",
                   param_configs: list[tuple[str, str]] = None,
                   vlen: int = 256,
                   per_batch_timeout: int = 60,
                   max_batch: int = DEFAULT_MAX_BATCH,
                   llm_client=None) -> VerificationResult:
    """Full pipeline: parse → infer → generate → compile → run.

    If neither params_init nor param_configs is provided, auto-generates
    edge-case configs from the params struct definition.
    """
    from .harness_gen import generate_harness_from_files

    # Always derive kernel_name from filename if not provided
    if not kernel_name:
        kernel_name = Path(neon_path).stem

    # 1. Generate harness
    try:
        harness = generate_harness_from_files(
            neon_path, rvv_path,
            kernel_name=kernel_name,
            params_init=params_init,
            param_configs=param_configs,
            vlen=vlen,
            llm_client=llm_client,
        )
    except Exception as e:
        return VerificationResult(
            kernel_name=kernel_name,
            verdict="HARNESS_GEN_ERROR",
            compile_error=str(e),
        )

    # 2. Compile
    bin_path, compile_error = compile_harness(harness, kernel_name)
    if bin_path is None:
        missing = extract_missing_intrinsics(compile_error)
        return VerificationResult(
            kernel_name=kernel_name,
            verdict="MISSING_INTRINSIC" if missing else "COMPILE_ERROR",
            compile_error=compile_error[:3000],
            missing_intrinsics=missing,
        )

    # 3. Run
    return run_verification(bin_path, kernel_name,
                             per_batch_timeout=per_batch_timeout,
                             max_batch=max_batch,
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
    p.add_argument("--timeout", type=int, default=60, help="Per-batch timeout in seconds")
    p.add_argument("--max-batch", type=int, default=DEFAULT_MAX_BATCH, help="Max batch size")
    args = p.parse_args()

    params_init = args.params_init
    if args.params_file:
        params_init = Path(args.params_file).read_text()

    result = verify_kernel(
        args.neon, args.rvv,
        params_init=params_init,
        vlen=args.vlen,
        per_batch_timeout=args.timeout,
        max_batch=args.max_batch,
    )

    print(result.to_json())


if __name__ == "__main__":
    main()
