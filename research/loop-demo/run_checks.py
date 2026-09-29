"""Check the standalone demo with Lean and audit the reported theorem axioms.

Usage: LEAN_BIN=/path/to/lean python3 research/loop-demo/run_checks.py
With elan's `lean` on PATH, the default ELAN_TOOLCHAIN is lean4 v4.29.1.
This script creates no repository build artifacts and downloads no dependencies
itself; use LEAN_BIN to select an already-installed binary explicitly.
"""
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

HERE = Path(__file__).resolve().parent
LEAN = os.environ.get("LEAN_BIN") or shutil.which("lean")
if not LEAN:
    raise SystemExit("Set LEAN_BIN to an installed Lean 4.29.1 executable.")
env = dict(os.environ)
env.setdefault("ELAN_TOOLCHAIN", "leanprover/lean4:v4.29.1")

for args in ([LEAN, "--version"], [LEAN, str(HERE / "GeneralLoops.lean")]):
    result = subprocess.run(args, cwd=HERE, env=env, text=True,
                            capture_output=True, timeout=180)
    print(result.stdout, end="")
    print(result.stderr, end="", file=sys.stderr)
    if result.returncode:
        raise SystemExit(result.returncode)

audits = {}
for line in result.stdout.splitlines():
    match = re.fullmatch(r"'GeneralLoops\.(\w+)' depends on axioms: \[(.*)\]", line)
    if match:
        audits[match[1]] = set(filter(None, match[2].split(", ")))
    match = re.fullmatch(r"'GeneralLoops\.(\w+)' does not depend on any axioms", line)
    if match:
        audits[match[1]] = set()
expected = {"eval_sound", "hoare_loop", "gridCount_correct", "loop_terminates",
            "gridCount_total", "countdown_terminates"}
if set(audits) != expected:
    raise SystemExit(f"Unexpected/missing theorem audits: {set(audits) ^ expected}")
allowed = {"propext", "Classical.choice", "Quot.sound"}
for name, axioms in audits.items():
    if axioms - allowed:
        raise SystemExit(f"Unexpected axioms for {name}: {axioms - allowed}")
print("PASS: executable examples, universal proofs, and six axiom audits.")
