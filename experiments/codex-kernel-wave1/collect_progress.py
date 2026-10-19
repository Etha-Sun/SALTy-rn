"""Summarize evidence; missing body reports must never appear as 0/0 success."""
from datetime import datetime, timezone
import hashlib
import json
import os
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
baseline = json.loads((HERE / "baseline.json").read_text())
changed = [name for name, digest in baseline["tracked_files_sha256"].items()
           if not (ROOT / name).is_file()
           or hashlib.sha256((ROOT / name).read_bytes()).hexdigest() != digest]
runs = []
for directory, subdirs, files in os.walk(HERE):
    subdirs[:] = [d for d in subdirs if d not in {".build", "_build", ".frama-c", "__pycache__"}]
    for name in sorted(files):
        if not name.endswith("-summary.json"):
            continue
        path = Path(directory) / name
        data = json.loads(path.read_text())
        raw_path = path.with_name(name.replace("-summary.json", ".json"))
        raw = json.loads(raw_path.read_text()) if raw_path.exists() else []
        body_present = any(row.get("function") for row in raw)
        final_body = data.get("exit") == 0 and body_present
        count = {"passed": sum(bool(row["passed"]) for row in raw), "total": len(raw)}
        actual = data.get("actual_command") or data.get("command") or []
        model = actual[actual.index("-wp-model") + 1] if "-wp-model" in actual else "Typed(default)"
        frontend = str(actual[0]) if actual else ""
        removed_range = any(tag in frontend for tag in ("integer-byte-v4-no-pointer-range", "native-bytes32-v6"))
        range_conflict = model.startswith("Bytes") and not removed_range
        runs.append({
            "path": str(path.relative_to(ROOT)), "case": data.get("case"),
            "complete": data.get("complete", False), "exit": data.get("exit"),
            "model_pointer_range_conflict": range_conflict,
            "pointer_range_scope": ("Historical solver result under conflicting address theory; not accepted equivalence evidence"
                                    if range_conflict else "Conflict removed in isolated model; remaining model is TCB"
                                    if removed_range else "This Bytes-specific conflict not established for this profile"),
            "seconds": data.get("seconds"),
            "final_raw_obligations": count if final_body else None,
            "available_raw_obligations": count if raw else None,
            "body_report_missing": not body_present,
            "pending_count": sum(not row["passed"] for row in raw) if final_body else None,
            "source_guard": data.get("source_guard", {}).get("passed"),
            "inputs_unchanged": data.get("unchanged"),
            "model_inputs_unchanged": data.get("model_inputs_unchanged"),
            "model_control_accepted": (data.get("model_control") or {}).get("accepted"),
            "missing_body_ensures": data.get("missing_body_ensures", []),
            "missing_global_lemmas": data.get("missing_global_lemmas", []),
        })
admitted = json.loads((ROOT / "verified/manifest.json").read_text())["programs"]
baseline_manifest = json.loads(subprocess.check_output(
    ["git", "show", baseline["head"] + ":verified/manifest.json"], cwd=ROOT, text=True))
baseline_names = {item["name"] for item in baseline_manifest["programs"]}
new_admissions = [item["name"] for item in admitted if item["name"] not in baseline_names]
report = {
    "updated_utc": datetime.now(timezone.utc).isoformat(),
    "status": "active; complete WP candidates still require independent root replay and audit",
    "deepseek_used": False, "formal_admitted_baseline": 11,
    "pointer_range_model_audit": "experiments/codex-kernel-wave1/audit/pointer-range-consistency-root01/review.json",
    "pointer_range_mathematical_conflict_checked": True,
    "pointer_range_admission_rule": "No new Bytes admission using old universal range law; unchanged C/spec/proof require new weakened-model full and independent replay",
    "pending_baseline": 26, "missing_target_baseline": 3,
    "formal_admitted_current": len(admitted),
    "formal_count_scope": "Archived admissions under their recorded model; not a claim that all generated model hypotheses follow from public specs.",
    "legacy_admissions_with_unresolved_model_domain": ["qs8-rsum", "qu8-rsum"],
    "legacy_model_domain_note": "Original archived configurations retain extra hypotheses; isolated aliasable-table configurations passed complete agent and independent root replays without changing C/spec/proof. Official packages not yet updated.",
    "independent_model_domain_replay": "experiments/codex-kernel-wave1/audit/model-hypotheses-independent01/root-independent03-review.json",
    "model_domain_audit": "experiments/codex-kernel-wave1/audit/model-hypotheses-independent01/",
    "new_formal_admissions": new_admissions,
    "pending_current": 26 - len(new_admissions),
    "reviewed_manifest_admission_commit": "6b94085",
    "tracked_inputs_checked": len(baseline["tracked_files_sha256"]),
    "tracked_inputs_changed": changed,
    "runs": sorted(runs, key=lambda row: row["path"]),
    "gemm_diagnosis": json.loads((HERE / "gemm-audit/audit.json").read_text()),
}
(HERE / "progress.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"tracked_changed": changed, "full_run_records": len(runs)}, ensure_ascii=False))
