#!/usr/bin/env python3
"""SMT-check active lanes in retained symbolic-VL Isla traces (diagnostic only).

This checks the emitted formulas, NOT their translation/completeness or a kernel.
The Python extractor and SMT answers are not independently certified in Lean.
LMUL=1 is a scaling diagnostic; the target program uses LMUL=8.
"""
import concurrent.futures
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent))
from compare_traces import emit, extract, parse, Z3

TRACE = ROOT.parent / "logs/rv-vmax-vla-m1.trace"


def check(item):
    index, trace = item
    assert trace[0] == "trace"
    decls, defs, predicates, assumptions = [], [], [], []
    reads, writes = {}, {}
    allowed = {"assume-reg", "read-reg", "write-reg", "declare-const", "define-const",
               "define-enum", "assert", "assume", "branch", "branch-address", "cycle"}
    for event in trace[1:]:
        if event[0] not in allowed:
            raise ValueError("Unsupported event: " + event[0])
        if event[0] == "declare-const":
            sort = event[2]
            if not (sort == "Bool" or isinstance(sort, list) and sort[:2] == ["_", "BitVec"]):
                raise ValueError("Unsupported declaration")
            decls.append(emit(event))
        elif event[0] == "define-const": defs.append(event[1:])
        elif event[0] == "assert": predicates.append(event[1])
        elif event[0] == "assume": assumptions.append(event[1])
        elif event[0] == "read-reg": reads.setdefault(event[1], event[3])
        elif event[0] == "write-reg": writes[event[1]] = event[3]

    def resolve(e):
        if e == ["|vl|", "nil"]: return reads["|vl|"]
        if isinstance(e, list):
            if e and isinstance(e[0], str) and e[0].startswith("|"):
                raise ValueError("Unresolved register assumption")
            return [resolve(x) for x in e]
        return e

    predicates.extend(resolve(a) for a in assumptions)
    predicates.extend([
        ["=", reads["|vr8|"], "input"],
        ["=", reads["|x14|"], [["_", "sign_extend", "56"], "threshold"]],
        ["=", reads["|vl|"], "vl"],
    ])
    expected = []
    for i in range(32):
        source = extract("input", i * 8 + 7, i * 8)
        result = extract(writes["|vr8|"], i * 8 + 7, i * 8)
        maximum = ["ite", ["bvslt", source, "threshold"], "threshold", source]
        expected.append(["or", ["bvuge", f"#x{i:016x}", "vl"], ["=", result, maximum]])

    prefix = "".join("(let ((" + n + " " + emit(e) + "))\n" for n, e in defs)
    suffix = ")" * len(defs)
    feasible = prefix + emit(["and", *predicates]) + suffix
    unequal = prefix + emit(["and", *predicates, ["not", ["and", *expected]]]) + suffix
    smt = "(set-option :timeout 30000)\n(set-logic QF_BV)\n"
    smt += "(declare-const input (_ BitVec 256))\n(declare-const threshold (_ BitVec 8))\n(declare-const vl (_ BitVec 64))\n"
    smt += "\n".join(decls) + "\n(push)\n(assert " + feasible + ")\n(check-sat)\n(get-value (vl))\n(pop)\n"
    smt += "(assert " + unequal + ")\n(check-sat)\n"
    path = ROOT / "results" / f"m1-trace-{index:02}.smt2"
    path.write_text(smt)
    r = subprocess.run([str(Z3), str(path)], text=True, stdout=subprocess.PIPE,
                       stderr=subprocess.STDOUT, timeout=45)
    (ROOT / "logs" / f"m1-trace-{index:02}.log").write_text(r.stdout)
    statuses = re.findall(r"^(sat|unsat|unknown)$", r.stdout, re.M)
    witness = re.search(r"\(vl #x([0-9a-f]+)\)", r.stdout)
    return dict(trace=index, statuses=statuses, feasible_vl=int(witness[1], 16) if witness else None,
                passed=r.returncode == 0 and statuses == ["sat", "unsat"] and "(error" not in r.stdout,
                smt_sha256=hashlib.sha256(path.read_bytes()).hexdigest())


def main():
    traces = parse(TRACE.read_text())
    if len(traces) != 32: raise ValueError("Expected 32 retained traces")
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        checks = list(pool.map(check, enumerate(traces)))
    result = dict(
        all_emitted_traces_passed=all(c["passed"] for c in checks),
        feasible_vl_values=sorted(c["feasible_vl"] for c in checks if c["feasible_vl"] is not None),
        trace_sha256=hashlib.sha256(TRACE.read_bytes()).hexdigest(),
        scope="vmax.vx, VLEN=256, SEW=8, LMUL=1, symbolic VL in 1..32, active lanes only",
        independently_checked_certificate=False, trace_completeness_proved=False,
        target_lmul8_verified=False, kernel_equivalence_proved=False, checks=checks,
    )
    (ROOT / "results/m1-trace-check.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({k: v for k, v in result.items() if k != "checks"}, indent=2))
    return 0 if result["all_emitted_traces_passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
