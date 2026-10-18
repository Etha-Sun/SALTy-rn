"""Fresh complete WP check; fail on unproved goals, missing coverage or changed inputs."""
import argparse
from collections import Counter
import datetime
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import time
import audit

ROOT = Path(__file__).resolve().parent


def hashes():
    names = ["proof.c", "provenance.json", "audit.py", "check.py", "original/neon.c", "original/rvv.c"]
    return {name: audit.digest((ROOT / name).read_bytes()) for name in names}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--framac", default=os.environ.get("FRAMAC", "frama-c"))
    parser.add_argument("--prover-bin", default=os.environ.get("PROVER_BIN"))
    parser.add_argument("--name", default="replay", help="log prefix; retain recorded evidence by using a new name")
    args = parser.parse_args()
    if not args.name.replace("-", "").replace("_", "").isalnum():
        parser.error("name must contain only letters, digits, - or _")
    source_audit = audit.check()
    if not source_audit["passed"]:
        raise SystemExit(json.dumps(source_audit, indent=2))
    manifest = json.loads((ROOT / "provenance.json").read_text())
    env = dict(os.environ)
    if args.prover_bin:
        env["PATH"] = str(Path(args.prover_bin).resolve()) + os.pathsep + env["PATH"]
    tool = shutil.which(args.framac, path=env["PATH"])
    if tool is None:
        parser.error("Frama-C unavailable; set --framac or FRAMAC")
    (ROOT / "logs").mkdir(exist_ok=True)
    raw = ROOT / "logs" / f"{args.name}.json"
    command = [tool, "-machdep", "x86_64", "-inline-calls", "test_neon,test_rvv",
               "-inline-stmt-contracts", "-remove-inlined", "test_neon,test_rvv",
               "-wp", "-wp-rte", "-wp-par", "2", "-wp-prover", "z3,cvc5,alt-ergo",
               "-wp-timeout", "10", "-wp-memlimit", "1024", "-wp-cache", "none",
               "-wp-session", str(ROOT / ".build" / args.name),
               "-wp-report-json", str(raw), str(ROOT / "proof.c")]
    versions = {}
    for name, version_args in [(tool, ["-version"]), ("z3", ["--version"]),
                               ("cvc5", ["--version"]), ("alt-ergo", ["--version"])]:
        try:
            process = subprocess.run([name, *version_args], env=env, text=True,
                                     capture_output=True, timeout=10)
            versions[name] = (process.stdout + process.stderr).splitlines()[0]
        except (OSError, IndexError, subprocess.TimeoutExpired) as error:
            versions[name] = str(error)
    before = hashes()
    started = time.monotonic()
    timestamp = datetime.datetime.now(datetime.timezone.utc).isoformat()
    # Remove only this run's stale report so a failed new run cannot reuse it.
    raw.unlink(missing_ok=True)
    with (ROOT / "logs" / f"{args.name}.log").open("w") as output:
        output.write("COMMAND " + repr(command) + "\n")
        output.flush()
        try:
            code = subprocess.run(command, env=env, stdout=output,
                                  stderr=subprocess.STDOUT, timeout=600).returncode
        except subprocess.TimeoutExpired:
            code = 124
    rows = json.loads(raw.read_text()) if raw.exists() else []
    seen = {r["function"] for r in rows if "ensures" in r["goal"]}
    missing = sorted(set(manifest["expected_body_ensures"]) - seen)
    goal_hash = audit.digest("\n".join(sorted(r["goal"] for r in rows)).encode())
    exact_coverage = len(rows) == manifest["expected_goal_count"] and goal_hash == manifest["expected_goal_names_sha256"]
    unchanged = before == hashes()
    complete = (code == 0 and bool(rows) and all(r["passed"] for r in rows)
                and unchanged and not missing and exact_coverage)
    report = dict(started_utc=timestamp, command=command, exit=code,
                  seconds=round(time.monotonic() - started, 3), tool_versions=versions,
                  input_sha256=before, source_unchanged_during_run=unchanged,
                  source_audit=source_audit,
                  raw_obligations=dict(passed=sum(bool(r["passed"]) for r in rows), total=len(rows)),
                  pending=[r for r in rows if not r["passed"]],
                  goals_per_function=dict(sorted(Counter(r["function"] for r in rows).items())),
                  missing_body_ensures=missing, exact_baseline_goal_coverage=exact_coverage,
                  goal_names_sha256=goal_hash, complete_c_output_equivalence=complete,
                  isa_to_c_shim_proved=False, scope=manifest["scope"])
    (ROOT / "logs" / f"{args.name}-summary.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({k: v for k, v in report.items()
                      if k not in ["input_sha256", "pending", "goals_per_function"]}, indent=2))
    raise SystemExit(0 if complete else 1)
