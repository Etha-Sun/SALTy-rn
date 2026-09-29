#!/usr/bin/env python3
"""Build/run upstream's actual RISC-V Lean emulator, only with a generated model.

Never falls back to the handwritten assembly model or an external simulator.
lake update may need network access. Arm has no adapter in this experiment yet.
"""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parent


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--model", type=Path, default=ROOT / "out/rvv-generation/models/Lean_RV64D_executable")
    p.add_argument("--elf", type=Path, default=ROOT / "out/binaries/rvv.elf")
    p.add_argument("--timeout", type=int, default=1800)
    a = p.parse_args()
    out = ROOT / "out/lean-emulator"
    out.mkdir(parents=True, exist_ok=True)
    result = out / "Result.json"
    report = {"status": "not-started", "elf": str(a.elf.resolve()),
              "model": str(a.model.resolve()), "elf_execution_in_lean": False,
              "binary_equivalence_proved": False}
    def save():
        result.write_text(json.dumps(report, indent=2) + "\n")
    save()
    if not (a.model / "lakefile.toml").exists():
        report.update(status="blocked-missing-generated-model",
                      reason="Sail ISA -> Lean must complete first; binary data import is insufficient")
        save()
        print(report["reason"])
        return 2
    upstream = ROOT / "vendor/sail-riscv-29e6158f0a88bdb26b9fbcd0718ab919449b5179/lean_emulator"
    for name in ["LeanRiscv.lean", "Main.lean"]:
        shutil.copy2(upstream / name, out / name)
    template = (upstream / "lakefile.toml.in").read_text()
    (out / "lakefile.toml").write_text(template.replace("@lean_rv64d_executable_dir@", str(a.model.resolve())))
    shutil.copy2(ROOT / "lean-toolchain", out / "lean-toolchain")
    env = {**os.environ, "ELAN_TOOLCHAIN": (ROOT / "lean-toolchain").read_text().strip()}
    report["status"] = "building"
    save()
    try:
        for stage, cmd in [("update", ["lake", "update"]),
                           ("build", ["lake", "build", "lean_riscv_emulator"]),
                           ("execute", [str(out / ".lake/build/bin/lean_riscv_emulator"), str(a.elf.resolve())])]:
            start = time.monotonic()
            with (out / (stage + ".log")).open("w") as log:
                subprocess.run(cmd, cwd=out, env=env, stdout=log, stderr=subprocess.STDOUT,
                               check=True, timeout=a.timeout)
            report[stage + "_seconds"] = round(time.monotonic() - start, 3)
            save()
        report.update(status="executed-in-lean", elf_execution_in_lean=True)
    except (subprocess.SubprocessError, OSError) as e:
        report.update(status="failed", error=str(e))
        save()
        return 1
    save()
    print(result)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
