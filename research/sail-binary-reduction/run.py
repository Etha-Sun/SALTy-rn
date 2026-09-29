#!/usr/bin/env python3
"""Build both unchanged reduction kernels, import ELFs, and run finite checks."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time

from elf_image import emit, parse

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[1]
VENDOR = ROOT / "vendor"


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--out", type=Path, default=ROOT / "out/binaries")
    p.add_argument("--rvv-cc", default=str(VENDOR / "xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc"))
    p.add_argument("--clang", default="clang")
    p.add_argument("--lld", default=str(VENDOR / "llvm/usr/bin/ld.lld-14"))
    p.add_argument("--qemu-arm", default=str(VENDOR / "qemu/usr/bin/qemu-aarch64-static"))
    p.add_argument("--sail-riscv", default=str(VENDOR / "sail-riscv-Linux-x86_64/bin/sail_riscv_sim"))
    a = p.parse_args()
    out = a.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    report = {"status": "in-progress", "kernel": "qu8-rsum", "commands": [],
              "binary_equivalence_proved": False, "elf_execution_in_lean": False,
              "source_sha256": {side: digest(REPO / f"kernels/{side}/qu8-rsum.c") for side in ("source", "target")}}
    result = out / "Result.json"

    def save():
        result.write_text(json.dumps(report, indent=2) + "\n")

    def run(cmd, name, *, cwd=ROOT, env=None, timeout=180, expect=0):
        cmd = list(map(str, cmd))
        print(f"[{name}] {' '.join(cmd)}", flush=True)
        start = time.monotonic()
        with (out / (name + ".log")).open("w") as log:
            process = subprocess.run(cmd, cwd=cwd, env=env, stdout=log, stderr=subprocess.STDOUT, timeout=timeout)
        report["commands"].append({"name": name, "argv": cmd, "exit_code": process.returncode,
                                   "elapsed_seconds": round(time.monotonic() - start, 3)})
        save()
        if process.returncode != expect:
            raise RuntimeError(f"{name}: exit {process.returncode}, expected {expect}; see {out / (name + '.log')}")
        return (out / (name + ".log")).read_text()

    save()
    try:
        rvflags = ["-march=rv64gcv", "-mabi=lp64d"]
        run([a.rvv_cc, *rvflags, "-O2", "-DNDEBUG", "-S", ROOT / "kernel-rvv.c", "-o", out / "rvv.s"], "compile-rvv")
        # Freestanding mode makes Clang use its builtin stdint.h, without a host sysroot.
        armflags = ["--target=aarch64-none-elf", "-march=armv8-a+simd", "-ffreestanding", "-O2"]
        run([a.clang, *armflags, "-S", ROOT / "kernel-neon.c", "-o", out / "neon.s"], "compile-neon")
        run([a.rvv_cc, *rvflags, "-c", out / "rvv.s", "-o", out / "rvv.o"], "assemble-rvv")
        run([a.clang, *armflags, "-c", out / "neon.s", "-o", out / "neon.o"], "assemble-neon")
        common = ["-fno-builtin", "-fno-stack-protector"]
        run([a.rvv_cc, *rvflags, "-O1", "-mcmodel=medany", "-msmall-data-limit=0",
             "-fno-tree-vectorize", "-fno-tree-loop-distribute-patterns", *common,
             "-nostdlib", "-static", "-Wl,--no-relax", f"-Wl,-T,{ROOT / 'rvv.ld'}",
             ROOT / "start-rvv.S", ROOT / "check.c", out / "rvv.o", "-o", out / "rvv.elf"], "link-rvv")
        run([a.clang, *armflags, *common, "-fno-vectorize", "-fno-slp-vectorize", "-DNEON",
             "-c", ROOT / "check.c", "-o", out / "check-neon.o"], "harness-neon")
        run([a.clang, *armflags, "-c", ROOT / "start-neon.S", "-o", out / "start-neon.o"], "entry-neon")
        run([a.lld, "-m", "aarch64elf", "-static", "-e", "_start", out / "start-neon.o",
             out / "check-neon.o", out / "neon.o", "-o", out / "neon.elf"], "link-neon")
        objdump = str(Path(a.rvv_cc).with_name("riscv-none-elf-objdump"))
        run([objdump, "-d", out / "rvv.elf"], "rvv-disasm")
        run(["/usr/bin/llvm-objdump-14", "-d", out / "neon.elf"], "neon-disasm")
        report["images"] = {}
        for side, symbol in [("rvv", "test_rvv"), ("neon", "test_neon")]:
            module = "RvvBinary" if side == "rvv" else "NeonBinary"
            report["images"][side] = emit(out / f"{side}.elf", symbol, side, out / f"{module}.lean")
        for module in ["BinaryImage", "BinarySpec"]:
            shutil.copy2(ROOT / f"{module}.lean", out / f"{module}.lean")
        env = {**os.environ, "ELAN_TOOLCHAIN": (ROOT / "lean-toolchain").read_text().strip(), "LEAN_PATH": str(out)}
        for module in ["BinaryImage", "BinarySpec", "RvvBinary", "NeonBinary"]:
            run(["lean", "-j", "2", "-o", f"{module}.olean", f"{module}.lean"], "lean-" + module, cwd=out, env=env)
        (out / "AuditSpec.lean").write_text("import BinarySpec\n#print axioms ReductionBinary.equivalent_of_correct\n")
        audit = run(["lean", "AuditSpec.lean"], "AuditSpec", cwd=out, env=env)
        if "does not depend on any axioms" not in audit:
            raise RuntimeError("conditional composition lemma has unexpected axiom dependencies")
        report["lean_data_import"] = "typechecked; no ISA execution"
        run([a.qemu_arm, out / "neon.elf"], "qemu-neon", timeout=60)
        report["neon_tests"] = {"backend": "QEMU (not Sail)", "cases": 225, "status": "passed"}
        config = Path(a.sail_riscv).parent.parent / "share/sail-riscv/config"
        report["rvv_tests"] = []
        for vlen in [128, 256, 512]:
            output = run([a.sail_riscv, "--inst-limit", "100000000", "--config",
                          config / f"rv64d_v{vlen}_e64.json", out / "rvv.elf"], f"sail-rvv-{vlen}", timeout=240)
            if "SUCCESS" not in output:
                raise RuntimeError("Sail did not report HTIF SUCCESS")
            report["rvv_tests"].append({"backend": "Sail C++ emulator", "vlen": vlen, "cases": 225, "status": "passed"})
        # Negative control on actual linked bytes: suppress accumulation using
        # a same-width NOP. Only the kernel range is searched, never the harness.
        binary = bytearray((out / "rvv.elf").read_bytes())
        image = parse(binary, 243)
        addr, size, _ = image.symbols["test_rvv"]
        kernel = image.read(addr, size)
        # Extract exact bytes from disassembly to avoid hardcoding an unverified encoding.
        import re
        disasm = (out / "rvv-disasm.log").read_text()
        matches = re.findall(r"^\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+vadd\.vv\s+v8,v8,v16\s*$", disasm, re.M)
        matches = [(int(pc, 16), bytes.fromhex(word)[::-1]) for pc, word in matches if addr <= int(pc, 16) < addr + size]
        if len(matches) != 1:
            raise RuntimeError("cannot identify unique kernel accumulation instruction for negative control")
        pc, needle = matches[0]
        # Locate ELF file offset through its PT_LOAD table, not a byte-string search.
        import struct
        h = struct.unpack_from("<16sHHIQQQIHHHHHH", binary)
        for i in range(h[10]):
            typ, flags, offset, va, pa, filesz, memsz, align = struct.unpack_from("<IIQQQQQQ", binary, h[5] + i * h[9])
            if typ == 1 and va <= pc and pc + 4 <= va + filesz:
                pos = offset + pc - va
                if binary[pos:pos + 4] != needle:
                    raise RuntimeError("mutation byte mismatch")
                binary[pos:pos + 4] = bytes.fromhex("13000000")
                break
        else:
            raise RuntimeError("mutation PC has no file-backed segment")
        (out / "rvv-negative.elf").write_bytes(binary)
        run([a.sail_riscv, "--inst-limit", "1000000", "--config", config / "rv64d_v256_e64.json",
             out / "rvv-negative.elf"], "sail-rvv-negative", timeout=60, expect=1)
        report["negative_control"] = {"status": "caught", "pc": pc, "change": "vadd.vv -> nop"}
        report["status"] = "binaries-built-data-imported-finite-tests-passed"
        report["limitations"] = ["NEON Sail execution not implemented", "Neither ELF executed in Lean",
                                  "No unconditional binary equivalence theorem", "No compiler correctness theorem"]
        save()
    except Exception as e:
        report.update(status="failed", error=str(e))
        save()
        raise
    print(f"Results: {result}")


if __name__ == "__main__":
    main()
