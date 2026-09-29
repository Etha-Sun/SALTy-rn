#!/usr/bin/env python3
"""Archive actual generated formal sources, checker results and diagnostics."""
import gzip
import hashlib
import json
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parent


def main():
    destination = ROOT / "artifacts/formal"
    destination.mkdir(parents=True, exist_ok=True)
    results = {"generation_attempts": {}, "checks": {}, "archives": {},
               "kernel_executed_in_generated_model": False, "correctness_proved": False,
               "isabelle_checked": False}
    for path in sorted((ROOT / "out/formal").glob("*/Result.json")):
        result = json.loads(path.read_text())
        result["generated_isa_files"] = [p for p in result["generated_files"]
                                         if Path(p).name not in {"extra_defs.lem", "arm_extras.v"}]
        # A CLI parent-module name does not select all children. Keep the
        # historical command but explicitly flag its incomplete V selection.
        if result["architecture"] == "rvv":
            result["vector_module_selected"] = ("V_instructions" in result["command"] or
                                                  "kernel_adapter" in result["command"])
        results["generation_attempts"][path.parent.name] = result
        log = path.parent / "generation.log"
        if log.exists():
            (destination / (path.parent.name + ".log.gz")).write_bytes(gzip.compress(log.read_bytes(), mtime=0))
    for target in ("check", "isabelle", "coq"):
        path = ROOT / "out" / ("lem-" + target)
        if (path / "Result.json").exists():
            results["checks"][target] = json.loads((path / "Result.json").read_text())
            (destination / ("lem-" + target + ".log.gz")).write_bytes(gzip.compress((path / "check.log").read_bytes(), mtime=0))
    check = results["checks"].get("check", {})
    if check.get("status") != "passed":
        raise SystemExit("No passed Lem check to archive")
    inputs = ROOT / "out/lem-check/input"
    files = list(inputs.glob("*.lem")) + list((ROOT / "out/lem-isabelle").glob("*.thy"))
    for path in files:
        data = path.read_bytes()
        zipped = gzip.compress(data, mtime=0)
        output = destination / (path.name + ".gz")
        output.write_bytes(zipped)
        results["archives"][output.name] = {"source": str(path), "bytes": len(data),
                                           "sha256": hashlib.sha256(data).hexdigest(),
                                           "archive_sha256": hashlib.sha256(zipped).hexdigest()}
    kernel = ROOT / "out/formal/rvv-lem-strict-kernel/Kernel.sail"
    for path in (kernel, kernel.with_suffix(".json"), ROOT / "kernel_spec.lem"):
        shutil.copyfile(path, destination / path.name)
    full = (inputs / "rv64_kernel.lem").read_text()
    begin = full.index("val kernel_instruction :")
    end = full.index("val initialize_registers :", begin)
    (destination / "Kernel_entry.lem.txt").write_text(
        "(* Exact excerpt, NOT a standalone module. See rv64_kernel.lem.gz. *)\n" + full[begin:end])
    results["spec_check"] = {"lem_typechecked": (ROOT / "out/lem-isabelle/Kernel_spec.thy").exists(),
                              "isabelle_source_generated": (ROOT / "out/lem-isabelle/Kernel_spec.thy").exists(),
                              "correctness_connection_proved": False}
    (destination / "Result.json").write_text(json.dumps(results, indent=2) + "\n")
    print(destination / "Result.json")


if __name__ == "__main__":
    main()
