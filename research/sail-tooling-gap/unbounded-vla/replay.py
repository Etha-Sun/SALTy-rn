#!/usr/bin/env python3
"""Recheck abstract proofs and their axiom dependencies; never claim ISA equivalence."""
import hashlib
import json
import re
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ALLOW = {"propext", "Classical.choice", "Quot.sound"}
FILES = ["Chunked.lean", "Memory.lean", "SailVLProof.lean", "NegativeControls.lean"]
EXPECTED = {
    "chunkLoop_exact", "neonLoop_exact", "fixed_to_vla", "s8max_fixed_to_vla",
    "lane_equal", "execution_exact", "execution_progress", "no_infinite_progress",
    "balanced_legal", "write_prefix", "execute_exact", "schedule_sum",
    "memory_fixed_to_vla", "s8max_memory_fixed_to_vla", "emitted_vl_is_min",
    "emitted_vl_progress", "emitted_vl_for_representable_length",
    "wrong_opcode_witness", "wrong_signedness_witness", "missing_last_byte_witness",
    "overlap_witness",
}


def run(name, command, timeout=60):
    start = time.monotonic()
    r = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE,
                       stderr=subprocess.STDOUT, timeout=timeout)
    (ROOT / "logs" / (name + ".log")).write_text(r.stdout)
    return {"command": command, "exit_code": r.returncode,
            "seconds": round(time.monotonic() - start, 3)}, r.stdout


def main():
    results, axioms = {}, {}
    results["extract"], _ = run("extract", ["python3", "extract_vl.py"])
    results["update"], _ = run("lake-update", ["lake", "update"])
    results["build"], _ = run("lake-build", ["lake", "build"])
    for file in FILES:
        result, output = run(file[:-5], ["lake", "env", "lean", file])
        results[file] = result
        for name, deps in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", output):
            axioms[name] = [d.strip() for d in deps.split(",") if d.strip()]
        for name in re.findall(r"'([^']+)' does not depend on any axioms", output):
            axioms[name] = []

    # Concrete wrong claims use precisely the same terms as the positive witnesses.
    negative = ROOT / "results/RejectedClaims.lean"
    negative.write_text((ROOT / "NegativeControls.lean").read_text().replace(" ≠", " ="))
    rejected, output = run("rejected-claims", ["lake", "env", "lean", str(negative)])
    rejected["false_claims_reported"] = output.count("to be false") + output.count("is false")
    rejected["passed"] = rejected["exit_code"] != 0 and rejected["false_claims_reported"] == 4
    results["negative_claim_rejection"] = rejected

    found = {name.rsplit(".", 1)[-1] for name in axioms}
    axiom_ok = found == EXPECTED and all(set(deps) <= ALLOW for deps in axioms.values())
    build_ok = all(r["exit_code"] == 0 for key, r in results.items() if key != "negative_claim_rejection")
    passed = build_ok and axiom_ok and rejected["passed"]
    artifacts = [*FILES, "SailVLExtract.lean", "lakefile.toml", "lean-toolchain", "extract_vl.py", "replay.py"]
    report = dict(
        passed=passed, scope="abstract block-memory and loop equivalence; extracted pure VL helper",
        arbitrary_input_length_abstract=True, variable_non_aligned_chunks_abstract=True,
        disjoint_and_in_place_memory_abstract=True, abstract_termination_checked=True,
        llm_not_in_abstract_proof_tcb=True, axiom_audit_passed=axiom_ok,
        isa_to_block_refinement_proved=False, cross_isa_machine_code_equivalence_proved=False,
        arm_full_isa_imported=False, rvv_full_isa_imported=False,
        known_limitation="No whole-ISA-to-block bridge; natural-number addresses; no decoder, exceptions or register state.",
        checks=results, axioms=axioms,
        sha256={p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in artifacts},
    )
    (ROOT / "results/verification.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({k: v for k, v in report.items() if k not in {"checks", "axioms", "sha256"}}, indent=2))
    return 0 if passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
