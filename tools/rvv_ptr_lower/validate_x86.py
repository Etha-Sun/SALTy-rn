#!/usr/bin/env python3
"""Validation of the x86 / preprocessed-unit side of rvv_ptr_lower (v1.5).

Per kernel (default: XNNPACK f32-vabs-avx.c and f32-vlrelu-avx-u16.c):
  determinism  `--isa x86` twice gives byte-identical outputs
  idempotence  normalising the normalised file performs no rewrite and leaves it unchanged
  tokens       kernels whose only firings are R22: the C token sequence is unchanged
  difftest     original and normalised file are each compiled with `gcc -mavx -O2
               -ffp-contract=off` into a harness (random inputs incl. NaN with random
               payload/sign, +-0, +-inf, denormals; every element count 1..70 so that all
               tail lengths and all unroll factors run; vlrelu with 8 slopes; output
               buffers carry guard floats) and the raw output bytes must be identical.
With --preprocessed-unit <file.c>: the unit is normalised with `--preprocessed`
(R20/R21/R22), twice for determinism, again for idempotence, and the number of remaining
unreferenced `static inline` functions is reported. Testing evidence, not a proof.
"""
import argparse
import hashlib
import json
import random
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import rvv_ptr_lower as L  # noqa: E402

XNN = L.REPO / "benchmark/XNNPACK"
KERNELS = {
    "f32-vabs-avx": ("src/f32-vunary/gen/f32-vabs-avx.c", "vabs",
                     ["xnn_f32_vabs_ukernel__avx_u8", "xnn_f32_vabs_ukernel__avx_u16", "xnn_f32_vabs_ukernel__avx_u24"]),
    "f32-vlrelu-avx-u16": ("src/f32-vlrelu/gen/f32-vlrelu-avx-u16.c", "vlrelu",
                           ["xnn_f32_vlrelu_ukernel__avx_u16"]),
}
TOK = re.compile(r'/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|[A-Za-z_]\w*|[0-9][A-Za-z0-9_.]*|>>=|<<=|\.\.\.|->|\+\+|--|<<|>>|<=|>=|==|!=|&&|\|\||\+=|-=|\*=|/=|%=|&=|\|=|\^=|[^\s]', re.S)


def toks(text):
    return [m.group() for m in TOK.finditer(text) if not m.group().startswith(("/*", "//"))]


def run(cmd, timeout=600):
    p = subprocess.run([str(c) for c in cmd], capture_output=True, timeout=timeout, env=L.clang_env())
    return p.returncode, p.stdout.decode("utf-8", "replace"), p.stderr.decode("utf-8", "replace")


def lower(src, out_dir, *extra):
    out_dir.mkdir(parents=True, exist_ok=True)
    rc, so, se = run([sys.executable, "-I", HERE / "rvv_ptr_lower.py", src, "--out-dir", out_dir, "--isa", "x86", *extra])
    return rc, so.strip() + se.strip()


def rewrites(d, stem):
    return json.loads((d / f"{stem}.normalization.json").read_text())["rewrites"]


