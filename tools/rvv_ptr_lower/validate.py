#!/usr/bin/env python3
"""Validation of rvv_ptr_lower on a directory of kernels.

Per kernel:
  determinism  lowering twice (separate output dirs) gives byte-identical outputs
  syntax       the lowered file plus the generated pointer-op header parses (clang 20)
  idempotence  lowering the lowered file performs no rewrite and no rejection
  difftest     original and lowered kernel, each compiled into the upstream SALTy
               harness (unchanged except a dump of every file-scope static array
               before each sys_reboot), run under QEMU at VLEN 128/256/512; the two
               stdouts must be identical (PASS/FAIL line, mismatch messages and
               the FNV-1a hash of every static buffer, inputs and outputs alike).
This is testing evidence for the rewrite, not a proof.
"""
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
sys.path.insert(0, str(HERE))
import rvv_ptr_lower as L  # noqa: E402

SOL = REPO / "research/sol-pipeline-comparison-20261030"
SALT = SOL / "sources/SALTy-rn"
ZIG = SOL / "tools/ziglang/zig"
QEMU = SOL / "tools/qemu-riscv64-static"
HARNESS_NAME = {"dwconv2d-chw": "f32-dwconv2d-chw", "x32transpose": "x32-transposec"}
ENTRY_RENAME = {"x32transpose": "xnn_x32_transposec_ukernel__8xv2_rvv"}
VLENS = (128, 256, 512)


def run(cmd, cwd=None, timeout=300):
    p = subprocess.run([str(c) for c in cmd], cwd=cwd, capture_output=True, timeout=timeout,
                       env=L.clang_env())
    return p.returncode, p.stdout.decode("utf-8", "replace"), p.stderr.decode("utf-8", "replace")


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def lower(src, out_dir):
    out_dir.mkdir(parents=True, exist_ok=True)
    rc, so, se = run([sys.executable, "-I", HERE / "rvv_ptr_lower.py", src, "--out-dir", out_dir])
    return rc, so.strip() + se.strip()


def instrument(harness_text):
    arrays = re.findall(r"^static\s+(?:const\s+)?[A-Za-z_][\w\s\*]*?\b(\w+)\s*(?:\[[^\]]*\])+\s*(?:=|;)",
                        harness_text, re.M)
    dump = ["static void qcp_dump(void) {"]
    for a in arrays:
        dump.append(f'  {{ const unsigned char *p = (const unsigned char *)&{a}; unsigned long long h = 1469598103934665603ULL;'
                    f' for (size_t i = 0; i < sizeof({a}); i++) {{ h ^= p[i]; h *= 1099511628211ULL; }}'
                    f' printf("QCPDUMP {a} %zu %016llx\\n", sizeof({a}), h); }}')
    dump.append("  fflush(stdout);\n}\n")
    block = "\n".join(dump)
    text = re.sub(r"^(int\s+main\s*\()", lambda m: block + m.group(1), harness_text, count=1, flags=re.M)
    text = text.replace("sys_reboot(", "qcp_dump(), sys_reboot(")
    return text, arrays


def strip_param_structs(text):
    """Test-only adaptation, applied identically to original and lowered kernels: drop
    the kernel's own `struct xnn_*_params {...};` definitions when they collide with the
    harness's XNNPACK microparams.h. Returns (text, removed names)."""
    out, removed, i = [], [], 0
    for m in re.finditer(r"^struct\s+(xnn_\w+)\s*\{", text, re.M):
        if m.start() < i:
            continue
        depth, j = 0, m.end() - 1
        while True:
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        k = text.index(";", j) + 1
        out.append(text[i:m.start()])
        out.append(f"/* difftest: struct {m.group(1)} taken from XNNPACK microparams.h */")
        removed.append(m.group(1))
        i = k
    out.append(text[i:])
    return "".join(out), removed


