#!/usr/bin/env python3
"""Try source-informed elaboration repairs in an isolated model copy.

The patched model is DIAGNOSTIC ONLY: no semantic-preservation proof is claimed.
The original model and its hash-checked pure helper extraction stay unchanged.
"""
import difflib
import argparse
import hashlib
import json
import os
import signal
import shutil
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ORIGINAL = ROOT.parent / "vendor/lean-kernel"
COPY = ROOT.parent / "vendor/lean-kernel-diagnostic"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", default="Rv64Kernel.VextVsetInsts")
    args = parser.parse_args()
    if not COPY.exists():
        shutil.copytree(ORIGINAL, COPY, ignore=shutil.ignore_patterns(".lake"))
    path = COPY / "Rv64Kernel/Defs.lean"
    before = (ORIGINAL / "Rv64Kernel/Defs.lean").read_text()
    after = before.replace("abbrev root_level : Int :=", "abbrev root_level (k_v : Nat) : Int :=")
    after = after.replace("abbrev vpn_level_size : Int :=", "abbrev vpn_level_size (k_v : Nat) : Int :=")
    after = after.replace("is_sv32_mode(k_v)", "k_v = 32 ∨ k_v = 34")
    after = after.replace("abbrev pte_bits k_v :=", "abbrev pte_bits (k_v : Nat) :=")
    after = after.replace("abbrev ppn_bits k_v :=", "abbrev ppn_bits (k_v : Nat) :=")
    path.write_text(after)
    (ROOT / "results/diagnostic-model.patch").write_text("".join(difflib.unified_diff(
        before.splitlines(True), after.splitlines(True), fromfile="original/Defs.lean", tofile="diagnostic/Defs.lean")))
    extras = COPY / "Rv64Kernel/RiscvExtrasExecutable.lean"
    extra_before = (ORIGINAL / "Rv64Kernel/RiscvExtrasExecutable.lean").read_text()
    extra_after = extra_before.replace("open Rv64Kernel\n", "")
    extras.write_text(extra_after)
    with (ROOT / "results/diagnostic-model.patch").open("a") as patch:
        patch.write("".join(difflib.unified_diff(extra_before.splitlines(True), extra_after.splitlines(True),
                    fromfile="original/RiscvExtrasExecutable.lean", tofile="diagnostic/RiscvExtrasExecutable.lean")))
    cmd = ["lake", "build", args.target]
    label = args.target.rsplit(".", 1)[-1]
    start = time.monotonic()
    with (ROOT / "logs" / ("diagnostic-" + label + ".log")).open("w") as log:
        process = subprocess.Popen(cmd, cwd=COPY, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        try:
            code = process.wait(timeout=180)
            status = "finished"
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGTERM)
            process.wait()
            status, code = "timeout", None
    result = dict(command=cmd, cwd=str(COPY), status=status, exit_code=code,
                  seconds=round(time.monotonic() - start, 3),
                  original_defs_sha256=hashlib.sha256(before.encode()).hexdigest(),
                  diagnostic_defs_sha256=hashlib.sha256(after.encode()).hexdigest(),
                  semantic_preservation_proved=False, kernel_equivalence_proved=False)
    (ROOT / "results" / ("diagnostic-" + label + ".json")).write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
