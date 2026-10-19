"""Probe whether an extra contract can be injected without editing spec.h.

This diagnostic uses only a disposable case; it does not run WP or change the
real public contract. A regression that accepts the injected contract fails.
"""
import hashlib
import json
from pathlib import Path
import runpy
import tempfile

b = Path(__file__).resolve().parent
helpers = runpy.run_path(str(b / "check.py"))
case = helpers["CASE"]
frozen = json.loads((case / "frozen.json").read_text())
names = ["build.py", "frozen.json", "proof.patch", *frozen["files"]]
baseline = {name: (case / name).read_bytes() for name in names}
with tempfile.TemporaryDirectory(prefix="qs8-contract-injection-") as temp:
    copy = Path(temp) / "case"
    copy.mkdir()
    for name, data in baseline.items():
        (copy / name).write_bytes(data)
    positive = helpers["check_case"](copy, "positive")
    assert positive["exit"] == 0, positive
    guard = json.loads(positive["stdout"])
    plain = {name: (Path(guard["plain_dir"]) / name).read_text()
             for name in [*frozen["files"], "unit.c"]}
    annotated = {name: (Path(guard["annotated_dir"]) / name).read_text()
                 for name in plain}
    assert "int equivalent(" in annotated["harness.c"]
    annotated["harness.c"] = annotated["harness.c"].replace(
        "int equivalent(", "/*@ requires \\false; */\nint equivalent(", 1)
    (copy / "proof.patch").write_text(helpers["patch_from_sources"](plain, annotated))
    record = helpers["check_case"](copy, "contract-injection")
    rejected = record["exit"] != 0 and "Proof injects a non-shim/public function contract in harness.c" in (record["stdout"] + record["stderr"])
    result = dict(passed=rejected,
                  probe="add requires false before equivalent definition; spec.h unchanged",
                  case_inputs_sha256={n: hashlib.sha256(v).hexdigest()
                                      for n, v in baseline.items()},
                  main_case_unmodified=all((case/n).read_bytes()==v
                                           for n, v in baseline.items()),
                  result=record, proof_validity_checked=False)
    output = b / "evidence" / "public-contract-rejected.json"
    output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))
    assert rejected, "Guard accepted an extra public function contract"
