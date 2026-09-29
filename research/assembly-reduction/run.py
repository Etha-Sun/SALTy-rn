#!/usr/bin/env python3
"""Compile unchanged qu8-rsum, translate .s, check Lean and prepare a proof task."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

from translate import translate

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[1]
DEFAULT_CC = "/tmp/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc"
DEFAULT_QEMU = "/tmp/neon2rvv-qemu-riscv64-static"


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def command(args, *, cwd=ROOT, env=None, log=None, timeout=180):
    print("+ " + " ".join(map(str, args)), flush=True)
    p = subprocess.run(list(map(str, args)), cwd=cwd, env=env, capture_output=True,
                       text=True, timeout=timeout)
    output = p.stdout + p.stderr
    if log:
        Path(log).write_text(output)
    if p.returncode:
        sys.stderr.write(output)
        raise RuntimeError(f"command failed ({p.returncode}): {args[0]}")
    return output


def control_programs(assembly):
    variants = [("nested", "nested", (ROOT / "fixtures/nested.s").read_text()),
                ("multipleEntry", "multiple_entry", (ROOT / "fixtures/multiple-entry.s").read_text())]
    # Metamorphic test: register and label names are irrelevant to the frontend.
    renames = {"a4": "t0", "a5": "t1", "a3": "t2", "v8": "v16", "v16": "v24",
               ".L2": ".finished", ".L3": ".again"}
    renamed = re.sub(r"(?<![\w.])(?:a4|a5|a3|v8|v16|\.L2|\.L3)(?![\w.])",
                     lambda m: renames[m[0]], assembly)
    variants.append(("renamed", "test_rvv", renamed))
    chunks = ["import Machine\nnamespace Controls\nopen Assembly\n"]
    for name, fn, text in variants:
        _, mapping = translate(text, fn)
        body = ",\n".join("  " + r["lean"] for r in mapping["instructions"])
        chunks.append(f"def {name} : Program := #[\n{body}\n]\n")
    return "\n".join(chunks) + "\nend Controls\n"


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--out", type=Path, default=ROOT / "out")
    p.add_argument("--cc", default=os.environ.get("RVV_CC", DEFAULT_CC))
    p.add_argument("--qemu", default=os.environ.get("QEMU_RVV", DEFAULT_QEMU))
    p.add_argument("--skip-qemu", action="store_true", help="explicitly skip the optional real-binary cross-check")
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    if (out / "Proof.lean").exists():
        raise SystemExit("Proof.lean exists: keep its frozen inputs; use a different --out for regeneration")
    # A failed rerun must not leave an old success report.
    (out / "Result.json").write_text(json.dumps({"status": "in-progress", "universal_proof": "not-checked"}) + "\n")
    env = {**os.environ, "ELAN_TOOLCHAIN": (ROOT / "lean-toolchain").read_text().strip(),
           "LEAN_PATH": str(out)}
    lean = os.environ.get("LEAN_BIN", "lean")
    version = command([lean, "--version"], env=env).strip()
    if not version.startswith("Lean (version 4.29.1,"):
        raise RuntimeError(f"wrong Lean version: {version}")
    cc_version = command([args.cc, "--version"]).splitlines()[0]
    assembly = out / "kernel.s"
    command([args.cc, "-march=rv64gcv", "-mabi=lp64d", "-O2", "-DNDEBUG", "-S",
             ROOT / "kernel-input.c", "-o", assembly])
    text = assembly.read_text()
    impl, mapping = translate(text, "test_rvv")
    (out / "Impl.lean").write_text(impl)
    (out / "SourceMap.json").write_text(json.dumps(mapping, indent=2) + "\n")
    for name in ["Machine.lean", "ReductionContract.lean", "ProofSupport.lean", "Tests.lean"]:
        shutil.copy2(ROOT / name, out / name)
    shutil.copy2(ROOT / "spec-template.lean", out / "Spec.lean")
    (out / "ControlPrograms.lean").write_text(control_programs(text))
    command([sys.executable, "-m", "unittest", "-v", "test_translate"], log=out / "ParserTests.log")
    for name in ["Machine", "Impl", "ReductionContract", "Spec", "ProofSupport", "ControlPrograms", "Tests"]:
        command([lean, "-j", "2", "-o", f"{name}.olean", f"{name}.lean"], cwd=out, env=env, log=out / f"{name}.log")
    result = command([lean, "-j", "2", "--run", "Tests.lean"], cwd=out, env=env, log=out / "ExecutionTests.log", timeout=300)
    for line in result.splitlines():
        if line.startswith("PASS"):
            print(line, flush=True)
    expected = {tuple(map(int, line.split()[1:5])): int(line.split()[5])
                for line in result.splitlines() if line.startswith("CASE ")}
    cross = {"status": "explicitly-skipped", "pairs": 0}
    if not args.skip_qemu:
        if not shutil.which(args.qemu):
            raise RuntimeError("QEMU missing; install/set QEMU_RVV or explicitly pass --skip-qemu")
        binary = out / "check.elf"
        command([args.cc, "-march=rv64gcv", "-mabi=lp64d", "-O2", "-mcmodel=medany",
                 "-fno-builtin", "-fno-tree-vectorize", "-fno-tree-loop-distribute-patterns",
                 "-fno-stack-protector", "-fno-strict-aliasing", "-nostdlib", "-static",
                 "-Wl,--no-relax", "-Wl,-e,_start", ROOT / "check-start.S",
                 ROOT / "check-assembly.c", assembly, "-o", binary])
        actual = {}
        for vlen in [128, 256, 512]:
            output = command([args.qemu, "-cpu", f"rv64,v=true,vlen={vlen},elen=64,vext_spec=v1.0", binary],
                             log=out / f"QEMU-{vlen}.log", timeout=30)
            for line in output.splitlines():
                if re.fullmatch(r"\d+ \d+ \d+ \d+", line):
                    n, old, alias, value = map(int, line.split())
                    actual[vlen, n, old, alias] = value
        if actual != expected or len(actual) != 252:
            raise RuntimeError("Lean vs actual assembled program: result/key mismatch")
        cross = {"status": "passed", "pairs": len(actual), "elf_sha256": digest(binary)}
        print(f"PASS actual assembly vs Lean: {len(actual)} cases", flush=True)
    frozen = {name: digest(out / name) for name in
              ["Machine.lean", "Impl.lean", "ReductionContract.lean", "Spec.lean", "ProofSupport.lean",
               "kernel.s", "SourceMap.json"]}
    task = {"schema": 1, "claim": "Kernel.correctnessClaim", "theorem": "Kernel.correctness",
            "lean_version": version, "protected_sha256": frozen,
            "allowed_axioms": ["propext", "Classical.choice", "Quot.sound"],
            "proof_file": "Proof.lean", "status": "awaiting-proof", "scope": "assembly-model-total-correctness",
            "source_sha256": digest(REPO / "kernels/target/qu8-rsum.c"),
            "translator_sha256": digest(ROOT / "translate.py")}
    (out / "ProofTask.json").write_text(json.dumps(task, indent=2) + "\n")
    shutil.copy2(ROOT / "PROOF-PROMPT.md", out / "PROOF-PROMPT.md")
    report = {"status": "translation-and-execution-checked", "instruction_count": len(mapping["instructions"]),
              "lean": version, "compiler": cc_version, "lean_execution_cases": 1512,
              "cross_check": cross, "generic_proofs": ["Assembly.run_sound", "Assembly.total_of_rank"],
              "universal_kernel_proof": "not-generated", "sail_refinement": "not-proved",
              "assembly_sha256": digest(assembly), "protected_sha256": frozen}
    (out / "Result.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"Ready: {out / 'Impl.lean'}, {out / 'Spec.lean'}, {out / 'ProofTask.json'}")
    print("Universal kernel correctness is a pending proof obligation, not established by these tests.")


if __name__ == "__main__":
    main()
