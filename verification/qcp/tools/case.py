"""Freeze and prepare a case without modifying its review files or upstream C."""
import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path

from lower_vadd import TYPES, lower_kernel, lower_shared

ROOT = Path(__file__).resolve().parents[3]
QCP = ROOT / "verification/qcp"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inputs(case):
    interface = json.loads((case / "interface.json").read_text())
    return [ROOT / interface[side] for side in ["neon", "rvv"]] + [
        case / name for name in ["interface.json", "spec.h", "mapper.c"]] + sorted(
        (QCP / "shared/runtime").glob("*")) + [QCP / "tools" / name for name in
                                               ["lower_vadd.py", "case.py", "check.py"]]


def freeze(case):
    target = case / "frozen.json"
    if target.exists():
        raise ValueError("Existing freeze is immutable; create a separately reviewed case version")
    data = {"upstream_commit": "be16280c7812a7459c26c3ce82a47339a3d07718",
            "files": {str(p.relative_to(ROOT)): sha(p) for p in inputs(case)},
            "scope": "Review/source lock, not a proof certificate"}
    target.write_text(json.dumps(data, indent=2) + "\n")
    registry = QCP / "review-lock.json"
    entries = json.loads(registry.read_text()) if registry.exists() else {}
    if case.name in entries:
        raise ValueError("Case is already registered; use a new reviewed case version")
    entries[case.name] = sha(target)
    registry.write_text(json.dumps(entries, indent=2) + "\n")


def audit(case, root=ROOT):
    trusted = json.loads((QCP / "review-lock.json").read_text())[case.name]
    if sha(case / "frozen.json") != trusted:
        raise ValueError("Frozen manifest differs from the reviewed registry")
    lock = json.loads((case / "frozen.json").read_text())
    required = {str(p.relative_to(ROOT)) for p in inputs(case)}
    if set(lock["files"]) != required:
        raise ValueError("Frozen manifest does not cover the exact required input set")
    changed = [p for p, h in lock["files"].items()
               if not (root / p).is_file() or sha(root / p) != h]
    if changed:
        raise ValueError("Frozen input changed: " + ", ".join(changed))
    return lock


def ordinary_tokens(text):
    # A single lexer avoids stripping comment-like text inside C strings.
    pattern = r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*.*?\*/|//[^\n]*|[A-Za-z_]\w*|\d+(?:\.\d*)?|>>=|<<=|\.\.\.|\+\+|--|->|&&|\|\||<<|>>|<=|>=|==|!=|[+*/%&|^!-]=|[^\s]'
    return [x for x in re.findall(pattern, text, re.S) if not x.startswith(("/*", "//"))]


def validate_annotations(before, after):
    if re.search(r"(?:\\|\?\?/)[\r]?\n", after):
        raise ValueError("Line splicing is outside this proof annotation channel")
    comment_pattern = r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*.*?\*/|//[^\n]*'
    def comments(text):
        return [x for x in re.findall(comment_pattern, text, re.S)
                if x.startswith(("/*", "//")) and not x.startswith("/*@")]
    if comments(before) != comments(after):
        raise ValueError("proof.patch changed non-QCP comments")
    if re.findall(r"^\s*#.*$", before, re.M) != re.findall(r"^\s*#.*$", after, re.M):
        raise ValueError("proof.patch changed preprocessor lines")
    if ordinary_tokens(before) != ordinary_tokens(after):
        raise ValueError("proof.patch changed ordinary C tokens")
    # Initial proof channel intentionally permits only local invariant/assert cuts.
    old = re.findall(r"/\*@.*?\*/", before, re.S)
    new = re.findall(r"/\*@.*?\*/", after, re.S)
    for block in new:
        if block in old:
            old.remove(block)
        elif not re.match(r"/\*@\s*(Inv|Assert)\b", block):
            raise ValueError("proof.patch may only add Inv/Assert annotations")
        elif re.search(r"\b(Import|Extern|Require|Ensure|include|Axiom|Admitted|assume)\b", block):
            raise ValueError("proof.patch attempted a contract/import change")
    if old:
        raise ValueError("proof.patch removed an existing annotation")


