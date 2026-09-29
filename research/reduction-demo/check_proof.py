"""Independent fresh-stage checker for the manual reduction pilot.

This is deliberately NOT the production elementwise artifact publisher. It checks
the frozen pilot claim, source identities, proof syntax policy, and axioms. A
compiling partial proof is never reported as complete equivalence.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

from run_tests import ROOT, DEFAULT_LEAN, check_frozen, digest

SAFETY = ROOT.parents[1] / "src/workflow/verification/elementwise_compiler/lean_safety.py"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--result", type=Path)
    args = parser.parse_args()
    start = time.monotonic()
    task = json.loads((ROOT / "ProofTask.json").read_text())
    before = check_frozen()
    policy = importlib.util.spec_from_file_location("pilot_lean_safety", SAFETY)
    assert policy and policy.loader
    module = importlib.util.module_from_spec(policy)
    policy.loader.exec_module(module)
    proof_path = ROOT / "Proof.lean"
    if not proof_path.exists():
        raise SystemExit("Proof.lean absent: no proof to check")
    source = proof_path.read_text()
    clean = module.strip_lean_comments_and_strings(source)
    tokens = set(re.findall(r"[A-Za-z_][A-Za-z0-9_']*", clean))
    blocked = tokens & module.FORBIDDEN_LEAN_IDENTIFIERS
    if blocked or "skipKernelTC" in clean:
        raise SystemExit(f"Forbidden proof escape: {sorted(blocked)}")
    imports = re.findall(r"^\s*import\s+(.+)$", clean, re.MULTILINE)
    if imports != ["Spec"]:
        raise SystemExit(f"Proof must import only frozen Spec: {imports}")
    proof_hash = digest(proof_path)
    namespace = task["namespace"]
    helpers = re.findall(r"^theorem\s+([A-Za-z_][A-Za-z0-9_']*)\b", clean, re.MULTILINE)
    lean = os.environ.get("LEAN_BIN", str(DEFAULT_LEAN))
    version = subprocess.check_output([lean, "--version"], text=True).strip()
    if not version.startswith("Lean (version 4.29.1,"):
        raise SystemExit(f"Unexpected toolchain: {version}")
    log: list[str] = []
    axioms: dict[str, list[str]] = {}
    result = {
        "kind": task["kind"],
        "status": "lean-failed",
        "claim": task["claim"],
        "target_theorem": task["theorem"],
        "lean": version,
        "lean_binary_sha256": digest(Path(lean)),
        "proof_sha256": proof_hash,
        "task_sha256": digest(ROOT / "ProofTask.json"),
        "checker_sha256": digest(Path(__file__)),
        "shared_check_utils_sha256": digest(ROOT / "run_tests.py"),
        "lexical_policy_sha256": digest(SAFETY),
        "protected_sha256": before,
        "public_spec_definitions": re.findall(r"^def\s+(\w+)", (ROOT / "Spec.lean").read_text(), re.MULTILINE),
    }
    with tempfile.TemporaryDirectory(prefix="salty-reduction-proof-") as folder:
        stage = Path(folder)
        env = {**os.environ, "LEAN_PATH": str(stage)}
        for name in ("Models.lean", "Spec.lean", "Proof.lean"):
            shutil.copy2(ROOT / name, stage / name)

        def run(name: str, emit: bool = False) -> subprocess.CompletedProcess[str]:
            cmd = [lean]
            if emit:
                cmd += ["-o", str(Path(name).with_suffix(".olean"))]
            cmd += [name]
            completed = subprocess.run(cmd, cwd=stage, env=env, capture_output=True,
                                       text=True, timeout=240)
            log.append(f"$ {' '.join(cmd)}\n{completed.stdout}{completed.stderr}")
            return completed

        compiled = True
        for name in ("Models.lean", "Spec.lean", "Proof.lean"):
            print(f"Checking {name} in fresh stage...", flush=True)
            if run(name, True).returncode:
                compiled = False
                result["detail"] = f"Lean rejected {name}"
                break
        if compiled:
            audit_source = "import Proof\n" + "".join(
                f"#print axioms {namespace}.{name}\n" for name in helpers)
            (stage / "HelperAudit.lean").write_text(audit_source)
            audit = run("HelperAudit.lean")
            records = re.findall(r"'([^']+)' (?:depends on axioms:\s*\[([^]]*)\]|does not depend on any axioms)",
                                 audit.stdout + audit.stderr)
            for name, values in records:
                axioms[name] = [x.strip() for x in values.split(",") if x.strip()]
            expected_names = {f"{namespace}.{name}" for name in helpers}
            allowed = set(task["allowed_axioms"])
            if (audit.returncode or set(axioms) != expected_names or
                    any(set(values) - allowed for values in axioms.values())):
                result["detail"] = "Helper axiom audit failed or was incomplete"
            else:
                (stage / "TargetAudit.lean").write_text(
                    "import Proof\n"
                    f"example : {task['claim']} := {task['theorem']}\n"
                    f"#print axioms {task['theorem']}\n")
                target = run("TargetAudit.lean")
                if target.returncode == 0 and task["theorem"] in axioms:
                    result["status"] = "verified-manual-value-model"
                    result["detail"] = "Lean accepted the exact frozen target and standard-axiom policy"
                else:
                    result["status"] = "partial-proof-target-not-established"
                    result["detail"] = "Helper theorems check, but the single complete equivalence target does not"
        if check_frozen() != before or digest(proof_path) != proof_hash:
            result["status"] = "integrity-failed"
            result["detail"] = "Source/model/spec/proof changed while checking"
    result["checked_helper_count"] = len(axioms)
    result["helper_axioms"] = axioms
    result["seconds"] = round(time.monotonic() - start, 3)
    result["boundary"] = "Hand-translated value model, not certified C lowering, memory/ISA/binary equivalence, or production elementwise gate"
    print(json.dumps(result, indent=2))
    if args.result:
        args.result.write_text(json.dumps(result, indent=2) + "\n")
        args.result.with_suffix(".log").write_text("\n".join(log))
    if result["status"] != "verified-manual-value-model":
        raise SystemExit(1)


if __name__ == "__main__":
    main()
