"""Frozen C/spec + annotation patches + complete WP; original qs8 package stays intact."""
import argparse
from collections import Counter
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parents[1]
SHARED = ROOT / "verified/shared"
FROZEN_SHA256 = "ad42bb3362eeea81076dd80e2b0e4cfea8c8597eece08a25781d16368f8dbb27"
MODULES = {"qu8-rsum": "rsum", "s8-vclamp": "clamp", "f32-vadd": "float_ops"}
spec = importlib.util.spec_from_file_location("guard", ROOT / "verified/qs8-rsum/build.py")
guard = importlib.util.module_from_spec(spec)
spec.loader.exec_module(guard)
gen_spec = importlib.util.spec_from_file_location("generate", ROOT / "tools/shim_c_generate.py")
generate = importlib.util.module_from_spec(gen_spec)
gen_spec.loader.exec_module(generate)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def ghost_has_prototype(annotation):
    body = re.sub(r"/@.*?@/", "", annotation, flags=re.S)
    body = re.sub(r"^(?:/\*@|//@)\s*ghost\b", "", body)
    body = guard.without_comments(body)
    # Declarations have a type before the function name; ordinary calls do not.
    declarations = re.finditer(r"(?:^|[;{}])\s*(?P<type>(?:[A-Za-z_]\w*(?:\s+|(?=\*))|\*\s*)+)[A-Za-z_]\w*\s*\([^;{}]*\)\s*;", body)
    return (any(m.group("type").strip() not in {"return", "else", "goto"} for m in declarations)
            or bool(re.search(r"\(\s*\*\s*\w+\s*\)\s*\(", body)))


def inputs():
    frozen = SHARED / "frozen.json"
    if sha(frozen) != FROZEN_SHA256:
        raise RuntimeError("Frozen baseline manifest changed")
    files = json.loads(frozen.read_text())["files"]
    for name, digest in files.items():
        if sha(ROOT / name) != digest:
            raise RuntimeError("Frozen implementation/spec changed: " + name)
    return files


def restore_assert_locations(before, after, filename):
    # Only runtime assert lines need restoration: their macros embed FILE/LINE.
    locations = {}
    for number, line in enumerate(before.splitlines(), 1):
        if re.match(r"\s*assert\s*\(", line):
            locations.setdefault(line.strip(), []).append(number)
    used, lines = Counter(), []
    for line in after.splitlines(keepends=True):
        key = line.strip()
        if key in locations:
            number = locations[key][used[key]]
            used[key] += 1
            lines.append(f'#line {number} "{filename}"\n')
        lines.append(line)
    return "".join(lines)


