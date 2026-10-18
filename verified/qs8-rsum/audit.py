"""Check packaging/source fidelity. This script does not establish proof validity."""
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent
LEX = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*.*?\*/|//[^\n]*', re.S)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def executable(text):
    clean = LEX.sub(lambda m: "" if m.group().startswith(("/*", "//")) else m.group(), text)
    return re.sub(r"\s+", "", clean)


def check():
    manifest = json.loads((ROOT / "provenance.json").read_text())
    source = (ROOT / "proof.c").read_text()
    parts = dict(re.findall(r"/\* BEGIN COMPONENT ([\w.]+) \*/\n(.*?)/\* END COMPONENT \1 \*/", source, re.S))
    errors = []
    if digest(source.encode()) != manifest["proof_sha256"]:
        errors.append("proof.c differs from the recorded packed proof input")
    for section in manifest["sections"]:
        text = parts.get(section["name"], "")
        if digest(text.encode()) != section["packed_sha256"]:
            errors.append("packed component changed: " + section["name"])
    includes = re.findall(r"^\s*#include\s+(.+)$", source, re.M)
    if includes != ["<stdint.h>", "<stddef.h>", "<assert.h>", "<limits.h>"]:
        errors.append("proof.c must include only the four recorded standard headers")
    for match in LEX.finditer(source):
        text = match.group()
        if text.startswith(("/*@", "//@")) and re.search(r"\b(axiom|axiomatic|assume|admit)\b", text):
            errors.append("unchecked assumption syntax found in an annotation")
    for tag in ["neon", "rvv"]:
        original = (ROOT / "original" / f"{tag}.c").read_text()
        if digest(original.encode()) != manifest["original"][f"{tag}.c"]["sha256"]:
            errors.append("original source changed: " + tag)
        if executable(original) != executable(parts[f"kernel_{tag}.c"]):
            errors.append("kernel executable C differs from original: " + tag)
        # The first ACSL block is the kernel's public contract.
        contract = re.search(r"/\*@.*?\*/", parts[f"kernel_{tag}.c"], re.S).group()
        if re.search(r"\bensures\b", contract):
            errors.append("kernel exports a functional postcondition: " + tag)
    contract = re.search(r"/\*@.*?\*/", parts["equivalence.c"], re.S).group()
    if re.findall(r"ensures\s+[^;]+;", contract) != ["ensures equal: \\result == 1;"]:
        errors.append("wrapper functional postcondition is not exactly output equality")
    return dict(passed=not errors, errors=errors, proof_sha256=digest(source.encode()),
                original_kernel_executable_preserved=not any("kernel executable" in e for e in errors),
                components=len(parts), public_functional_postcondition="output equality only",
                mathematical_model_remains_in_requires_and_internal_proof=True,
                proof_validity_checked=False)


if __name__ == "__main__":
    result = check()
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if result["passed"] else 1)
