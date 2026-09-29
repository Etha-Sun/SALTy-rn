#!/usr/bin/env python3
"""Fresh Lean build, frozen-input checks, exact theorem check and axiom audit.

This checker validates a proof relative to the reviewed frozen model/contract.
The JSON manifest is a local freeze record, not a signed provenance certificate.
"""
from __future__ import annotations

import argparse
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

from run import ROOT, REPO, digest


def check(out: Path):
    task_path = out / "ProofTask.json"
    task_hash = digest(task_path)
    task = json.loads(task_path.read_text())
    if task["claim"] != "Kernel.correctnessClaim" or task["theorem"] != "Kernel.correctness":
        raise ValueError("unexpected proof target")
    frozen = task["protected_sha256"]
    required = {"Machine.lean", "Impl.lean", "ReductionContract.lean", "Spec.lean", "ProofSupport.lean"}
    if not required <= frozen.keys():
        raise ValueError("manifest does not freeze all Lean dependencies")
    for name in frozen:
        if Path(name).name != name:
            raise ValueError("protected file names must be local basenames")
        if digest(out / name) != frozen[name]:
            raise ValueError(f"frozen input changed: {name}")
    proof = out / "Proof.lean"
    if not proof.exists():
        return {"status": "awaiting-proof", "claim": task["claim"], "universal_kernel_proof": False}
    safety_path = REPO / "src/workflow/verification/elementwise_compiler/lean_safety.py"
    spec = importlib.util.spec_from_file_location("lean_safety", safety_path)
    assert spec and spec.loader
    safety = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(safety)
    source = proof.read_text()
    proof_hash = digest(proof)
    clean = safety.strip_lean_comments_and_strings(source)
    tokens = set(re.findall(r"[A-Za-z_][A-Za-z0-9_']*", clean))
    prohibited = safety.FORBIDDEN_LEAN_IDENTIFIERS | {
        "elab", "macro", "syntax", "initialize", "builtin_initialize", "skipKernelTC"}
    if tokens & prohibited:
        raise ValueError(f"forbidden proof constructs: {sorted(tokens & prohibited)}")
    imports = re.findall(r"^\s*import\s+([^\n]+)", clean, re.MULTILINE)
    if sorted(imports) != ["ProofSupport", "Spec"]:
        raise ValueError("Proof.lean must import exactly Spec and ProofSupport, one per line")
    logs = []
    with tempfile.TemporaryDirectory(prefix="assembly-reduction-proof-") as directory:
        stage = Path(directory)
        env = {**os.environ, "ELAN_TOOLCHAIN": (ROOT / "lean-toolchain").read_text().strip(),
               "LEAN_PATH": str(stage)}
        lean = os.environ.get("LEAN_BIN", "lean")
        version = subprocess.check_output([lean, "--version"], env=env, text=True).strip()
        if version != task["lean_version"]:
            raise ValueError(f"toolchain mismatch: {version}")
        order = ["Machine", "Impl", "ReductionContract", "Spec", "ProofSupport", "Proof"]
        for name in order:
            shutil.copy2(out / f"{name}.lean", stage / f"{name}.lean")
        (stage / "Audit.lean").write_text(
            "import Proof\n"
            "example : Kernel.correctnessClaim := @Kernel.correctness\n"
            "#print axioms Kernel.correctness\n")
        for name in order + ["Audit"]:
            p = subprocess.run([lean, "-j", "2", "-o", f"{name}.olean", f"{name}.lean"], cwd=stage,
                               env=env, text=True, capture_output=True, timeout=300)
            logs.append(f"$ lean {name}.lean\n{p.stdout}{p.stderr}")
            (out / "ProofCheck.log").write_text("\n".join(logs))
            if p.returncode or re.search(r"declaration uses ['`]sorry", p.stdout + p.stderr):
                raise ValueError(f"Lean rejected {name}.lean; see ProofCheck.log")
        audit = logs[-1]
        match = re.search(r"depends on axioms:\s*\[([^\]]*)\]", audit, re.S)
        if match:
            axioms = [a.strip() for a in match[1].split(",") if a.strip()]
        elif "does not depend on any axioms" in audit:
            axioms = []
        else:
            raise ValueError("missing axiom audit")
        allowed = {"propext", "Classical.choice", "Quot.sound"}
        if set(axioms) - allowed:
            raise ValueError(f"unapproved axioms: {axioms}")
    if digest(task_path) != task_hash or digest(proof) != proof_hash:
        raise ValueError("proof/task changed during check")
    for name, expected in frozen.items():
        if digest(out / name) != expected:
            raise ValueError(f"frozen input changed during check: {name}")
    return {"status": "proved-relative-to-assembly-model", "claim": task["claim"],
            "universal_kernel_proof": True, "axioms": axioms, "proof_sha256": proof_hash,
            "task_sha256": task_hash, "checker_sha256": digest(__file__),
            "protected_sha256": frozen, "sail_refinement": "not-proved"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, default=ROOT / "out")
    args = parser.parse_args()
    out = args.out.resolve()
    try:
        result = check(out)
    except (ValueError, OSError, subprocess.SubprocessError) as e:
        result = {"status": "rejected", "universal_kernel_proof": False, "reason": str(e)}
    (out / "ProofResult.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if result["universal_kernel_proof"] else 2)


if __name__ == "__main__":
    main()