def prepare(case, name, clang="clang-14"):
    if case not in MODULES or not re.fullmatch(r"[A-Za-z0-9_-]+", name):
        raise RuntimeError("Unknown case or unsafe run name")
    baseline = inputs()
    directory = ROOT / "verified" / case
    for file, text in generate.render(directory).items():
        if (directory / file).read_text() != text:
            raise RuntimeError("Generated interface changed: " + file)
    dest = directory / ".build" / name
    if dest.exists():
        shutil.rmtree(dest)
    plain, annotated = dest / "plain", dest / "annotated"
    plain.mkdir(parents=True)
    module = MODULES[case]
    files = [p for p in SHARED.iterdir() if p.suffix in {".h", ".c", ".driver"}]
    files += [directory / f for f in ["neon.c", "rvv.c", "spec.h", "harness.c"]]
    for p in files:
        shutil.copyfile(p, plain / p.name)
    unit = f'#include "spec.h"\n#include "base.c"\n#include "{module}.c"\n#include "neon.c"\n#include "rvv.c"\n#include "harness.c"\n'
    (plain / "unit.c").write_text(unit)
    shutil.copytree(plain, annotated)
    patches = [SHARED / "base-proof.patch", SHARED / f"{module}-proof.patch", directory / "proof.patch"]
    allowed = {"base.h", "base.c", module+".h", module+".c", "neon.c", "rvv.c", "harness.c", "unit.c"}
    for patch in patches:
        text = patch.read_text()
        targets = re.findall(r"^(?:--- a/|\+\+\+ b/)([^\s]+)$", text, re.M)
        if not targets or any(t not in allowed for t in targets):
            raise RuntimeError("Unexpected patch target: " + str(patch))
        command = ["patch", "--batch", "--fuzz=0", "-p1", "-i", str(patch)]
        run = subprocess.run(command, cwd=annotated, capture_output=True, text=True, timeout=30)
        if run.returncode:
            raise RuntimeError(run.stdout + run.stderr)
    for p in plain.iterdir():
        if p.suffix not in {".c", ".h"}:
            continue
        before, after = p.read_text(), (annotated / p.name).read_text()
        after = restore_assert_locations(before, after, "./"+p.name)
        (annotated / p.name).write_text(after)
        if guard.raw_c_tokens(before) != guard.raw_c_tokens(after):
            raise RuntimeError("Proof changes C/preprocessor tokens: " + p.name)
        if p.name == "spec.h" and before != after:
            raise RuntimeError("Proof changes public spec")
        for m in guard.LEX.finditer(after):
            annotation = m.group()
            if not annotation.startswith(("/*@", "//@")):
                continue
            if re.search(r"\b(axiom|axiomatic|assume|admit)\b", annotation):
                raise RuntimeError("Unchecked assumption in " + p.name)
            clauses = re.sub(r"\bloop\s+(assigns|invariant|variant)\b", "loop_clause", annotation)
            ghost = re.match(r"(?:/\*@|//@)\s*ghost\b", annotation)
            if ghost and re.search(r"\b(extern|typedef|typeof|__typeof__|__attribute__|__asm__)\b", annotation):
                raise RuntimeError("Unsupported ghost declaration syntax in " + p.name)
            if ghost and ghost_has_prototype(annotation):
                raise RuntimeError("Ghost function declaration without body in " + p.name)
            if p.name in {"neon.c", "rvv.c", "harness.c", "unit.c"} and not ghost and re.search(r"\b(requires|ensures|assigns|terminates|behavior|assumes)\b", clauses):
                raise RuntimeError("Public contract injection in " + p.name)
    a, _ = guard.clang_tokens(plain, clang)
    b, _ = guard.clang_tokens(annotated, clang)
    if a != b:
        raise RuntimeError("Complete preprocessed token mismatch")
    report = dict(case=case, passed=True, plain=str(plain), annotated=str(annotated),
                  tokens=len(a), token_sha256=hashlib.sha256("\n".join(a).encode()).hexdigest(),
                  frozen_manifest_sha256=FROZEN_SHA256,
                  frozen=baseline, proof={str(p.relative_to(ROOT)):sha(p) for p in patches},
                  generated={p.name:sha(p) for p in annotated.iterdir() if p.is_file()})
    (dest / "guard.json").write_text(json.dumps(report, indent=2)+"\n")
    return report


