"""Summarize frozen command timings; never rerun or overwrite a proof package."""
from collections import defaultdict
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
PACKAGES = ROOT / "build/four-isa-vabs/verification/qcp/verified"
CASES = {
    "f32-vadd": "status.json",
    "x32-packw-gemm-goi": "full-status.json",
    "f32-raddstoreexpminusmax": "full-status.json",
    "f32-conv-hwc2chw": "full-status.json",
}


def classify(record):
    names = {Path(str(x)).name for x in record["command"]}
    for command, group in [("coqc", "coqc"), ("qcp", "qcp"),
                           ("symexec", "qcp"), ("StrategyCheck", "strategy"),
                           ("coqdep", "coqdep")]:
        if command in names:
            return group
    return "cpp" if "-cpp" in record["label"] else "other"


result = {
    "scope": "Historical recorded command elapsed times, not fresh measurements",
    "warning": "Sums overlap under concurrency: neither wall time nor CPU time; no measured cache speedup",
    "cases": {},
}
for case, filename in CASES.items():
    path = PACKAGES / case / "proof" / filename
    data = json.loads(path.read_text())
    groups = defaultdict(list)
    for record in data["records"]:
        groups[classify(record)].append(record)
    result["cases"][case] = {
        "source": str(path.relative_to(ROOT)),
        "source_sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "passed_record": data["passed"],
        "historical_run": data["run_directory"],
        "groups": {key: {
            "commands": len(records),
            "sum_command_elapsed_s": sum(x["seconds"] for x in records),
            "max_command_elapsed_s": max(x["seconds"] for x in records),
        } for key, records in groups.items()},
        "slowest": [{"label": x["label"], "elapsed_s": x["seconds"]}
                    for x in sorted(data["records"], key=lambda x: x["seconds"], reverse=True)[:10]],
        "unit_vcs": {x["stem"]: x["c_vcs"] for x in data.get("actual_c_units", [])},
        "fresh_local_modules": data.get("fresh_compiled_local_modules", data.get("freshly_compiled_local_modules")),
    }
coq = PACKAGES / "f32-raddstoreexpminusmax/proof/coq"
goal = coq / "rvv_unit_goal.v"
leaves = list(coq.glob("RvvLeaf*.v"))
result["exp_goal_dependency_observation"] = {
    "goal_bytes": goal.stat().st_size,
    "goal_lines": len(goal.read_text().splitlines()),
    "goal_sha256": hashlib.sha256(goal.read_bytes()).hexdigest(),
    "rvv_leaf_files": len(leaves),
    "rvv_leaves_mentioning_whole_goal_module": sum("rvv_unit_goal" in f.read_text() for f in leaves),
    "interpretation": "Coarse compilation dependency; not evidence that all leaf propositions change after an edit",
}
output = Path(__file__).with_name("QCP-HISTORICAL-COSTS.json")
output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n")
print(output)
