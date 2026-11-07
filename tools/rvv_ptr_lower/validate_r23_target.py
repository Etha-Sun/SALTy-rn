#!/usr/bin/env python3
"""R23 target check for an XNNPACK reduction microkernel `void f(size_t batch, const T* input,
T* output, const void* params)` (default: s8-rmax-neon-u32-acc2.c, --isa neon).

  1. the tool rewrites the unchanged XNNPACK source with --isa neon; the output must
     contain no `*p++`-like dereference and R23 must have fired;
  2. differential test under qemu-aarch64: the original and the rewritten kernel are compiled
     as two translation units (entry point renamed), run on random inputs for every batch
     size 1..300 at four input misalignments, with random initial output value, and compared
     (result, guard bytes around the output, input buffer untouched). Testing evidence only.
Exit code 0 = rewrite present and all comparisons equal.
"""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import rvv_ptr_lower as L  # noqa: E402
import validate as V  # noqa: E402

DEFAULT_SRC = "benchmark/XNNPACK/src/s8-rminmax/gen/s8-rmax-neon-u32-acc2.c"
LEFT = re.compile(r"\*\s*\(?\s*(?:\+\+|--)?\s*\w+\s*(?:\+\+|--)|\*\s*\(?\s*(?:\+\+|--)")

HARNESS = r'''
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
void orig_k(size_t batch, const CT* input, CT* output, const void* params);
void norm_k(size_t batch, const CT* input, CT* output, const void* params);
static uint64_t s = 88172645463325252ULL;
static uint32_t rnd(void) { s ^= s << 13; s ^= s >> 7; s ^= s << 17; return (uint32_t)(s >> 11); }
int main(void) {
  enum { MAXB = 300, PAD = 8 };
  static CT in[4 + MAXB + 64], in2[4 + MAXB + 64];
  static CT out_o[2 * PAD + 1], out_n[2 * PAD + 1];
  long cases = 0, bad = 0;
  for (int round = 0; round < 6; round++) {
    for (size_t batch = 1; batch <= MAXB; batch++) {
      for (int off = 0; off < 4; off++) {
        for (size_t i = 0; i < sizeof in; i++) {
          uint32_t r = rnd();
          in[i] = (CT)(round == 0 ? (r % 3 == 0 ? INTMIN_ : (r % 3 == 1 ? INTMAX_ : (CT)r)) : (CT)(r >> (round & 3)));
        }
        memcpy(in2, in, sizeof in);
        CT init = (CT)rnd();
        for (int i = 0; i < 2 * PAD + 1; i++) out_o[i] = out_n[i] = (CT)(0x55 + i);
        out_o[PAD] = out_n[PAD] = init;
        orig_k(batch, in + off, out_o + PAD, NULL);
        norm_k(batch, in2 + off, out_n + PAD, NULL);
        cases++;
        if (memcmp(out_o, out_n, sizeof out_o) || memcmp(in, in2, sizeof in)) {
          if (bad < 5) printf("MISMATCH batch=%zu off=%d orig=%d norm=%d\n", batch, off, (int)out_o[PAD], (int)out_n[PAD]);
          bad++;
        }
      }
    }
  }
  printf("cases=%ld mismatches=%ld\n", cases, bad);
  return bad ? 1 : 0;
}
'''


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", default=str(L.REPO / DEFAULT_SRC))
    ap.add_argument("--symbol", default="xnn_s8_rmax_ukernel__neon_u32_acc2")
    ap.add_argument("--ctype", default="int8_t")
    ap.add_argument("--intmin", default="INT8_MIN")
    ap.add_argument("--intmax", default="INT8_MAX")
    ap.add_argument("--out", required=True)
    ap.add_argument("--normalized", help="use this already rewritten file instead of running the tool "
                                         "(negative controls)")
    a = ap.parse_args()
    out = Path(a.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    src = Path(a.source).resolve()
    if a.normalized:
        norm = Path(a.normalized).resolve()
        info = {"normalized": str(norm), "tool_run": False}
    else:
        p = V.run([sys.executable, "-I", HERE / "rvv_ptr_lower.py", src, "--out-dir", out, "--isa", "neon"])
        norm = out / f"{src.stem}.normalized.c"
        info = {"tool_rc": p[0], "tool_out": (p[1] + p[2]).strip()}
        if p[0]:
            print(json.dumps(info))
            return 1
        js = json.loads((out / f"{src.stem}.normalization.json").read_text())
        info["r23_entries"] = sum(e["rule"] == "R23" for e in js["rewrites"])
    text = norm.read_text()
    info["source_sha256"] = V.sha(src)
    info["deref_incdec_left"] = bool(LEFT.search(text))
    (out / "main.c").write_text(HARNESS.replace("CT", a.ctype).replace("INTMIN_", a.intmin).replace("INTMAX_", a.intmax))
    base = [V.ZIG, "cc", "-target", "aarch64-linux-musl", "-O2", "-ffp-contract=off", "-static",
            "-I" + str(L.REPO / "benchmark/XNNPACK"), "-I" + str(L.REPO / "benchmark/XNNPACK/src"),
            "-I" + str(HERE / "stub-include")]
    objs = []
    for tag, f in (("orig", src), ("norm", norm)):
        o = out / f"{tag}.o"
        rename = "orig_k" if tag == "orig" else "norm_k"
        rc, so, se = V.run(base + [f"-D{a.symbol}={rename}", "-c", f, "-o", o])
        (out / f"{tag}.compile.log").write_text(so + se)
        if rc:
            info[f"{tag}_compile_error"] = [l for l in se.splitlines() if "error" in l][:3]
            print(json.dumps(info, indent=1))
            return 1
        objs.append(o)
    rc, so, se = V.run(base + [out / "main.c", *objs, "-o", out / "test.elf"])
    (out / "link.log").write_text(so + se)
    if rc:
        info["link_error"] = se[-400:]
        print(json.dumps(info, indent=1))
        return 1
    rc, so, se = V.run([V.SOL / "tools/qemu-aarch64-static", out / "test.elf"], timeout=300)
    (out / "run.out").write_text(so + se)
    info.update({"run_rc": rc, "run_stdout": so.strip()[-300:]})
    ok = rc == 0 and "mismatches=0" in so and not info["deref_incdec_left"] and \
        (a.normalized or info.get("r23_entries", 0) > 0)
    info["status"] = "OK" if ok else "FAIL"
    (out / "result.json").write_text(json.dumps(info, indent=1) + "\n")
    print(json.dumps(info, indent=1))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
