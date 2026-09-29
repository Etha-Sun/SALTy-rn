"""Compare the hand Lean models with unchanged C behind host intrinsic facades.

Builds only in a fresh temporary directory. Optional output is a test artifact,
not a proof certificate. No dependency download or original-source edits.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import time

ROOT = Path(__file__).resolve().parent
DEFAULT_LEAN = Path("/srv/home/yuechunsun/.elan/toolchains/leanprover--lean4---v4.29.1/bin/lean")
FROZEN_TASK_SHA256 = "ce1b605af8c6a7a45cf1e7e841bf4e9929b70a90cf775db3923a5e7fa797c94c"


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_frozen() -> dict[str, str]:
    if digest(ROOT / "ProofTask.json") != FROZEN_TASK_SHA256:
        raise RuntimeError("Frozen proof task identity changed")
    task = json.loads((ROOT / "ProofTask.json").read_text())
    actual = {name: digest(ROOT / name) for name in task["protected_sha256"]}
    if actual != task["protected_sha256"]:
        raise RuntimeError("Frozen model/spec/source identity changed")
    return actual


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--result", type=Path)
    parser.add_argument("--sanitize", action="store_true")
    args = parser.parse_args()
    start = time.monotonic()
    before = check_frozen()
    lean = os.environ.get("LEAN_BIN", str(DEFAULT_LEAN))
    version = subprocess.check_output([lean, "--version"], text=True).strip()
    if not version.startswith("Lean (version 4.29.1,"):
        raise RuntimeError(f"Unexpected toolchain: {version}")
    with tempfile.TemporaryDirectory(prefix="salty-reduction-tests-") as folder:
        stage = Path(folder)
        env = {**os.environ, "LEAN_PATH": str(stage), "ASAN_OPTIONS": "detect_leaks=0"}

        def run(cmd: list[str], timeout: int = 240) -> subprocess.CompletedProcess[str]:
            result = subprocess.run(cmd, cwd=stage, env=env, text=True,
                                    capture_output=True, timeout=timeout)
            if result.returncode:
                raise RuntimeError(f"Command failed: {cmd}\n{result.stdout}\n{result.stderr}")
            if result.stderr:
                print(result.stderr.strip(), flush=True)
            return result

        for name in ("Models.lean", "Spec.lean", "Tests.lean"):
            shutil.copy2(ROOT / name, stage / name)
        run([lean, "-o", "Models.olean", "Models.lean"])
        run([lean, "-o", "Spec.olean", "Spec.lean"])
        print("Lean models/spec compiled; running cross-language fixtures...", flush=True)
        flags = ["-fsanitize=address,undefined", "-fno-omit-frame-pointer"] if args.sanitize else []
        run(["cc", "-std=c11", "-O1", "-g", "-Wall", "-Wextra", "-Werror", *flags,
             str(ROOT / "original_c_test.c"), "-o", str(stage / "c-test")])
        c = run([str(stage / "c-test")])
        l = run([lean, "--run", "Tests.lean"])
        if l.stdout.splitlines() != c.stdout.splitlines():
            raise RuntimeError("C and Lean result streams differ")
        count = len(c.stdout.splitlines())
        if count != 1242:
            raise RuntimeError(f"Unexpected fixture count: {count}")
        if check_frozen() != before:
            raise RuntimeError("Protected closure changed during tests")
        result = {
            "status": "passed-bounded-tests-not-universal-proof",
            "cases": count,
            "cases_sha256": hashlib.sha256(c.stdout.encode()).hexdigest(),
            "lean": version,
            "seconds": round(time.monotonic() - start, 3),
            "sanitizers": "address,undefined; leak detection disabled" if args.sanitize else "none",
            "negative_control": "resetting RVV inactive tail gives 14 instead of 21",
            "protected_sha256": before,
            "test_source_sha256": {name: digest(ROOT / name) for name in
                ("Tests.lean", "original_c_test.c", "run_tests.py")},
            "boundary": "original C with host intrinsic facade, not Arm/RVV hardware; abstract widths include nonhardware configurations, and scalar request policy is a model-generalization case",
        }
        print(json.dumps(result, indent=2))
        if args.result:
            args.result.write_text(json.dumps(result, indent=2) + "\n")


if __name__ == "__main__":
    main()