def prepare(case):
    audit(case)
    interface = json.loads((case / "interface.json").read_text())
    if interface["kernel"] != "f32-vadd" or interface["observation"] != "number-or-both-nan":
        raise ValueError("Only the audited vadd lowering is implemented; inventory is not support")
    out = QCP / ".build" / case.name
    original, lowered = out / "original", out / "lowered"
    original.mkdir(parents=True, exist_ok=True)
    lowered.mkdir(exist_ok=True)
    texts = {side + ".c": (ROOT / interface[side]).read_text() for side in ["neon", "rvv"]}
    for name, text in texts.items():
        (original / name).write_text(text)
    patch = case / "proof.patch"
    if patch.read_text().strip():
        # Check path headers before allowing patch to touch an isolated copy.
        for header in re.findall(r"^(?:---|\+\+\+) (\S+)", patch.read_text(), re.M):
            if header not in {"neon.c", "rvv.c"}:
                raise ValueError("proof.patch target must be neon.c or rvv.c")
        subprocess.run(["patch", "--batch", "--fuzz=0", "-p0", "-i", str(patch)],
                       cwd=original, check=True, capture_output=True)
    rewrites = {}
    for name, before in texts.items():
        after = (original / name).read_text()
        validate_annotations(before, after)
        source, changes = lower_kernel(after)
        (lowered / name).write_text(source)
        rewrites[name] = changes
    body = lower_shared((QCP / "shared/runtime/float_ops.c").read_text())
    body += '\nsize_t __riscv_vsetvl_e32m8(size_t n) { return n < RVV_CAP ? n : RVV_CAP; }\n'
    (lowered / "shim.c").write_text(body)
    header = '''#ifndef LOWERED_RUNTIME_H
#define LOWERED_RUNTIME_H
#include <stddef.h>
#include <assert.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define RVV_CAP 32
struct xnn_f32_default_params { char unused; };
'''
    header += "\n".join("struct " + t + " { " + " ".join(f"float s{i};" for i in range(n)) + " };" for t, n in TYPES.items())
    header += "\n" + "\n".join(p.rsplit("{", 1)[0].rstrip() + ";" for p in
                                 re.findall(r"^(?:float|void|size_t)\s+\w+\([^\n]*\)\s*\{", body, re.M))
    (lowered / "shim.h").write_text(header + "\n#endif\n")
    mapper = (case / "mapper.c").read_text().replace('#include "spec.h"', '#include "shim.h"')
    for side in ["neon", "rvv"]:
        mapper = mapper.replace('"../../../../' + interface[side] + '"', '"' + side + '.c"')
    (lowered / "mapper.c").write_text(mapper)
    (out / "native_unit.c").write_text("\n".join('#include "' + str(p) + '"' for p in [
        QCP / "shared/runtime/float_ops.c", QCP / "shared/runtime/vl.c", case / "mapper.c"]) + "\n")
    (out / "lowered_unit.c").write_text('#include "lowered/shim.c"\n#include "lowered/mapper.c"\n')
    manifest = {"originals": {k: sha(ROOT / interface[k]) for k in ["neon", "rvv"]},
                "review_files": {str(p.relative_to(ROOT)): sha(p) for p in inputs(case)[:5]},
                "proof_patch_sha256": sha(patch), "rewrites": rewrites,
                "generated": {p.name: sha(p) for p in lowered.iterdir() if p.is_file()},
                "translation_proved": False}
    (out / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    return out


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["freeze", "audit", "prepare"])
    parser.add_argument("case", default="f32-vadd", nargs="?")
    args = parser.parse_args()
    case = QCP / "cases" / args.case
    print({"freeze": freeze, "audit": audit, "prepare": prepare}[args.action](case))
