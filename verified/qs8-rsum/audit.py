"""Audit separated implementation/specification and build guarded annotated copies."""
import argparse
import json
from pathlib import Path
import build

ROOT = Path(__file__).resolve().parent

def digest(data):
    return build.digest(data)

def check(name="audit", clang="clang"):
    guard = build.prepare(name, clang)
    provenance = json.loads((ROOT / "provenance.json").read_text())
    errors = []
    for tag in ["neon", "rvv"]:
        original = (ROOT / "original" / f"{tag}.c").read_bytes()
        if digest(original) != provenance["original"][f"{tag}.c"]["sha256"]:
            errors.append("Original source changed: " + tag)
        if (ROOT / f"{tag}.c").read_bytes() != original:
            errors.append("Implementation is not byte-identical to original: " + tag)
    for file in ["shim.h", "shim.c", "neon.c", "rvv.c", "harness.c"]:
        if any(m.group().startswith(("/*@", "//@")) for m in build.LEX.finditer((ROOT / file).read_text())):
            errors.append("Proof annotation in clean implementation: " + file)
    return dict(passed=not errors, errors=errors,
                original_kernel_bytes_preserved=not errors,
                public_functional_postcondition="output equality only",
                mathematical_model_remains_in_requires_and_internal_proof=True,
                source_guard=guard, proof_validity_checked=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--name", default="audit")
    parser.add_argument("--clang", default="clang")
    args = parser.parse_args()
    result = check(args.name, args.clang)
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if result["passed"] else 1)
