#!/usr/bin/env python3
"""Reproducible Sail formal-backend experiments, with explicit outcome records."""
import argparse
import json
import os
from pathlib import Path
import signal
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parent
REV = "29e6158f0a88bdb26b9fbcd0718ab919449b5179"


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("architecture", choices=["rvv", "neon"])
    p.add_argument("--backend", choices=["rocq", "lean", "lem", "sail"], default="rocq")
    p.add_argument("--timeout", type=int, default=1200)
    p.add_argument("--out", type=Path, help="isolated output directory for a new attempt")
    p.add_argument("--matchbv", action="store_true")
    p.add_argument("--slice", action="store_true", help="Use Sail's own dependency slicer before backend rewrites")
    p.add_argument("--kernel", action="store_true", help="Include an automatically generated ELF-to-Sail kernel adapter")
    a = p.parse_args()
    name = f"{a.architecture}-{a.backend}-strict" + ("-matchbv" if a.matchbv else "") + ("-slice-custom" if a.slice else "") + ("-kernel" if a.kernel else "-vext" if a.architecture == "rvv" else "")
    out = a.out.resolve() if a.out else ROOT / "out/formal" / name
    out.mkdir(parents=True, exist_ok=True)
    sail = ROOT / "vendor/sail/bin/sail"
    env = {**os.environ, "PATH": str(sail.parent) + ":" + os.environ["PATH"]}
    cache = out / "sail_smt_cache"
    if not cache.exists():
        caches = list((ROOT / "out/formal").glob("*/sail_smt_cache"))
        if caches:
            shutil.copyfile(max(caches, key=lambda p: p.stat().st_size), cache)
    if a.architecture == "rvv":
        cwd = ROOT / "vendor" / ("sail-riscv-" + REV) / "model"
        generated = out / "model"
        generated.mkdir(exist_ok=True)
        config = ROOT / "vendor/sail-riscv-Linux-x86_64/share/sail-riscv/config/rv64d_v256_e64.json"
        cmd = [str(sail), "--strict-var", "--strict-bitvector", "--strict-exponentials", "--dprofile",
               "--memo-z3-path", str(out / "sail_smt_cache"), "--config", str(config)]
        if a.backend == "rocq":
            cmd += ["--rocq-output-dir", str(generated), "--drocq-undef-axioms", "--rocq-lib", "riscv_extras"]
        elif a.backend == "lem":
            cmd += ["--lem-output-dir", str(generated), "--isa-output-dir", str(generated),
                    "--lem-sequential", "--lem-lib", "Riscv_extras", "--lem-lib", "Riscv_extras_fdext"]
        elif a.backend == "lean":
            cmd += ["--lean-output-dir", str(generated), "--lean-force-output",
                    "--lean-lib-rev", "79b4d08505af29d88b3918f32d29840fae1fa191",
                    "--lean-non-beq-type", "instruction", "--lean-non-beq-type", "ExecutionResult",
                    "--lean-non-beq-type", "Step", "--lean-import-file", "../handwritten_support/RiscvExtrasExecutable.lean"]
            if a.matchbv:
                cmd += ["--lean-matchbv"]
        if a.slice:
            commands = out / "slice.commands"
            commands.write_text(":slice_roots execute encdec encdec_compressed\n:slice\n:rewrites " + a.backend + "\n:target " + a.backend + " rv64_kernel\n:quit\n")
            cmd += ["--output-sail", "-o", str(out / "instantiated"), "--interact-custom"]
        else:
            cmd += ["--" + ("output-sail" if a.backend == "sail" else a.backend), "-o",
                    str(generated / "rv64_kernel") if a.backend == "sail" else "rv64_kernel"]
        # Selecting a parent module on the CLI does not select all its children.
        cmd += ["V_instructions", "Zca", "Zba", "Zicsr_insts", "postlude", "riscv.sail_project"]
        if a.kernel:
            from elf_to_sail import emit
            emit(ROOT / "artifacts/rvv.elf", "test_rvv", out / "Kernel.sail")
            project = out / "kernel.sail_project"
            project.write_text('kernel_adapter {\n  requires prelude, core, sys, exceptions, postlude, V, Zca, Zba, Zicsr_insts\n  files Kernel.sail\n}\n')
            cmd += ["kernel_adapter", str(project)]
    else:
        if a.backend not in ("rocq", "lem") or a.matchbv or a.slice or a.kernel:
            p.error("Arm experiment currently uses upstream gen_coq or lem")
        cwd = ROOT / "vendor/sail-arm-master/arm-v9.4-a"
        generated = cwd / ("coq" if a.backend == "rocq" else "lem")
        cmd = ["make", "gen_coq" if a.backend == "rocq" else "lem", f"SAIL={sail}", f"SAIL_DIR={ROOT / 'vendor/sail/share/sail'}", "VERBOSE_FLAG=-verbose 0"]
    report = {"status": "running", "command": cmd, "cwd": str(cwd),
              "architecture": a.architecture, "backend": a.backend,
              "timeout_seconds": a.timeout, "generated_files": [], "typechecked": False,
              "binary_execution": False, "binary_equivalence_proved": False}
    result = out / "Result.json"
    result.write_text(json.dumps(report, indent=2) + "\n")
    suffix = {"rocq": "*.v", "lean": "*.lean", "lem": "*.lem", "sail": "*.sail"}[a.backend]
    before = {p.resolve(): p.stat().st_mtime_ns for p in generated.rglob(suffix)}
    start = time.monotonic()
    with (out / "generation.log").open("w") as log:
        proc = subprocess.Popen(cmd, cwd=cwd, env=env, stdin=subprocess.PIPE if a.slice else subprocess.DEVNULL,
                                stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        if a.slice:
            proc.stdin.write(commands.read_bytes())
            proc.stdin.close()
        try:
            rc = proc.wait(timeout=a.timeout)
            report.update(status="generated" if rc == 0 else "failed", exit_code=rc)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGTERM)
            try:
                proc.wait(timeout=10)
            except subprocess.TimeoutExpired:
                os.killpg(proc.pid, signal.SIGKILL)
                proc.wait()
            report.update(status="timeout", exit_code=proc.returncode)
    report["elapsed_seconds"] = round(time.monotonic() - start, 3)
    report["generated_files"] = [str(p) for p in generated.rglob(suffix)
                                 if before.get(p.resolve()) != p.stat().st_mtime_ns]
    report["generated_isa_files"] = [p for p in report["generated_files"]
                                     if Path(p).name not in {"extra_defs.lem", "arm_extras.v"}]
    if report["status"] == "generated" and not report["generated_isa_files"]:
        report["status"] = "no-new-output"
    result.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
    return 0 if report["status"] == "generated" else 1


if __name__ == "__main__":
    raise SystemExit(main())
