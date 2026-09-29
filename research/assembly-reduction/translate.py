#!/usr/bin/env python3
"""Strict GNU RISC-V assembly -> Lean instruction array. No loop recognition.

This is an assembly-level importer, not an ELF decoder or a proved parser.
The opcode registry is independent of the selected function and its CFG.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import hashlib
import json
from pathlib import Path
import re
from typing import Callable


class TranslationError(ValueError):
    pass


ABI = ["zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",
       "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3",
       "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"]
REGS = {name: n for n, name in enumerate(ABI)} | {f"x{i}": i for i in range(32)} | {"fp": 8}


def reg(s: str) -> str:
    if s not in REGS:
        raise TranslationError(f"invalid integer register: {s}")
    return str(REGS[s])


def vreg(s: str) -> str:
    if not re.fullmatch(r"v(?:[0-9]|[12][0-9]|3[01])", s):
        raise TranslationError(f"invalid vector register: {s}")
    return s[1:]


def integer(s: str, low: int, high: int) -> str:
    try:
        n = int(s, 16) if re.fullmatch(r"[+-]?0[xX][0-9a-fA-F]+", s) else int(s, 10)
    except ValueError as e:
        raise TranslationError(f"unsupported integer/expression: {s}") from e
    if not low <= n <= high:
        raise TranslationError(f"immediate out of range [{low}, {high}]: {s}")
    return f"({n})" if n < 0 else str(n)


def memory(s: str) -> tuple[str, str]:
    m = re.fullmatch(r"([^()]*)\(([^()]+)\)", s)
    if not m:
        raise TranslationError(f"unsupported memory operand: {s}")
    return reg(m[2]), integer(m[1] or "0", -2048, 2047)


@dataclass(frozen=True)
class Opcode:
    arity: int
    emit: Callable[[list[str], Callable[[str], int]], str]


OPCODES: dict[str, Opcode] = {}


def register(name: str, arity: int):
    def install(fn):
        OPCODES[name] = Opcode(arity, fn)
        return fn
    return install


for name in ("add", "sub", "addw"):
    OPCODES[name] = Opcode(3, lambda a, resolve, name=name:
                          f".alu .{name} {reg(a[0])} {reg(a[1])} {reg(a[2])}")
for name, condition in (("beq", "eq"), ("bne", "ne"), ("blt", "lt"),
                        ("bge", "ge"), ("bltu", "ltu"), ("bgeu", "geu")):
    OPCODES[name] = Opcode(3, lambda a, resolve, condition=condition:
                          f".branch .{condition} {reg(a[0])} {reg(a[1])} {resolve(a[2])}")
for name, condition in (("beqz", "eq"), ("bnez", "ne")):
    OPCODES[name] = Opcode(2, lambda a, resolve, condition=condition:
                          f".branch .{condition} {reg(a[0])} 0 {resolve(a[1])}")
OPCODES["j"] = Opcode(1, lambda a, resolve: f".jump {resolve(a[0])}")
OPCODES["ret"] = Opcode(0, lambda a, resolve: ".ret")
OPCODES["nop"] = Opcode(0, lambda a, resolve: ".addi 0 0 0")
OPCODES["mv"] = Opcode(2, lambda a, resolve: f".addi {reg(a[0])} {reg(a[1])} 0")
OPCODES["li"] = Opcode(2, lambda a, resolve:
                       f".li {reg(a[0])} {integer(a[1], -(1 << 63), (1 << 64) - 1)}")
OPCODES["addi"] = Opcode(3, lambda a, resolve:
                         f".addi {reg(a[0])} {reg(a[1])} {integer(a[2], -2048, 2047)}")


@register("lw", 2)
def load(a, resolve):
    base, offset = memory(a[1])
    return f".loadWord {reg(a[0])} {base} {offset}"


@register("sw", 2)
def store(a, resolve):
    base, offset = memory(a[1])
    return f".storeWord {reg(a[0])} {base} {offset}"


@register("vsetvli", 6)
def vset(a, resolve):
    if a[2] != "e32" or a[3] not in {"m1", "m2", "m4", "m8"}:
        raise TranslationError("supported vtype subset: e32 and integer LMUL 1/2/4/8")
    if a[4] not in {"ta", "tu"} or a[5] not in {"ma", "mu"}:
        raise TranslationError("invalid tail/mask policy")
    # Only unmasked vector instructions are accepted. vma is unobservable in
    # this closed subset; adding masks/CSR reads must first extend Machine.State.
    tail = "agnostic" if a[4] == "ta" else "undisturbed"
    return f".vsetvli {reg(a[0])} {reg(a[1])} 32 {a[3][1:]} .{tail}"


@register("vle8.v", 2)
def vle(a, resolve):
    base, offset = memory(a[1])
    if offset != "0":
        raise TranslationError("vle8.v requires a zero-offset base operand")
    return f".vle8 {vreg(a[0])} {base}"


OPCODES["vmv.v.i"] = Opcode(2, lambda a, resolve:
    f".vmvVI {vreg(a[0])} {integer(a[1], -16, 15)}")
OPCODES["vzext.vf4"] = Opcode(2, lambda a, resolve:
    f".vzextVF4 {vreg(a[0])} {vreg(a[1])}")
OPCODES["vadd.vv"] = Opcode(3, lambda a, resolve:
    f".vaddVV {vreg(a[0])} {vreg(a[1])} {vreg(a[2])}")
OPCODES["vredsum.vs"] = Opcode(3, lambda a, resolve:
    f".vredsumVS {vreg(a[0])} {vreg(a[1])} {vreg(a[2])}")
OPCODES["vmv.x.s"] = Opcode(2, lambda a, resolve:
    f".vmvXS {reg(a[0])} {vreg(a[1])}")


LABEL = re.compile(r"([A-Za-z_.$][\w.$]*|[0-9]+):")


def translate(source: str, function: str) -> tuple[str, dict]:
    labels: dict[str, int] = {}
    numeric: dict[str, list[tuple[int, int]]] = {}
    rows: list[dict] = []
    entered = False
    ended = False
    for line_no, raw in enumerate(source.splitlines(), 1):
        line = raw.split("#", 1)[0].strip()
        if not line:
            continue
        if re.match(r"\.(?:macro|endm|if|ifdef|ifndef|ifnotdef|ifeq|ifne|ifgt|iflt|ifge|ifle|ifc|ifnc|ifb|ifnb|else|elseif|endif|include|incbin|rept|irp|irpc|endr|set|equ|equiv|altmacro|noaltmacro)\b", line):
            raise TranslationError(f"line {line_no}: assembler preprocessing/symbol directives are unsupported: {line}")
        label = LABEL.match(line)
        if not entered:
            if label and label[1] == function:
                entered = True
            else:
                continue
        if ended:
            if label and label[1] == function:
                raise TranslationError(f"line {line_no}: duplicate function {function}")
            continue
        while label:
            name = label[1]
            if name.isdigit():
                numeric.setdefault(name, []).append((line_no, len(rows)))
            else:
                if name in labels:
                    raise TranslationError(f"line {line_no}: duplicate label {name}")
                labels[name] = len(rows)
            line = line[label.end():].strip()
            label = LABEL.match(line)
        if not line:
            continue
        if re.fullmatch(rf"\.size\s+{re.escape(function)}\s*,\s*\.\s*-\s*{re.escape(function)}", line):
            ended = True
            continue
        if line.startswith("."):
            # Debug directives have no execution effect. In-function alignment,
            # data, macros and layout directives are intentionally NOT ignored.
            if re.fullmatch(r"\.(?:cfi_[a-z_]+|loc)\b.*", line):
                continue
            raise TranslationError(f"line {line_no}: unsupported in-function directive: {line}")
        parts = line.split(None, 1)
        op = parts[0]
        args = [s.strip() for s in parts[1].split(",")] if len(parts) == 2 else []
        if op not in OPCODES:
            raise TranslationError(f"line {line_no}: unsupported opcode {op}")
        if len(args) != OPCODES[op].arity:
            raise TranslationError(f"line {line_no}: {op} expects {OPCODES[op].arity} operands; got {args}")
        rows.append({"pc": len(rows), "line": line_no, "assembly": line, "opcode": op, "operands": args})
    if not entered or not ended or not rows:
        raise TranslationError(f"require nonempty function {function} with matching .size directive")
    for row in rows:
        def resolve(name: str) -> int:
            local = re.fullmatch(r"([0-9]+)([fb])", name)
            if local:
                candidates = [(line, pc) for line, pc in numeric.get(local[1], [])
                              if (line > row["line"] if local[2] == "f" else line <= row["line"])]
                if not candidates:
                    raise TranslationError(f"unresolved local target {name}")
                target = (min(candidates) if local[2] == "f" else max(candidates))[1]
            else:
                if name not in labels:
                    raise TranslationError(f"unresolved/external target {name}")
                target = labels[name]
            if target >= len(rows):
                raise TranslationError(f"target {name} points past function")
            return target
        try:
            row["lean"] = OPCODES[row["opcode"]].emit(row["operands"], resolve)
        except TranslationError as e:
            raise TranslationError(f"line {row['line']}: {e}") from e
    digest = hashlib.sha256(source.encode()).hexdigest()
    body = "\n".join(f"  {r['lean']}{',' if i + 1 < len(rows) else ''} -- pc={r['pc']}, source line={r['line']}"
                     for i, r in enumerate(rows))
    lean = ("-- Generated by translate.py; do not edit.\n"
            f"-- Input SHA-256: {digest}\nimport Machine\n\nnamespace Kernel\nopen Assembly\n\n"
            f"def program : Program := #[\n{body}\n]\n\nend Kernel\n")
    mapping = {"schema": 1, "function": function, "assembly_sha256": digest,
               "pc_unit": "decoded instruction index, not byte address", "labels": labels, "instructions": rows}
    return lean, mapping


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("assembly", type=Path)
    p.add_argument("--function", default="test_rvv")
    p.add_argument("--out", type=Path, required=True)
    args = p.parse_args()
    try:
        lean, mapping = translate(args.assembly.read_text(), args.function)
    except TranslationError as e:
        p.exit(2, f"translation failed: {e}\n")
    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "Impl.lean").write_text(lean)
    (args.out / "SourceMap.json").write_text(json.dumps(mapping, indent=2) + "\n")
    print(f"Translated {len(mapping['instructions'])} instructions to {args.out / 'Impl.lean'}")


if __name__ == "__main__":
    main()
