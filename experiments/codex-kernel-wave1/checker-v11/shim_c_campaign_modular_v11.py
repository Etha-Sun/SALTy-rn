"""Modular replay: kernel postconditions are checked against their real bodies."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time
import shim_c_call_closure

ROOT = Path(__file__).resolve().parents[3]
spec = importlib.util.spec_from_file_location("shared_check", ROOT / "tools/shim_c_check.py")
core = importlib.util.module_from_spec(spec)
spec.loader.exec_module(core)
guard = core.guard


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def baseline(case, digest):
    manifest = case / "frozen.json"
    if sha(manifest) != digest:
        raise RuntimeError("Frozen case manifest changed")
    data = json.loads(manifest.read_text())
    for name, item in data["files"].items():
        if Path(name).name != name or not (ROOT / item["path"]).resolve().is_relative_to(ROOT):
            raise RuntimeError("Unsafe frozen source path")
        if sha(ROOT / item["path"]) != item["sha256"]:
            raise RuntimeError("Frozen implementation/spec changed: " + name)
    return data


def prepare(case, digest, name):
    data = baseline(case, digest)
    dest = case / ".build" / name
    if dest.exists():
        raise RuntimeError("Use a fresh build name")
    plain, annotated = dest / "plain", dest / "annotated"
    plain.mkdir(parents=True)
    for file, item in data["files"].items():
        shutil.copyfile(ROOT / item["path"], plain / file)
    shutil.copytree(plain, annotated)
    patches = [ROOT / p for p in data["proof_patches"]]
    public = {"neon.c", "rvv.c", "harness.c", "unit.c"}
    for patch in patches:
        if not patch.exists():
            raise RuntimeError("Missing proof patch: " + str(patch))
        if not patch.read_text().strip():
            continue
        targets = re.findall(r"^(?:--- a/|\+\+\+ b/)([^\s]+)$", patch.read_text(), re.M)
        if not targets or any(t not in data["files"] or t in {"spec.h", "interface.json"} for t in targets):
            raise RuntimeError("Unexpected patch target")
        p = subprocess.run(["patch", "--batch", "--fuzz=0", "-p1", "-i", str(patch)], cwd=annotated, text=True, capture_output=True, timeout=30)
        if p.returncode:
            raise RuntimeError(p.stdout + p.stderr)
    for file in data["files"]:
        if Path(file).suffix not in {".c", ".h"}:
            if (plain/file).read_bytes() != (annotated/file).read_bytes():
                raise RuntimeError("Non-C frozen input changed")
            continue
        before, after = (plain/file).read_text(), (annotated/file).read_text()
        after = core.restore_assert_locations(before, after, "./"+file)
        (annotated/file).write_text(after)
        if guard.raw_c_tokens(before) != guard.raw_c_tokens(after):
            raise RuntimeError("Proof changes C tokens: " + file)
        if file == "spec.h" and before != after:
            raise RuntimeError("Proof changes public spec")
        for m in guard.LEX.finditer(after):
            a = m.group()
            if not a.startswith(("/*@", "//@")):
                continue
            if re.search(r"\b(axiom|axiomatic|assume|admit)\b", a):
                raise RuntimeError("Unchecked assumption: " + file)
            ghost = re.match(r"(?:/\*@|//@)\s*ghost\b", a)
            if ghost and (core.ghost_has_prototype(a) or re.search(r"\b(extern|typedef|typeof|__typeof__|__attribute__|__asm__)\b", a)):
                raise RuntimeError("Unsupported/external ghost declaration: " + file)
            clauses = re.sub(r"\bloop\s+(assigns|invariant|variant)\b", "loop_clause", a)
            if file in public and not ghost and re.search(r"\b(requires|ensures|assigns|terminates|behavior|assumes)\b", clauses):
                # Only a frozen static function with a body may get a private
                # contract. Its body and every call precondition are checked.
                following = guard.without_comments(after[m.end():])
                helper = re.match(r"\s*static\s+(?:inline\s+)?(?:\w+\s+)*(?:\*\s*)?(\w+)\s*\([^;{}]*\)\s*\{", following)
                kernel = re.match(r"\s*(?:static\s+)?(?:inline\s+)?void\s+(test_neon|test_rvv)\s*\([^;{}]*\)\s*(?:XNN_OOB_READS\s*)?\{", following)
                only_ensures = (bool(re.match(r"/\*@\s*ensures\b", a))
                                and not re.search(r"\b(requires|assigns|terminates|behavior|assumes|allocates|frees|exits|returns|breaks|continues|complete|disjoint|decreases)\b", a))
                reviewed_contract = False
                if kernel and file in {"neon.c", "rvv.c"}:
                    review_item = data["files"].get("kernel_contracts.json")
                    if review_item and review_item["sha256"] == "e363d34d8f4d3c572e846c6ac474cc8d02bdd034a4bff7844cec578e0b71f2d6":
                        review_path = ROOT / review_item["path"]
                        approved = json.loads(review_path.read_text())["kernels"].get(data["name"], {})
                        reviewed_contract = a == approved.get(file)
                if not ((helper and helper.group(1) not in {"test_neon", "test_rvv", "equivalent"})
                        or (kernel and only_ensures) or reviewed_contract):
                    raise RuntimeError("Public contract injection: " + file)
    a, _ = guard.clang_tokens(plain, "clang-14")
    b, _ = guard.clang_tokens(annotated, "clang-14")
    if a != b:
        raise RuntimeError("Complete preprocessed token mismatch")
    report = dict(passed=True, frozen_sha256=digest, tokens=len(a), plain=str(plain), annotated=str(annotated),
                  proof={str(p.relative_to(ROOT)):sha(p) for p in patches},
                  generated={f:sha(annotated/f) for f in data["files"]})
    (dest/"guard.json").write_text(json.dumps(report, indent=2)+"\n")
    return data, report


def run(args):
    global explicit_lemmas
    case = args.case.resolve()
    if not case.is_relative_to(ROOT) or not re.fullmatch(r"[A-Za-z0-9_-]+", args.name):
        raise RuntimeError("Unsafe case/run name")
    logs = case/"logs"
    if any((logs/(args.name+s)).exists() for s in [".json", ".log", "-summary.json"]):
        raise RuntimeError("Use a fresh run name")
    data, source = prepare(case, args.frozen_sha256, args.name)
    if args.prepare:
        return source
    annotated = Path(source["annotated"])
    expected, lemmas, ghost_functions = set(), set(), set()
    lemma_properties = {}
    definition = r"^\s*(?:(?:static|inline)\s+)*(?!(?:if|else|for|while|switch|return)\b)(?:\w+)(?:\s*\*)?\s+(\w+)\s*\([^;{}]*\)\s*\{"
    for name in data["files"]:
        if Path(name).suffix not in {".c", ".h"}:
            continue
        text = (annotated/name).read_text()
        expected.update(re.findall(definition, guard.without_comments(text), re.M))
        for m in guard.LEX.finditer(text):
            if not m.group().startswith(("/*@", "//@")):
                continue
            for lemma in re.finditer(r"\b(?:(check)\s+)?lemma\s+(\w+)\s*(?:\{[^}]*\})?\s*:", m.group()):
                lemma_name = lemma.group(2)
                lemmas.add(lemma_name)
                lemma_properties[lemma_name] = ("check_lemma_" if lemma.group(1) else "lemma_") + lemma_name
            if re.match(r"/\*@\s*ghost\b", m.group()):
                ghost_functions.update(re.findall(definition, m.group(), re.M))
    call_closure = shim_c_call_closure.closure(annotated/"unit.c", ghost_functions)
    expected = set(call_closure["functions"]) | ghost_functions
    explicit_lemmas = bool(call_closure["unreachable_definitions"] and lemmas)
    logs.mkdir(exist_ok=True)
    raw = logs/(args.name+".json")
    command = [args.framac, "-machdep", "gcc_x86_64", "-wp", "-wp-rte", "-wp-par", "2", "-wp-prover", "z3,cvc5,alt-ergo", "-wp-timeout", "10", "-wp-memlimit", "1024", "-wp-cache", "none", "-wp-report-json", str(raw)]
    if data.get("model") == "Typed+float":
        command += ["-wp-model", "Typed+float", "-warn-special-float", "none"]
    if data.get("driver"):
        command += ["-wp-driver", str(annotated/data["driver"])]
    command += [str(annotated/"unit.c")]
    if call_closure["unreachable_definitions"]:
        command += ["-wp-skip-fct", ",".join(call_closure["unreachable_definitions"])]
    env = dict(os.environ)
    if args.prover_bin:
        env["PATH"] = args.prover_bin + os.pathsep + env["PATH"]
    watched = [Path(__file__), ROOT/"tools/shim_c_check.py", ROOT/"verified/qs8-rsum/build.py"]
    before = {str(p.relative_to(ROOT)):sha(p) for p in watched}
    before.update(source["proof"])
    before["tools/shim_c_call_closure.py"] = sha(ROOT/"tools/shim_c_call_closure.py")
    started = time.monotonic()
    with (logs/(args.name+".log")).open("w") as out:
        out.write(repr(command)+"\n"); out.flush()
        try:
            code = subprocess.run(command, cwd=annotated, env=env, stdout=out, stderr=subprocess.STDOUT, timeout=600).returncode
        except subprocess.TimeoutExpired:
            code = 124
    rows = json.loads(raw.read_text()) if raw.exists() else []
    seen = {r["function"] for r in rows if "ensures" in r["goal"]}
    missing = sorted(expected-seen)
    missing_lemmas = sorted(n for n in lemmas if not any(r.get("property")==lemma_properties[n] for r in rows))
    unchanged = (all(sha(ROOT/p)==v for p,v in before.items()) and baseline(case,args.frozen_sha256)==data
                 and all(sha(annotated/p)==v for p,v in source["generated"].items()))
    result = dict(case=str(case.relative_to(ROOT)), command=command, source_guard=source, checker_inputs=before,
                  exit=code, seconds=round(time.monotonic()-started,3), unchanged=unchanged,
                  call_closure=call_closure, raw_obligations=dict(passed=sum(bool(r["passed"]) for r in rows),total=len(rows)),
                  pending=[r for r in rows if not r["passed"]], expected_functions=sorted(expected), functions=sorted(seen),
                  missing_body_ensures=missing, expected_global_lemmas=sorted(lemmas), expected_global_lemma_properties=lemma_properties, missing_global_lemmas=missing_lemmas,
                  complete=code==0 and bool(rows) and all(r["passed"] for r in rows) and unchanged and not missing and not missing_lemmas,
                  isa_to_c_shim_proved=False)
    (logs/(args.name+"-summary.json")).write_text(json.dumps(result,indent=2)+"\n")
    return result


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("case",type=Path)
    p.add_argument("--frozen-sha256",required=True)
    p.add_argument("--name",required=True)
    p.add_argument("--prepare",action="store_true")
    p.add_argument("--framac",default=os.environ.get("FRAMAC","frama-c"))
    p.add_argument("--prover-bin",default=os.environ.get("PROVER_BIN"))
    result=run(p.parse_args());print(json.dumps(result,indent=2))
    raise SystemExit(0 if result.get("passed",result.get("complete")) else 1)