HARNESS = r'''
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include KSRC_H

static uint64_t s = 0x9E3779B97F4A7C15ULL;
static uint32_t rnd(void) { s ^= s << 13; s ^= s >> 7; s ^= s << 17; return (uint32_t)(s >> 16); }
static float pick(void) {
  uint32_t r = rnd() % 16, b;
  switch (r) {
    case 0: b = 0x7FC00000u | (rnd() & 0x3FFFFFu); break;                /* quiet NaN, random payload */
    case 1: b = 0xFFC00000u | (rnd() & 0x3FFFFFu); break;
    case 2: b = 0x7F800000u | ((rnd() & 0x3FFFFFu) | 1u); break;        /* signalling NaN */
    case 3: b = 0x00000000u; break;
    case 4: b = 0x80000000u; break;
    case 5: b = 0x7F800000u; break;
    case 6: b = 0xFF800000u; break;
    case 7: b = rnd() & 0x007FFFFFu; break;                              /* denormal */
    case 8: b = 0x80000000u | (rnd() & 0x007FFFFFu); break;
    default: b = rnd(); break;                                           /* any bit pattern */
  }
  float f; memcpy(&f, &b, 4); return f;
}
#define GUARD 16
static void dump(FILE* o, const float* p, size_t n) { fwrite(p, 4, n, o); }
@BODY@
int main(int argc, char** argv) {
  FILE* o = fopen(argv[1], "wb");
  float *in = malloc(4 * (70 + 64 + GUARD)), *out = malloc(4 * (70 + GUARD));
  for (int k = 0; k < @NFN@; k++) {
    for (int n = 1; n <= 70; n++) {
      for (int trial = 0; trial < 60; trial++) {
        for (int i = 0; i < 70 + 64; i++) in[i] = pick();
        for (int i = 0; i < 70 + GUARD; i++) out[i] = pick();
        @CALL@
        dump(o, out, n + GUARD);
      }
    }
  }
  fclose(o);
  return 0;
}
'''


def make_harness(kind, ksrc, fns, path):
    if kind == "vabs":
        decl = "struct xnn_f32_default_params prm; memset(&prm, 0, sizeof prm);"
        fnlist = ",".join(fns)
        body = f"typedef void (*kfn)(size_t, const float*, float*, const struct xnn_f32_default_params*);\n" \
               f"static kfn fns[] = {{{fnlist}}};"
        call = "{ " + decl + " fns[k](n * 4, in, out, &prm); }"
    else:
        body = "typedef void (*kfn)(size_t, const float*, float*, const struct xnn_f32_lrelu_params*);\n" \
               f"static kfn fns[] = {{{','.join(fns)}}};\n" \
               "static const uint32_t slopes[] = {0x3C23D70Au, 0u, 0x80000000u, 0x3F800000u, 0xC0200000u, 0x7F800000u, 0x7FC00000u, 0x00000400u};"
        call = ("for (int si = 0; si < 8; si++) { struct xnn_f32_lrelu_params prm; memset(&prm, 0, sizeof prm); "
                "memcpy(&prm.scalar.slope, &slopes[si], 4); fns[k](n * 4, in, out, &prm); dump(o, out, n + GUARD); "
                "for (int i = 0; i < 70 + GUARD; i++) out[i] = pick(); }")
    path.write_text(HARNESS.replace("@BODY@", body).replace("@NFN@", str(len(fns))).replace("@CALL@", call))


