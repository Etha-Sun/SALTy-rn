"""Independent positive/negative tests of the frozen-source proof build guard.

Only disposable temporary case copies are mutated. This does not run WP or
establish full ghost noninterference; it checks the claimed build rejection.
"""
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[3]
CASE = ROOT / "verified/qs8-rsum"
OUT = Path(__file__).resolve().parent / "evidence"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def check_case(directory, name):
    command = ["python3", str(directory / "build.py"), "--name", name]
    run = subprocess.run(command, text=True, capture_output=True, timeout=90)
    return dict(command=command, exit=run.returncode,
                stdout=run.stdout, stderr=run.stderr)


def patch_from_sources(plain, annotated):
    result = []
    for name in plain:
        for line in difflib.unified_diff(
                plain[name].splitlines(keepends=True),
                annotated[name].splitlines(keepends=True),
                fromfile="a/" + name, tofile="b/" + name):
            result.append(line if line.endswith("\n") else
                          line + "\n\\ No newline at end of file\n")
    return "".join(result)


def main():
    frozen = json.loads((CASE / "frozen.json").read_text())
    names = ["build.py", "frozen.json", "proof.patch", *frozen["files"]]
    baseline = {name: (CASE / name).read_bytes() for name in names}
    records = {}
    with tempfile.TemporaryDirectory(prefix="qs8-proof-separation-") as temp:
        case = Path(temp) / "case"
        case.mkdir()
        for name, data in baseline.items():
            (case / name).write_bytes(data)
        records["positive"] = check_case(case, "positive")
        assert records["positive"]["exit"] == 0, records["positive"]
        guard = json.loads(records["positive"]["stdout"])
        plain_dir = Path(guard["plain_dir"])
        annotated_dir = Path(guard["annotated_dir"])
        plain = {name: (plain_dir / name).read_text()
                 for name in [*frozen["files"], "unit.c"]}
        annotated = {name: (annotated_dir / name).read_text() for name in plain}

        # Frozen implementation changes must fail before proof application.
        before = (case / "neon.c").read_text()
        assert "*output += vacc;" in before
        after = before.replace("*output += vacc;", "*output = 0;", 1)
        (case / "neon.c").write_text(after)
        records["modified_frozen_impl"] = check_case(case, "modified-impl")
        records["modified_frozen_impl"]["mutation_diff"] = "".join(
            difflib.unified_diff(before.splitlines(keepends=True),
                                 after.splitlines(keepends=True),
                                 fromfile="neon.c", tofile="neon.c"))
        assert records["modified_frozen_impl"]["exit"] != 0
        assert "Frozen implementation/spec changed: neon.c" in (
            records["modified_frozen_impl"]["stdout"] +
            records["modified_frozen_impl"]["stderr"])
        (case / "neon.c").write_bytes(baseline["neon.c"])

        # Regenerate a syntactically valid standard patch with an ordinary
        # assignment, so rejection cannot merely be malformed patch syntax.
        changed = dict(annotated)
        changed["neon.c"] = changed["neon.c"].replace(
            "*output += vacc;", "*output += vacc;\n  *output = 0;", 1)
        patch = patch_from_sources(plain, changed)
        (case / "proof.patch").write_text(patch)
        records["patch_runtime_assignment"] = check_case(case, "runtime-assignment")
        records["patch_runtime_assignment"]["patch_sha256"] = digest(patch.encode())
        records["patch_runtime_assignment"]["mutation"] = "Add *output = 0 after the final NEON accumulation"
        assert records["patch_runtime_assignment"]["exit"] != 0
        assert "Patch changes non-ghost C/preprocessor text: neon.c" in (
            records["patch_runtime_assignment"]["stdout"] +
            records["patch_runtime_assignment"]["stderr"]), records["patch_runtime_assignment"]

        # Even an unused #define leaves the preprocessed program tokens alone;
        # the raw/preprocessor guard must still reject new macro definitions.
        changed = dict(annotated)
        changed["shim.h"] += "\n#define UNUSED_PROOF_MACRO 1\n"
        patch = patch_from_sources(plain, changed)
        (case / "proof.patch").write_text(patch)
        records["patch_unused_macro"] = check_case(case, "unused-macro")
        records["patch_unused_macro"]["patch_sha256"] = digest(patch.encode())
        records["patch_unused_macro"]["mutation"] = "Append #define UNUSED_PROOF_MACRO 1 to the annotated shim header"
        assert records["patch_unused_macro"]["exit"] != 0
        assert "Patch changes non-ghost C/preprocessor text: shim.h" in (
            records["patch_unused_macro"]["stdout"] +
            records["patch_unused_macro"]["stderr"]), records["patch_unused_macro"]

    unchanged = all((CASE / name).read_bytes() == data
                    for name, data in baseline.items())
    assert unchanged, "Main case changed during this test; rerun after freezing"
    clang = subprocess.run(["clang", "--version"], text=True,
                           capture_output=True, timeout=10)
    report = dict(passed=True, case_inputs_sha256={name: digest(data)
                  for name, data in baseline.items()}, main_case_unmodified=True,
                  clang_version=clang.stdout.splitlines()[0],
                  negative_cases=3, records=records,
                  proof_validity_checked=False,
                  full_ghost_noninterference_checked=False)
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "results.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({k: v for k, v in report.items()
                      if k not in ("records", "case_inputs_sha256")}, indent=2))


if __name__ == "__main__":
    main()
