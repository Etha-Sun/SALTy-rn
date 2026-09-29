#!/usr/bin/env python3
"""Check generated Lem or request a proof-assistant backend; never claim a proof."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import time

ROOT = Path(__file__).resolve().parent


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--source", type=Path, default=ROOT / "out/formal/rvv-lem-strict-kernel/model")
    p.add_argument("--target", choices=["check", "isabelle", "coq"], default="check")
    p.add_argument("--timeout", type=int, default=600)
    a = p.parse_args()
    out = ROOT / "out" / ("lem-" + a.target)
    out.mkdir(parents=True, exist_ok=True)
    linked = out / "input"
    linked.mkdir(exist_ok=True)
    text = (a.source / "rv64_kernel.lem").read_text()
    # Dependency linkage only: no generated function or instruction body is edited.
    if "open import Riscv_extras_fdext\n" not in text:
        text = text.replace("open import Riscv_extras\n",
                            "open import Riscv_extras\nopen import Riscv_extras_fdext\n", 1)
    required = ["execute_VVTYPE", "execute_RMVVTYPE", "execute_VSETVLI", "execute_VMVXS",
                "kernel_instruction", "kernel_step"]
    missing = [name for name in required if "val " + name + " :" not in text]
    if missing:
        raise SystemExit("Refusing an incomplete kernel model: " + ", ".join(missing))
    (linked / "rv64_kernel.lem").write_text(text)
    shutil.copyfile(a.source / "rv64_kernel_types.lem", linked / "rv64_kernel_types.lem")
    rev = json.loads((ROOT / "lem-tools.lock.json").read_text())["lem_revision"]
    lem = ROOT / "vendor" / ("lem-" + rev)
    support = ROOT / "vendor/sail-riscv-29e6158f0a88bdb26b9fbcd0718ab919449b5179/handwritten_support"
    cmd = [str(lem / "bin/lem"), "-lib", str(ROOT / "vendor/sail/share/sail/src/gen_lib"),
           "-lib", str(support)]
    if a.target != "check":
        cmd += ["-isa" if a.target == "isabelle" else "-coq", "-outdir", str(out)]
    cmd += [str(linked / "rv64_kernel_types.lem"), str(linked / "rv64_kernel.lem"), str(ROOT / "kernel_spec.lem")]
    report = {"target": a.target, "command": cmd, "status": "running", "lem_typechecked": False,
              "proof_assistant_checked": False, "kernel_executed": False, "correctness_proved": False,
              "required_definitions_present": required,
              "input_sha256": {f.name: hashlib.sha256(f.read_bytes()).hexdigest() for f in linked.glob("*.lem")},
              "support_limitation": "Upstream floating-point externs use fail stubs; not a complete floating-point semantics."}
    result = out / "Result.json"
    result.write_text(json.dumps(report, indent=2) + "\n")
    start = time.monotonic()
    with (out / "check.log").open("w") as log:
        proc = subprocess.Popen(cmd, env={**os.environ, "LEMLIB": str(lem / "library")},
                                stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        try:
            code = proc.wait(timeout=a.timeout)
            report.update(status="passed" if code == 0 else "failed", exit_code=code,
                          lem_typechecked=code == 0)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            report.update(status="timeout", exit_code=proc.returncode)
    report["elapsed_seconds"] = round(time.monotonic() - start, 3)
    report["generated_files"] = [str(f) for f in sorted(out.glob("*.thy" if a.target == "isabelle" else "*.v"))]
    result.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
    return 0 if report["status"] == "passed" else 1


if __name__ == "__main__":
    raise SystemExit(main())
