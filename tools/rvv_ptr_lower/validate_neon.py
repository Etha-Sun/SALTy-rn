#!/usr/bin/env python3
"""Differential test of the NEON-side normalisation (rvv_ptr_lower --isa neon).

For each kernel, the original A and the normalised A are each compiled into the
upstream SALTy harness (test_neon mapped to the harness's test_rvv entry, an empty
riscv_vector.h stub, every file-scope static array hashed before sys_reboot) and run
under qemu-aarch64; the two stdouts must be identical. Testing evidence only.
"""
import argparse
import hashlib
import json
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import validate as V  # noqa: E402

QEMU_A64 = V.SOL / "tools/qemu-aarch64-static"
ASRC = V.SALT / "kernels/source"
HNAME = {"f32-dwconv2d-chw": "f32-dwconv2d-chw", "x32-transposec": "x32-transposec"}


def build_run(k, ksrc, work):
    work.mkdir(parents=True, exist_ok=True)
    inc = work / "include"
    (inc / "zephyr/sys").mkdir(parents=True, exist_ok=True)
    (inc / "zephyr/sys/reboot.h").write_text(
        '#include <stdlib.h>\n#define SYS_REBOOT_COLD 0\nstatic inline void sys_reboot(int type) {(void)type;exit(0);}\n')
    (inc / "riscv_vector.h").write_text(
        "/* stub: the NEON kernel is linked in place of the RVV one; harness-only RVV queries get a\n"
        " * fixed value (identical for original and normalised A, so the comparison stays fair) */\n"
        "#include <stddef.h>\n#define __riscv_vsetvlmax_e32m4() ((size_t)4)\n")
    harness, arrays = V.instrument((V.SALT / "kernels/harness" / (HNAME.get(k, k) + ".c")).read_text())
    harness = harness.replace(f'"{k}.c"', f'"{ksrc}"')
    (work / "main.c").write_text(harness)
    cc = [V.ZIG, "cc", "-target", "aarch64-linux-musl", "-O3", "-DNDEBUG", "-ffp-contract=off", "-static",
          "-Dtest_neon=test_rvv", "-include", "arm_neon.h", "-I" + str(inc),
          "-I" + str(V.REPO / "benchmark/XNNPACK"), "-I" + str(V.REPO / "benchmark/XNNPACK/src"),
          "-I" + str(V.REPO / "third_party/zephyr/third-party/executorch/backends/xnnpack/third-party/pthreadpool/include"),
          "-I" + str(V.HERE / "stub-include"),
          work / "main.c", "-lm", "-o", work / "test.elf"]
    rc, so, se = V.run(cc)
    (work / "compile.log").write_text(so + se)
    if rc:
        return {"compile_rc": rc, "error": [l for l in se.splitlines() if "error" in l][:3]}
    rc, so, se = V.run([QEMU_A64, work / "test.elf"], timeout=120)
    (work / "run.out").write_text(so)
    return {"compile_rc": 0, "rc": rc, "stdout_sha256": hashlib.sha256(so.encode()).hexdigest(),
            "pass_line": "PASS" in so and "FAIL" not in so, "dumps": so.count("QCPDUMP"), "arrays": arrays}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--normalized-dir", required=True, help="dir with <k>/<k>.normalized.c")
    ap.add_argument("--out", required=True)
    ap.add_argument("kernels", nargs="+")
    a = ap.parse_args()
    out = Path(a.out).resolve()
    res = []
    for k in a.kernels:
        n = Path(a.normalized_dir).resolve() / k / f"{k}.normalized.c"
        if not (V.SALT / "kernels/harness" / (HNAME.get(k, k) + ".c")).exists():
            res.append({"kernel": k, "status": "NO-HARNESS", "identical": None})
            print(k, "NO-HARNESS (upstream has no harness file for this kernel)")
            continue
        if not n.exists():
            res.append({"kernel": k, "status": "NO-NORMALIZED", "identical": None})
            print(k, "NO-NORMALIZED (the tool produced no output for this kernel: rejected)")
            continue
        o = build_run(k, ASRC / f"{k}.c", out / k / "original")
        m = build_run(k, n, out / k / "normalized")
        same = o.get("compile_rc") == 0 and m.get("compile_rc") == 0 and o["rc"] == m["rc"] and \
            o["stdout_sha256"] == m["stdout_sha256"]
        res.append({"kernel": k, "original": o, "normalized": m, "identical": same})
        print(k, "identical" if same else "DIFFERENT/ERROR", o.get("pass_line"), o.get("error") or m.get("error") or "")
    (out / "validation-neon.json").write_text(json.dumps(res, indent=1) + "\n")
    tested = [r for r in res if r.get("status") not in ("NO-HARNESS", "NO-NORMALIZED")]
    bad = [r["kernel"] for r in tested if not r["identical"]]
    print(f"identical={len(tested) - len(bad)} different_or_error={len(bad)} "
          f"no_harness={sum(r.get('status') == 'NO-HARNESS' for r in res)} "
          f"no_normalized={sum(r.get('status') == 'NO-NORMALIZED' for r in res)}")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