def build_and_run(kernel, ksrc, include_dirs, work, strip_structs=False):
    hname = HARNESS_NAME.get(kernel, kernel)
    work.mkdir(parents=True, exist_ok=True)
    res_extra = {}
    if strip_structs:
        t, removed = strip_param_structs(Path(ksrc).read_bytes().decode("latin-1"))
        ksrc = work / ("adapted-" + Path(ksrc).name)
        ksrc.write_bytes(t.encode("latin-1"))
        res_extra["harness_adaptation"] = {"removed_kernel_structs": removed}
    harness = (SALT / "kernels/harness" / (hname + ".c")).read_text()
    harness, arrays = instrument(harness)
    harness = harness.replace(f'"{hname}.c"', f'"{ksrc}"')
    work.mkdir(parents=True, exist_ok=True)
    (work / "include/zephyr/sys").mkdir(parents=True, exist_ok=True)
    (work / "include/zephyr/sys/reboot.h").write_text(
        '#include <stdlib.h>\n#define SYS_REBOOT_COLD 0\nstatic inline void sys_reboot(int type) {(void)type;exit(0);}\n')
    main = work / "main.c"
    main.write_text(harness)
    defs = [f"-D{ENTRY_RENAME[kernel]}=test_rvv"] if kernel in ENTRY_RENAME else []
    cc = [ZIG, "cc", "-target", "riscv64-linux-musl", "-mcpu=generic_rv64+m+a+f+d+c+v+zvfh", "-O3",
          "-DNDEBUG", "-ffp-contract=off", "-static", *defs, "-I" + str(work / "include"),
          *["-I" + str(d) for d in include_dirs],
          "-I" + str(REPO / "benchmark/XNNPACK"), "-I" + str(REPO / "benchmark/XNNPACK/src"),
          "-I" + str(REPO / "third_party/zephyr/third-party/executorch/backends/xnnpack/third-party/pthreadpool/include"),
          main, "-lm", "-o", work / "test.elf"]
    rc, so, se = run(cc)
    (work / "compile.log").write_text(so + se)
    res = {"compile_rc": rc, "dumped_arrays": arrays, **res_extra}
    if rc:
        res["compile_error"] = [l for l in se.splitlines() if "error" in l][:5]
        return res
    res["runs"] = {}
    for v in VLENS:
        rc, so, se = run([QEMU, "-cpu", f"rv64,v=true,vlen={v},elen=64,vext_spec=v1.0", work / "test.elf"], timeout=120)
        (work / f"vlen{v}.out").write_text(so)
        res["runs"][v] = {"rc": rc, "stdout_sha256": hashlib.sha256(so.encode()).hexdigest(),
                          "pass_line": "PASS" in so and "FAIL" not in so, "dump_lines": so.count("QCPDUMP")}
    return res


def validate(src, out):
    k = src.stem
    rec = {"kernel": k, "input_sha256": sha(src)}
    d1, d2 = out / k / "run1", out / k / "run2"
    rc1, m1 = lower(src, d1)
    rc2, m2 = lower(src, d2)
    rec["lower"] = m1
    if rc1 or rc2:
        rec["status"] = "REJECTED"
        return rec
    files = sorted(p.name for p in d1.iterdir() if not p.name.startswith("r12-derived"))
    rec["determinism"] = all((d1 / f).read_bytes() == (d2 / f).read_bytes() for f in files)
    lowered = d1 / f"{k}.lowered.c"
    rec["lowered_sha256"] = sha(lowered)
    rec["header_sha256"] = sha(d1 / "qcp_rvv_ptr_ops.h")
    cfg = json.loads((HERE / "config.json").read_text())
    profile, _, cmd = L.parse(cfg, lowered)
    rec["syntax"] = True
    # idempotence: re-lower the output against the prototype interface (the macro
    # header would expand the pointer ops back into intrinsic calls)
    d3 = out / k / "idempotence"
    din = out / k / "idempotence-input"
    din.mkdir(parents=True, exist_ok=True)
    (din / lowered.name).write_bytes(lowered.read_bytes())
    (din / "qcp_rvv_ptr_ops.h").write_bytes((d1 / "qcp_rvv_ptr_ops.proto.h").read_bytes())
    rc3, m3 = lower(din / lowered.name, d3)
    j3 = json.loads((d3 / f"{k}.lowered.lowering.json").read_text())
    rec["idempotence"] = rc3 == 0 and not j3.get("rewrites") and not j3.get("rejections")
    a = build_and_run(k, src, [], out / k / "diff-original")
    strip = a["compile_rc"] != 0 and any("redefinition of 'xnn_" in l for l in a.get("compile_error", []))
    if strip:
        a = build_and_run(k, src, [], out / k / "diff-original", strip_structs=True)
    b = build_and_run(k, lowered, [d1], out / k / "diff-lowered", strip_structs=strip)
    rec["difftest"] = {"original": a, "lowered": b}
    same = a["compile_rc"] == 0 and b["compile_rc"] == 0 and all(
        a["runs"][v]["stdout_sha256"] == b["runs"][v]["stdout_sha256"] and a["runs"][v]["rc"] == b["runs"][v]["rc"]
        for v in VLENS)
    rec["difftest_identical"] = same
    rec["status"] = "OK" if rec["determinism"] and rec["idempotence"] and same else "CHECK"
    return rec


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("kernel_dir")
    ap.add_argument("--out", required=True)
    ap.add_argument("--only", nargs="*")
    a = ap.parse_args()
    out = Path(a.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    recs = []
    for src in sorted(Path(a.kernel_dir).resolve().glob("*.c")):
        if a.only and src.stem not in a.only:
            continue
        try:
            r = validate(src, out)
        except L.Reject as e:
            r = {"kernel": src.stem, "status": "ERROR", "error": e.rule + ": " + e.message}
        except Exception as e:  # recorded, never hidden
            r = {"kernel": src.stem, "status": "ERROR", "error": repr(e)}
        recs.append(r)
        print(r["kernel"], r["status"], {k: r.get(k) for k in ("determinism", "idempotence", "difftest_identical")}, flush=True)
    (out / "validation.json").write_text(json.dumps({"tool": L.TOOL_VERSION, "results": recs}, indent=1) + "\n")


if __name__ == "__main__":
    main()
