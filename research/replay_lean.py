"""Diagnostic replay with an explicit installed toolchain, not result publication.

Usage: python3 research/replay_lean.py /absolute/toolchain/root
Does not alter the pinned lean-toolchain, proofs, or published result records.
"""
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from workflow.verification.elementwise_compiler.lean_check import _LEAN_DEPENDENCIES

toolchain = Path(sys.argv[1]).resolve()
lean = str(toolchain / "bin/lean")
records = []
with tempfile.TemporaryDirectory(prefix="saltyrn-research-replay-") as tmp:
    stage = Path(tmp)
    env = dict(os.environ, LEAN_PATH=str(stage) + os.pathsep + str(toolchain / "lib/lean"))
    def check(path, output=True):
        args = [lean, "-R", str(stage)]
        if output:
            args += ["-o", str(path.with_suffix(".olean"))]
        result = subprocess.run(args + [str(path)], cwd=stage, env=env, text=True, capture_output=True, timeout=240)
        print(path.relative_to(stage), result.returncode, flush=True)
        if result.returncode:
            print(result.stdout + result.stderr, flush=True)
        return result
    for relative in _LEAN_DEPENDENCIES:
        path = stage / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT / "src/verification_bw/lean" / relative, path)
        result = check(path)
        if result.returncode:
            raise SystemExit(1)
    for program in sorted((ROOT / "verification/elementwise-results/programs").iterdir()):
        terminal = "Proof.lean" if (program / "Proof.lean").exists() else "Counterexample.lean"
        if not (program / terminal).exists():
            continue
        namespace = next(line.split()[1] for line in (program / "Spec.lean").read_text().splitlines() if line.startswith("namespace "))
        directory = stage.joinpath(*namespace.split("."))
        directory.mkdir(parents=True, exist_ok=True)
        ok = True
        for name in ("Models.lean", "Spec.lean", terminal):
            path = directory / name
            shutil.copyfile(program / name, path)
            result = check(path)
            if result.returncode:
                ok = False
                break
        theorem = "completeValueEquivalence" if terminal == "Proof.lean" else ("neonPhaseFunctionsCounterexample" if program.name == "s8-vclamp" else "completeValueEquivalenceCounterexample")
        if terminal == "Proof.lean":
            task = json.loads((program / "ProofTask.json").read_text())
            theorem = task["theorem"]
        else:
            theorem = namespace + "." + theorem
        axioms = ""
        if ok:
            audit = stage / "Audit.lean"
            audit.write_text(f"import {namespace}.{Path(terminal).stem}\n#print axioms {theorem}\n")
            result = check(audit, output=False)
            ok = result.returncode == 0
            axioms = result.stdout + result.stderr
            print(axioms, flush=True)
        records.append({"kernel": program.name, "artifact": terminal, "success": ok, "axioms_output": axioms})
version = subprocess.run([lean, "--version"], text=True, capture_output=True).stdout.strip()
(ROOT / "research/lean-replay.json").write_text(json.dumps({"toolchain": version, "boundary": "diagnostic replay, not the original pinned-toolchain artifact-policy certification", "results": records}, indent=2) + "\n")
