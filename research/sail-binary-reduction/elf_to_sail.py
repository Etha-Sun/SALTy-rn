#!/usr/bin/env python3
"""Embed a linked RV64 function in the upstream Sail decoder/executor.

This generates a static-code dispatch adapter, not new instruction semantics.
Instruction fetch faults, interrupts, reset and memory loading remain the
responsibility of the platform adapter. Instruction bodies are upstream Sail.
"""
import argparse
import json
from pathlib import Path

from elf_image import parse


def emit(elf: Path, symbol: str, output: Path):
    image = parse(elf.read_bytes(), 243)
    address, size, kind = image.symbols[symbol]
    if kind != 2 or not size or address % 2:
        raise ValueError("expected a nonempty, aligned function symbol")
    if not any(s.flags & 1 and s.address <= address and
               address + size <= s.address + len(s.data) for s in image.segments):
        raise ValueError("function must be executable file-backed data")
    code = image.read(address, size)
    instructions = []
    offset = 0
    while offset < len(code):
        if offset + 2 > len(code):
            raise ValueError("truncated instruction")
        half = int.from_bytes(code[offset:offset + 2], "little")
        width = 2 if half & 3 != 3 else 4
        if width == 4 and half & 31 == 31:
            raise ValueError("instructions longer than 32 bits are unsupported")
        if offset + width > len(code):
            raise ValueError("truncated instruction")
        word = int.from_bytes(code[offset:offset + width], "little")
        instructions.append({"address": address + offset, "width": width, "word": word})
        offset += width
    lines = [
        "// Generated from ELF; instruction semantics come from upstream Sail.",
        f"// ELF SHA256: {image.sha256}",
        "// Static code, RV64, no fetch faults/interrupts/landing-pad checks.",
        "// A platform must initialize registers and data memory separately.",
        "val kernel_instruction : bits(64) -> option((instruction, range(2, 4)))",
        "function kernel_instruction address = match address {",
    ]
    for ins in instructions:
        decoder = "encdec_compressed" if ins["width"] == 2 else "encdec"
        lines.append(f'  0x{ins["address"]:016x} => Some(({decoder}(0x{ins["word"]:0{ins["width"] * 2}x}), {ins["width"]})),')
    lines += [
        "  _ => None(),", "}", "",
        "// Execute one instruction and commit PC only on successful retirement.",
        "// None means PC is outside the imported instruction boundaries.",
        "// A leaf function returns by setting PC to the caller's return sentinel.",
        "val kernel_step : unit -> option(ExecutionResult)",
        "function kernel_step () = match kernel_instruction(zero_extend(PC)) {",
        "  None() => None(),",
        "  Some((ins, width)) => {",
        "    nextPC = PC + to_bits(sizeof(xlen), width);",
        "    let result = if width == 2 & not(currentlyEnabled(Ext_Zca)) then",
        "      Illegal_Instruction()",
        "    else match execute(ins) {",
        "      ExecuteAs(expanded) => execute(expanded),",
        "      other_result => other_result,",
        "    };",
        "    match result {",
        "      Retire_Success() => PC = nextPC,",
        "      _ => (),",
        "    };",
        "    Some(result)",
        "  },", "}", "",
    ]
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines))
    report = {"elf_sha256": image.sha256, "symbol": symbol, "instructions": instructions,
              "semantics": "upstream Sail encdec/execute, static-code adapter",
              "typechecked": False, "refinement_proved": False}
    output.with_suffix(".json").write_text(json.dumps(report, indent=2) + "\n")
    return report


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("elf", type=Path)
    p.add_argument("symbol")
    p.add_argument("output", type=Path)
    a = p.parse_args()
    emit(a.elf, a.symbol, a.output)