def build_run(kind, ksrc, fns, work):
    work.mkdir(parents=True, exist_ok=True)
    h = work / "harness.c"
    make_harness(kind, ksrc, fns, h)
    cc = ["gcc", "-mavx", "-O2", "-ffp-contract=off", "-fno-fast-math", "-w", f'-DKSRC_H="{ksrc}"',
          f"-I{XNN}", f"-I{XNN}/src", f"-I{L.HERE / 'stub-include'}", h, "-lm", "-o", work / "h.elf"]
    rc, so, se = run(cc)
    (work / "compile.log").write_text(so + se)
    if rc:
        return {"compile_rc": rc, "error": [l for l in se.splitlines() if "error" in l][:5]}
    rc, so, se = run([work / "h.elf", work / "out.bin"])
    if rc:
        return {"compile_rc": 0, "rc": rc, "error": se[-300:]}
    data = (work / "out.bin").read_bytes()
    return {"compile_rc": 0, "rc": 0, "bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}


def kernel(name, out):
    rel, kind, fns = KERNELS[name]
    src = XNN / rel
    rec = {"kernel": name, "input_sha256": hashlib.sha256(src.read_bytes()).hexdigest()}
    d1, d2, d3 = out / name / "run1", out / name / "run2", out / name / "idem"
    rc1, m1 = lower(src, d1)
    rc2, m2 = lower(src, d2)
    rec["lower"] = m1
    if rc1 or rc2:
        rec["status"] = "REJECTED"
        return rec
    files = sorted(p.name for p in d1.iterdir())
    rec["determinism"] = files == sorted(p.name for p in d2.iterdir()) and all(
        (d1 / f).read_bytes() == (d2 / f).read_bytes() for f in files)
    norm = d1 / f"{src.stem}.normalized.c"
    rec["rules"] = sorted({e["rule"] for e in rewrites(d1, src.stem)})
    rec["rewrite_count"] = len(rewrites(d1, src.stem))
    rc3, m3 = lower(norm, d3)
    n3 = d3 / f"{norm.stem}.normalized.c"
    rec["idempotence"] = rc3 == 0 and not rewrites(d3, norm.stem) and n3.read_bytes() == norm.read_bytes()
    if rec["rules"] == ["R22"]:
        rec["tokens_unchanged"] = toks(src.read_text(encoding="latin-1")) == toks(norm.read_text(encoding="latin-1"))
    a = build_run(kind, src, fns, out / name / "diff-original")
    b = build_run(kind, norm, fns, out / name / "diff-normalized")
    rec["difftest"] = {"original": a, "normalized": b}
    rec["difftest_identical"] = a.get("rc") == 0 and b.get("rc") == 0 and a["sha256"] == b["sha256"]
    rec["status"] = "OK" if rec["determinism"] and rec["idempotence"] and rec["difftest_identical"] and \
        rec.get("tokens_unchanged", True) else "CHECK"
    return rec


def preprocessed(unit, out):
    unit = Path(unit).resolve()
    d1, d2, d3 = out / "pp" / "run1", out / "pp" / "run2", out / "pp" / "idem"
    rc1, m1 = lower(unit, d1, "--preprocessed")
    rc2, m2 = lower(unit, d2, "--preprocessed")
    rec = {"unit": unit.name, "input_sha256": hashlib.sha256(unit.read_bytes()).hexdigest(), "lower": m1}
    if rc1 or rc2:
        rec["status"] = "REJECTED"
        return rec
    files = sorted(p.name for p in d1.iterdir())
    rec["determinism"] = all((d1 / f).read_bytes() == (d2 / f).read_bytes() for f in files)
    rw = rewrites(d1, unit.stem)
    rec["rule_counts"] = {r: sum(e["rule"] == r for e in rw) for r in sorted({e["rule"] for e in rw})}
    norm = d1 / f"{unit.stem}.normalized.c"
    rc3, m3 = lower(norm, d3, "--preprocessed")
    n3 = d3 / f"{norm.stem}.normalized.c"
    rec["idempotence"] = rc3 == 0 and not rewrites(d3, norm.stem) and n3.read_bytes() == norm.read_bytes()
    text = norm.read_text(encoding="latin-1")
    rec["remaining_static_inline"] = len(re.findall(r"^static\s+inline\b|^static\s+__inline", text, re.M))
    rec["deleted"] = [e["function"] for e in rw if e["rule"] == "R20"]
    rec["status"] = "OK" if rec["determinism"] and rec["idempotence"] else "CHECK"
    return rec


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--kernels", nargs="*", default=list(KERNELS))
    ap.add_argument("--preprocessed-unit")
    a = ap.parse_args()
    out = Path(a.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    res = []
    for k in a.kernels:
        r = kernel(k, out)
        res.append(r)
        print(k, r["status"], {x: r.get(x) for x in ("rules", "determinism", "idempotence", "tokens_unchanged", "difftest_identical")}, flush=True)
    if a.preprocessed_unit:
        r = preprocessed(a.preprocessed_unit, out)
        res.append(r)
        print("preprocessed", r["status"], {x: r.get(x) for x in ("rule_counts", "determinism", "idempotence", "remaining_static_inline")}, flush=True)
    (out / "validation-x86.json").write_text(json.dumps({"tool": L.TOOL_VERSION, "results": res}, indent=1) + "\n")
    return 0 if all(r["status"] == "OK" for r in res) else 1


if __name__ == "__main__":
    sys.exit(main())
