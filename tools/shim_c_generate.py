"""Three small interface templates. Generate C/ACSL, without rewriting kernels."""
import argparse
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def contract(clauses):
    return "/*@\n" + "\n".join("  " + c + ";" for c in clauses) + "\n*/\n"


def signature(case, side):
    source = (case / (side + ".c")).read_text()
    match = re.search(r"void\s+test_" + side + r"\s*\([^{}]*?\)\s*(?:XNN_OOB_READS)?(?=\s*\{)", source)
    if not match:
        raise ValueError("Unsupported function signature: " + side)
    return match.group().strip() + ";\n"


def render(case):
    interface = json.loads((case / "interface.json").read_text())
    family, padding = interface["family"], interface["padding"]
    if not isinstance(padding, int) or padding < 0:
        raise ValueError("padding must be a nonnegative element count")
    scalar = family == "reduction-u8"
    floating = family == "binary-f32"
    if family not in {"reduction-u8", "clamp-s8", "binary-f32"}:
        raise ValueError("Unsupported interface family: " + family)
    if interface["observation"] != ("number-or-both-nan" if floating else "integer-equality"):
        raise ValueError("Unexpected output observation")
    width = 4 if floating else 1
    count = "batch/sizeof(float)" if floating else "batch"
    last = f"{count}+{padding}-1"
    names = ["input_a", "input_b"] if floating else ["input"]
    bounds = [f"requires 0 < batch <= SIZE_MAX-{padding*width}"]
    if floating:
        bounds += ["requires batch % sizeof(float) == 0"]
    reads = [f"requires \\valid_read({p}+(0..{last}))" for p in names]
    writes = ["requires \\valid(output)"] if scalar else [f"requires \\valid(output+(0..{count}-1))"]
    region = "output" if scalar else f"output+(0..{count}-1)"
    separation = [f"requires \\separated({region},{p}+(0..{last}))" for p in names]
    params = ["requires params != \\null"] if scalar or floating else [
        "requires \\valid_read(params)", f"requires \\separated({region},params)",
        "requires -128 <= params->scalar.min <= params->scalar.max <= 127"]
    frame = "assigns *output" if scalar else f"assigns output[0..{count}-1]"
    kernel_contract = contract(bounds + reads + writes + separation + params + ["terminates \\true", frame])
    spec = '#ifndef GENERATED_SPEC_H\n#define GENERATED_SPEC_H\n#include "shim.h"\n\n'
    for side in ["neon", "rvv"]:
        spec += kernel_contract + signature(case, side) + "\n"
    public = [f"requires 0 < n <= SIZE_MAX/{width}-{padding}"]
    public += [f"requires \\valid_read({p}+(0..n+{padding}-1))" for p in names]
    if scalar:
        declaration = "int equivalent(size_t n,const uint8_t *input,uint32_t initial)"
        body = "  struct xnn_qs8_rsum_params params={0};\n  uint32_t left=initial,right=initial;\n  test_neon(n,input,&left,&params);\n  test_rvv(n,input,&right,&params);\n  return left==right;\n"
        public += ["assigns \\nothing"]
    else:
        ctype = "float" if floating else "int8_t"
        inputs = "const float *input_a,const float *input_b" if floating else "const int8_t *input"
        extra = "" if floating else ",int32_t lower,int32_t upper"
        declaration = f"int equivalent(size_t n,{inputs},{ctype} *left,{ctype} *right{extra})"
        public += ["requires \\valid(left+(0..n-1))", "requires \\valid(right+(0..n-1))"]
        for p in names:
            public += [f"requires \\separated(left+(0..n-1),{p}+(0..n+{padding}-1))", f"requires \\separated(right+(0..n-1),{p}+(0..n+{padding}-1))"]
        public += ["requires \\separated(left+(0..n-1),right+(0..n-1))"]
        if not floating:
            public += ["requires -128 <= lower <= upper <= 127"]
        public += ["assigns left[0..n-1],right[0..n-1]"]
        params_init = "struct xnn_f32_default_params params={0};" if floating else "struct xnn_s8_minmax_params params={{lower,upper}};"
        args = "n*sizeof(float),input_a,input_b" if floating else "n,input"
        equal = "left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])" if floating else "left[i]==right[i]"
        body = f"  {params_init}\n  test_neon({args},left,&params);\n  test_rvv({args},right,&params);\n  for (size_t i=0;i<n;i++) {{\n    if (!({equal})) return 0;\n  }}\n  return 1;\n"
    frame = public.pop()
    spec += contract(public + ["terminates \\true", frame, "ensures equal: \\result == 1"]) + declaration + ";\n#endif\n"
    harness = '#include "spec.h"\n\n' + declaration + " {\n" + body + "}\n"
    return {"spec.h": spec, "harness.c": harness}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("case", type=Path)
    parser.add_argument("--write", action="store_true", help="Initial generation before freezing; default only checks")
    args = parser.parse_args()
    case = args.case.resolve()
    for name, text in render(case).items():
        if args.write:
            (case / name).write_text(text)
        elif (case / name).read_text() != text:
            raise SystemExit("Generated file differs: " + name)
    print("generated" if args.write else "generation matches", case.name)
