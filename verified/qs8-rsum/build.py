"""Apply standard proof.patch to disposable copies; reject implementation/spec changes."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parent
FROZEN_SHA256 = "b328a12d6fbe52df821740c9fd222b2e54af783713047ac63590c4988f086401"
ALLOWED_PATCH = {"shim.h", "shim.c", "neon.c", "rvv.c", "harness.c", "unit.c"}
LEX = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*.*?\*/|//[^\n]*', re.S)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def without_comments(text):
    return LEX.sub(lambda m: "\n" * m.group().count("\n")
                   if m.group().startswith(("/*", "//")) else m.group(), text)


def raw_c_tokens(text):
    # Secondary check covers inactive #if branches too. The authoritative token
    # boundary check below uses Clang's actual preprocessor/lexer.
    text = re.sub(r'^#line [0-9]+ "(?:\./)?[\w.]+"\s*$', '', text, flags=re.M)
    return re.findall(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|>>=|<<=|\.\.\.|##|->|\+\+|--|<<|>>|<=|>=|==|!=|&&|\|\||[+*/%&^|=-]=|\w+|[^\s]', without_comments(text))


def clang_tokens(directory, clang):
    command = [clang, "-std=c11", "-Xclang", "-dump-tokens", "-fsyntax-only", "unit.c"]
    run = subprocess.run(command, cwd=directory, text=True, capture_output=True, timeout=60)
    tokens = []
    for line in run.stderr.splitlines():
        if "Loc=<" in line:
            # Kind + spelling; flags and all source-location fields are omitted.
            token = line.split("\t", 1)[0].rstrip()
            if not re.match(r"^\w+ '.*'$", token):
                raise RuntimeError("Unrecognized Clang token record: " + line)
            tokens.append(token)
    if run.returncode or not tokens:
        raise RuntimeError("Clang tokenization failed: " + run.stderr[-3000:])
    return tokens, command


def prepare(name="separated", clang="clang"):
    if not re.fullmatch(r"[A-Za-z0-9_-]+", name):
        raise RuntimeError("Unsafe build name")
    data = (ROOT / "frozen.json").read_bytes()
    if digest(data) != FROZEN_SHA256:
        raise RuntimeError("Frozen manifest changed; proof editing cannot refresh the implementation/spec baseline")
    frozen = json.loads(data)
    for file, expected in frozen["files"].items():
        if digest((ROOT / file).read_bytes()) != expected:
            raise RuntimeError("Frozen implementation/spec changed: " + file)
    if digest(frozen["unit_source"].encode()) != frozen["unit_sha256"]:
        raise RuntimeError("Frozen aggregation entry changed")
    patch = (ROOT / "proof.patch").read_text()
    targets = re.findall(r"^(?:--- a/|\+\+\+ b/)([^\s]+)$", patch, re.M)
    if not targets or any(t not in ALLOWED_PATCH for t in targets):
        raise RuntimeError("Patch touches an unexpected file or public spec")
    destination = ROOT / ".build" / name
    if destination.exists():
        shutil.rmtree(destination)
    plain = destination / "plain"
    annotated = destination / "annotated"
    plain.mkdir(parents=True)
    for file in frozen["files"]:
        shutil.copy2(ROOT / file, plain / file)
    (plain / "unit.c").write_text(frozen["unit_source"])
    shutil.copytree(plain, annotated)
    command = ["patch", "--batch", "--fuzz=0", "-p1", "-i", str(ROOT / "proof.patch")]
    run = subprocess.run(command, cwd=annotated, text=True, capture_output=True, timeout=30)
    if run.returncode:
        raise RuntimeError("Proof patch failed:\n" + run.stdout + run.stderr)
    for file in [*frozen["files"], "unit.c"]:
        before = (plain / file).read_text()
        after = (annotated / file).read_text()
        if raw_c_tokens(before) != raw_c_tokens(after):
            raise RuntimeError("Patch changes non-ghost C/preprocessor text: " + file)
        if file == "spec.h" and before != after:
            raise RuntimeError("Patch changes the public spec")
        for match in LEX.finditer(after):
            text = match.group()
            if not text.startswith(("/*@", "//@")):
                continue
            if re.search(r"\b(axiom|axiomatic|assume|admit)\b", text):
                raise RuntimeError("Unchecked assumption syntax in " + file)
            # Only the frozen spec may contract public kernel/harness functions.
            # Outer ghost blocks hold the separately checked proof-only helpers.
            clauses = re.sub(r"\bloop\s+(assigns|invariant|variant)\b", "loop_clause", text)
            function_contract = re.search(r"\b(requires|ensures|assigns|terminates|behavior|assumes|complete|disjoint)\b", clauses)
            ghost = re.match(r"(?:/\*@|//@)\s*ghost\b", text)
            if function_contract and not ghost and file != "spec.h":
                following = without_comments(after[match.end():])
                following = re.sub(r'^#line [^\n]+\n', '', following, flags=re.M).lstrip()
                declaration = re.match(r"(?:int32_t|size_t|int32x4_t|int16x8_t|int8x16_t|vint32m8_t|vint32m1_t|vint8m2_t)\s+(\w+)\s*\(", following)
                shim_names = {"signed32", "signed16", "vmovq_n_s32", "vmovq_n_s16", "vld1q_s8", "vpadalq_s8", "vpadalq_s16", "vmulq_s8", "vaddvq_s32", "__riscv_vsetvlmax_e32m8", "__riscv_vsetvlmax_e32m1", "__riscv_vsetvl_e8m2", "__riscv_vmv_v_x_i32m8", "__riscv_vmv_v_x_i32m1", "__riscv_vle8_v_i8m2", "__riscv_vsext_vf4_i32m8", "__riscv_vadd_vv_i32m8_tu", "__riscv_vredsum_vs_i32m8_i32m1", "__riscv_vmv_x_s_i32m1_i32"}
                if file != "shim.h" or not declaration or declaration.group(1) not in shim_names:
                    raise RuntimeError("Proof injects a non-shim/public function contract in " + file)
    before, token_command = clang_tokens(plain, clang)
    after, _ = clang_tokens(annotated, clang)
    if before != after:
        index = next((i for i, (a, b) in enumerate(zip(before, after)) if a != b), min(len(before), len(after)))
        raise RuntimeError("Complete preprocessed C token mismatch at token " + str(index)
                           + ": " + repr(before[index:index+2]) + " != " + repr(after[index:index+2]))
    report = dict(passed=True, name=name, plain_dir=str(plain), annotated_dir=str(annotated),
                  entry="unit.c", frozen_sha256=digest(data), patch_sha256=digest(patch.encode()),
                  raw_c_tokens_preserved=True, public_spec_preserved=True,
                  preprocessed_token_count=len(before), preprocessed_tokens_sha256=digest("\n".join(before).encode()),
                  preprocessed_kind_and_spelling_equal=True,
                  token_command=token_command, patch_command=command,
                  generated_sha256={file: digest((annotated / file).read_bytes()) for file in [*frozen["files"], "unit.c"]},
                  ghost_noninterference_fully_proved_by_this_guard=False)
    (destination / "guard.json").write_text(json.dumps(report, indent=2) + "\n")
    return report


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--name", default="separated")
    parser.add_argument("--clang", default="clang")
    args = parser.parse_args()
    try:
        print(json.dumps(prepare(args.name, args.clang), indent=2))
    except (RuntimeError, subprocess.TimeoutExpired) as error:
        raise SystemExit(str(error))