def run(case, name, framac, prover_bin, clang):
    directory = ROOT / "verified" / case
    logs = directory / "logs"
    logs.mkdir(exist_ok=True)
    raw = logs / f"{name}.json"
    if raw.exists() or (logs / f"{name}-summary.json").exists():
        raise RuntimeError("Use a fresh run name to preserve evidence")
    source = prepare(case, name, clang)
    annotated = Path(source["annotated"])
    files = [p for p in annotated.glob("*.c") if p.name in {"base.c", MODULES[case]+".c", "harness.c"}]
    declarations = "\n".join(p.read_text() for p in files)
    # Ordinary and ghost function definitions in the actually compiled bodies.
    expected = set(re.findall(r"^\s*(?:int|void|float|size_t|uint32_t|\w+_t|\w+x\d+_t)\s+(\w+)\s*\([^;{}]*\)\s*\{", declarations, re.M))
    env = dict(os.environ)
    if prover_bin:
        env["PATH"] = prover_bin + os.pathsep + env["PATH"]
    command = [framac, "-machdep", "gcc_x86_64", "-inline-calls", "test_neon,test_rvv", "-inline-stmt-contracts", "-remove-inlined", "test_neon,test_rvv", "-wp", "-wp-rte", "-wp-par", "2", "-wp-prover", "z3,cvc5,alt-ergo", "-wp-timeout", "10", "-wp-memlimit", "1024", "-wp-cache", "none", "-wp-report-json", str(raw)]
    if case == "f32-vadd":
        command += ["-wp-model", "Typed+float", "-warn-special-float", "none", "-wp-driver", str(annotated / "float.driver")]
    command += [str(annotated / "unit.c")]
    watched = [Path(__file__), ROOT/"tools/shim_c_generate.py", ROOT/"verified/qs8-rsum/build.py"]
    before = {str(p.relative_to(ROOT)):sha(p) for p in watched}
    before.update(source["proof"])
    versions = {}
    for tool, flags in [(framac,["-version"]),("z3",["--version"]),("cvc5",["--version"]),("alt-ergo",["--version"])]:
        result = subprocess.run([tool,*flags],env=env,text=True,capture_output=True,timeout=10)
        versions[tool] = (result.stdout+result.stderr).splitlines()[0]
    started = time.monotonic()
    with (logs / f"{name}.log").open("w") as output:
        output.write(repr(command)+"\n"); output.flush()
        try:
            exitcode = subprocess.run(command, cwd=annotated, env=env, stdout=output, stderr=subprocess.STDOUT, timeout=600).returncode
        except subprocess.TimeoutExpired:
            exitcode = 124
    rows = json.loads(raw.read_text()) if raw.exists() else []
    # Ghost definitions can live in module headers too; recover their body names.
    lemmas = set()
    for p in [*annotated.glob("*.h"),*files,annotated/"neon.c",annotated/"rvv.c",annotated/"unit.c"]:
        for m in guard.LEX.finditer(p.read_text()):
            lemmas.update(re.findall(r"\blemma\s+(\w+)\s*(?:\{[^}]*\})?\s*:", m.group()))
            if re.match(r"/\*@\s*ghost\b", m.group()):
                expected.update(re.findall(r"\b(?:void|int|float|\w+_t)\s+(\w+)\s*\([^;{}]*\)\s*\{", m.group()))
    seen = {r["function"] for r in rows if "ensures" in r["goal"]}
    missing = sorted(expected-seen)
    missing_lemmas = sorted(n for n in lemmas if not any(r.get("property")=="lemma_"+n for r in rows))
    unchanged = all(sha(ROOT/p)==v for p,v in before.items()) and inputs()==source["frozen"] and all(sha(annotated/p)==v for p,v in source["generated"].items())
    report = dict(case=case, command=command, tool_versions=versions, exit=exitcode, seconds=round(time.monotonic()-started,3), source_guard=source,
                  checker_inputs=before, unchanged=unchanged, missing_body_ensures=missing,
                  expected_global_lemmas=sorted(lemmas), missing_global_lemmas=missing_lemmas,
                  raw_obligations=dict(passed=sum(bool(r["passed"]) for r in rows),total=len(rows)),
                  pending=[r for r in rows if not r["passed"]], functions=sorted(seen), expected_functions=sorted(expected),
                  goal_names_sha256=hashlib.sha256("\n".join(sorted(r["goal"] for r in rows)).encode()).hexdigest(),
                  complete=exitcode==0 and bool(rows) and all(r["passed"] for r in rows) and unchanged and not missing and not missing_lemmas,
                  isa_to_c_shim_proved=False)
    (logs/f"{name}-summary.json").write_text(json.dumps(report,indent=2)+"\n")
    return report


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("case", choices=MODULES)
    parser.add_argument("--name", default="replay")
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--clang", default="clang-14")
    parser.add_argument("--framac", default=os.environ.get("FRAMAC","frama-c"))
    parser.add_argument("--prover-bin", default=os.environ.get("PROVER_BIN"))
    args=parser.parse_args()
    result = prepare(args.case,args.name,args.clang) if args.prepare else run(args.case,args.name,args.framac,args.prover_bin,args.clang)
    print(json.dumps(result,indent=2))
    raise SystemExit(0 if result.get("passed",result.get("complete")) else 1)
