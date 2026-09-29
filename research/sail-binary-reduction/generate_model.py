#!/usr/bin/env python3
"""Attempt an upstream ISA -> Lean generation, recording success/failure/timeout.

This does not translate an ELF, and does not invent replacement ISA semantics.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import time

ROOT = Path(__file__).resolve().parent
RISCV_REV = "29e6158f0a88bdb26b9fbcd0718ab919449b5179"


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("architecture", choices=["rvv", "neon"])
    p.add_argument("--timeout", type=int, default=1200)
    p.add_argument("--matchbv", action="store_true", help="keep bitvector patterns in Lean output")
    args = p.parse_args()
    out = ROOT / "out" / (args.architecture + ("-vext" if args.architecture == "rvv" else "") + ("-matchbv" if args.matchbv else "") + "-generation")
    out.mkdir(parents=True, exist_ok=True)
    sail = ROOT / "vendor/sail/bin/sail"
    env = {**os.environ, "PATH": str(sail.parent) + ":" + os.environ["PATH"]}
    if args.architecture == "rvv":
        model = ROOT / "vendor" / ("sail-riscv-" + RISCV_REV)
        configs = ROOT / "vendor/sail-riscv-Linux-x86_64/share/sail-riscv/config"
        cmd = [str(sail), "--dprofile", "--config", str(configs / "rv64d_v256_e64.json"),
               "--lean", "--memo-z3", "--memo-z3-path", str(out / "sail_smt_cache"),
               "--lean-output-dir", str(out / "models"), "--lean-force-output",
               "--lean-lib-rev", "79b4d08505af29d88b3918f32d29840fae1fa191",
               "--lean-non-beq-type", "instruction", "--lean-non-beq-type", "ExecutionResult",
               "--lean-non-beq-type", "Step", "--lean-import-file",
               "../handwritten_support/RiscvExtrasExecutable.lean", "-o", "Lean_RV64D_executable",
               "V_instructions", "Zca", "Zba", "Zicsr_insts", "postlude", "riscv.sail_project"]
        cwd = model / "model"
        generated = out / "models"
        generated.mkdir(parents=True, exist_ok=True)
        if args.matchbv:
            cmd.insert(1, "--lean-matchbv")
    else:
        model = ROOT / "vendor/sail-arm-master/arm-v9.4-a"
        # Follow the real upstream gen_lean recipe, including termination measures
        # and ArmExtras. Do not strip instruction semantics to make it succeed.
        cmd = ["make", "gen_lean", f"SAIL={sail}",
               f"SAIL_DIR={ROOT / 'vendor/sail/share/sail'}"]
        if args.matchbv:
            cmd.append("SAIL_FLAGS=--lean-matchbv")
        cwd = model
        generated = model / "lean/armv9"
    report = {"architecture": args.architecture, "status": "running", "command": cmd,
              "cwd": str(cwd), "timeout_seconds": args.timeout,
              "generated_lean_typechecked": False, "elf_execution_in_lean": False,
              "binary_equivalence_proved": False}
    result = out / "Result.json"
    result.write_text(json.dumps(report, indent=2) + "\n")
    start = time.monotonic()
    with (out / "generation.log").open("w") as log:
        process = subprocess.Popen(cmd, cwd=cwd, env=env, stdout=log, stderr=subprocess.STDOUT,
                                   start_new_session=True)
        try:
            code = process.wait(timeout=args.timeout)
            report.update(status="generated" if code == 0 else "failed", exit_code=code)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGTERM)
            try:
                process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
            report.update(status="timeout", exit_code=process.returncode)
        finally:
            report["elapsed_seconds"] = round(time.monotonic() - start, 3)
    files = sorted(generated.rglob("*.lean")) if generated.exists() else []
    report["generated_lean_files"] = len(files)
    report["generated_lean_bytes"] = sum(f.stat().st_size for f in files)
    report["log_sha256"] = hashlib.sha256((out / "generation.log").read_bytes()).hexdigest()
    if report["status"] == "generated" and not files:
        report["status"] = "failed-no-lean-files"
    result.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
    return 0 if report["status"] == "generated" else 1


if __name__ == "__main__":
    raise SystemExit(main())
