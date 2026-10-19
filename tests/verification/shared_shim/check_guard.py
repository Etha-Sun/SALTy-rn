"""Exercise frozen inputs and annotation separation on disposable repository copies."""
import difflib
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[3]
OUTPUT = Path(__file__).resolve().parent / "guard-results.json"
frozen = json.loads((ROOT / "verified/shared/frozen.json").read_text())["files"]
extras = ["tools/shim_c_check.py", "verified/qs8-rsum/build.py", "verified/shared/frozen.json",
          "verified/shared/base-proof.patch", "verified/shared/rsum-proof.patch",
          "verified/shared/clamp-proof.patch", "verified/shared/float_ops-proof.patch",
          "verified/qu8-rsum/proof.patch"]
records = {}
with tempfile.TemporaryDirectory(prefix="shared-shim-guard-") as tmp:
    repo = Path(tmp)
    for name in [*frozen, *extras]:
        target = repo / name
        target.parent.mkdir(parents=True,exist_ok=True)
        shutil.copyfile(ROOT / name,target)
    def invoke(name):
        command = ["python3",str(repo/"tools/shim_c_check.py"),"qu8-rsum","--name",name,"--prepare"]
        run = subprocess.run(command,capture_output=True,text=True,timeout=60)
        records[name] = dict(command=command,exit=run.returncode,stdout=run.stdout,stderr=run.stderr)
        return run
    positive=invoke("positive")
    assert positive.returncode == 0, positive.stderr
    for name,path,mutation in [
        ("modified_impl","verified/qu8-rsum/neon.c",lambda s:s.replace("*output += vacc;","*output = 0;")),
        ("modified_spec","verified/qu8-rsum/spec.h",lambda s:s.replace("requires 0 < n","requires 1 < n")),
        ("modified_generator","tools/shim_c_generate.py",lambda s:s+"\n# changed generator\n")]:
        p=repo/path;before=p.read_text();after=mutation(before);assert before!=after
        p.write_text(after)
        assert invoke(name).returncode != 0
        p.write_text(before)
    patch=repo/"verified/qu8-rsum/proof.patch"; original=patch.read_text()
    harness=(repo/"verified/qu8-rsum/harness.c").read_text()
    for name,after in [
        ("public_precondition",harness.replace("int equivalent(","/*@ requires \\false; */\nint equivalent(")),
        ("unchecked_ghost",harness.replace("int equivalent(","/*@ ghost /@ terminates \\true; assigns \\nothing; ensures \\false; @/ void trusted(void); */\nint equivalent(")),
        ("unchecked_double",harness.replace("int equivalent(","/*@ ghost /@ ensures \\false; @/ double trusted(void); */\nint equivalent(")),
        ("unchecked_struct",harness.replace("int equivalent(","/*@ ghost /@ ensures \\false; @/ struct xnn_qs8_rsum_params trusted(void); */\nint equivalent(")),
        ("unchecked_commented",harness.replace("int equivalent(","/*@ ghost\n// comment\n/@ ensures \\false; @/\ndouble trusted(void);\n*/\nint equivalent(")),
        ("unchecked_pointer",harness.replace("int equivalent(","/*@ ghost /@ ensures \\false; @/ double*trusted(void); */\nint equivalent(")),
        ("unchecked_struct_pointer",harness.replace("int equivalent(","/*@ ghost /@ ensures \\false; @/ struct xnn_qs8_rsum_params*trusted(void); */\nint equivalent(")),
        ("ordinary_C_change",harness.replace("  return left==right;","  right=left;\n  return left==right;")),
        ("unused_macro",harness+"\n#define PROOF_SIDE_MACRO 1\n")]:
        delta="".join(difflib.unified_diff(harness.splitlines(True),after.splitlines(True),fromfile="a/harness.c",tofile="b/harness.c"))
        patch.write_text(original+delta)
        assert invoke(name).returncode != 0
        patch.write_text(original)
unchanged=all(hashlib.sha256((ROOT/name).read_bytes()).hexdigest()==digest for name,digest in frozen.items())
assert unchanged
OUTPUT.write_text(json.dumps(dict(passed=True,main_frozen_inputs_unchanged=unchanged,
    checker_sha256=hashlib.sha256((ROOT/"tools/shim_c_check.py").read_bytes()).hexdigest(),
    scope="One positive + twelve negative guard tests; no solver/proof validity check.",records=records),indent=2)+"\n")
print("1 positive and 12 negative guard tests passed; main frozen inputs unchanged")
