#!/usr/bin/env python3
"""Preserve compact, reviewable evidence from completed runs (no new claims)."""
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parent


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    out = ROOT / "out"
    dest = ROOT / "artifacts"
    dest.mkdir(exist_ok=True)
    binary_result = json.loads((out / "binaries/Result.json").read_text())
    if binary_result["status"] != "binaries-built-data-imported-finite-tests-passed":
        raise SystemExit("binary test run has not completed successfully")
    for side, expected in binary_result["source_sha256"].items():
        if digest(ROOT.parents[1] / f"kernels/{side}/qu8-rsum.c") != expected:
            raise SystemExit(f"kernel source changed since testing: {side}")
    names = ["rvv.s", "neon.s", "rvv.elf", "neon.elf", "rvv-negative.elf",
             "RvvBinary.lean", "NeonBinary.lean", "RvvBinary.json", "NeonBinary.json",
             "rvv-disasm.log", "neon-disasm.log", "sail-rvv-128.log", "sail-rvv-256.log",
             "sail-rvv-512.log", "sail-rvv-negative.log", "qemu-neon.log"]
    names.append("AuditSpec.log")
    for name in names:
        shutil.copy2(out / "binaries" / name, dest / name)
    shutil.copy2(out / "binaries/Result.json", dest / "BinaryResult.json")
    model_reports = {}
    for name in ["rvv-generation", "neon-generation", "rvv-matchbv-generation", "neon-matchbv-generation"]:
        folder = out / name
        r = json.loads((folder / "Result.json").read_text())
        if r["status"] == "running":
            raise SystemExit(f"still running: {name}")
        log = re.sub(r"\x1b\[[0-9;]*[A-Za-z]", "", (folder / "generation.log").read_text())
        # Remove progress bars without losing errors or completed pass timings.
        log = re.sub(r"(?:Type check|Effects \((?:direct|transitive)\)|Rewrite) "
                     r"\[[^\]]*\]\s*\d+%\s*\([^\n)]*\)[ \t]*", "", log)
        log, unused_count = re.subn(r"Warning: Unused variable[^\n]*\n"
                                    r"(?:(?!Warning:|Error:).)*?This variable is defined but never used\.\n*",
                                    "", log, flags=re.S)
        log = f"[Summary: {unused_count} unused-variable warnings omitted; full log is under out/]\n" + log
        (dest / (name + ".log")).write_text(log)
        model_reports[name] = r
    for tool, cmd in {"clang": ["clang", "--version"],
                      "rvv-gcc": [str(ROOT / "vendor/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc"), "--version"],
                      "sail-riscv": [str(ROOT / "vendor/sail-riscv-Linux-x86_64/bin/sail_riscv_sim"), "--build-info"]}.items():
        p = subprocess.run(cmd, capture_output=True, text=True, check=True)
        (dest / (tool + "-version.txt")).write_text(p.stdout)
    report = {"kernel": "qu8-rsum", "source_files_unchanged": True,
              "toolchain": json.loads((ROOT / "tools.lock.json").read_text()),
              "binary_tests": binary_result, "model_generation": model_reports,
              "rvv_lean_emulator": json.loads((out / "lean-emulator/Result.json").read_text()),
              "scope": "finite binary tests plus typed ELF data; incomplete Sail-to-Lean pipeline",
              "binary_equivalence_proved": False, "compiler_correctness_proved": False,
              "artifact_sha256": {p.name: digest(p) for p in sorted(dest.iterdir()) if p.is_file()}}
    # Do not include a previous manifest's own hash on repeated exports.
    report["artifact_sha256"].pop("Result.json", None)
    (dest / "Result.json").write_text(json.dumps(report, indent=2) + "\n")
    print(dest / "Result.json")


if __name__ == "__main__":
    main()
